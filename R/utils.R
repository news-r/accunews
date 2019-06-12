globalVariables(c("."))

BASE_URL <- "https://www.accunewsapp.com"
BASE_PATH <- c("api", "v1")

.get_key <- function() {
  key <- Sys.getenv("ACCUNEWS_API_KEY")
  assert_that(nchar(key) > 0, msg = "Missing key")
  return(key)
}

.make_url <- function(..., endpoint = "articles"){
  url <- parse_url(BASE_URL)
  url$path <- c(BASE_PATH, endpoint)
  url$query <- list(
    ...,
    limit = 100,
    apiKey = .get_key()
  )
  build_url(url)
}

.call_api_articles <- function(url, pages = 1){

  cat(blue(symbol$pointer), "Crawling page 1\n")

  # initial call to get `next`
  content <- .call_it(url)
  results <- .parse_articles(content)

  # paginate
  p = 1 
  while(p < pages && length(content$`next`)){
    p <- p + 1 
    cat(blue(symbol$pointer), "Crawling page", p, "\n")
    content <- .call_it(content$`next`)
    page_results <- .parse_articles(content)
    results <- bind_rows(results, page_results)
    Sys.sleep(1) # rate limit of 60 / minute
  }

  return(results)
}

.call_api_sources <- function(url, pages = 1){

  cat(blue(symbol$pointer), "Crawling page 1\n")

  # initial call to get `next`
  content <- .call_it(url)
  results <- .parse_sources(content)

  # paginate
  p = 1 
  while(p < pages && length(content$`next`)){
    p <- p + 1 
    cat(blue(symbol$pointer), "Crawling page", p, "\n")
    content <- .call_it(content$`next`)
    page_results <- .parse_sources(content)
    results <- bind_rows(results, page_results)
    Sys.sleep(1) # rate limit of 60 / minute
  }

  return(results)
}

.call_it <- function(url){
  response <- GET(url)
  stop_for_status(response)
  content(response)
}

.parse_articles <- function(content){
  source <- content$results %>% 
    map("source") %>% 
    map_dfr(function(x){
      x <- flatten(x)
      tibble::as_tibble(x)
    }) %>% 
    set_names(paste0("source_", names(.)))

  rez <- content$results %>% 
    map_dfr(function(x){
      x$source <- NULL
      x <- map(x, function(c){
        if(is.null(c)) c <- NA
        return(c)
      })
      tibble::as_tibble(x)
    })

  dplyr::bind_cols(rez, source)
}

.parse_sources <- function(content){
  content$results %>% 
    map_dfr(function(x){
      x$coords$type <- NULL
      x <- flatten(x)
      tibble::as_tibble(x)
    }) %>% 
    set_names(paste0("source_", names(.)))
}