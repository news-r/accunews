#' Setup
#' 
#' Setup your session, all subsequent calls will be done using the API key.
#'
#' @param key Your API key, freely available at \url{https://www.accunewsapp.com/api/v1/docs/#authentication}.
#' 
#' @note You can specify \code{ACCUNEWS_API_KEY} as environment variable, likely in your \code{.Renviron} file.
#' 
#' @examples
#' \dontrun{
#' accunews_key("xXXxxXxXxXXx")  
#' }
#' 
#' @import purrr
#' @import httr
#' @import dplyr
#' @import assertthat
#' @import cli
#' @import crayon
#' 
#' @name authenticate
#' @export
accunews_key <- function(key){
  assert_that(!missing(key), msg = "Missing key")
  Sys.setenv(ACCUNEWS_API_KEY = key)
}

accunews_auth <- function(email, password){
  url <- parse_url(BASE_URL)
  url$path <- c(BASE_PATH, "auth")
  url <- build_url(url)

  body  <- list(
    email = email,
    password = password
  )

  response <- POST(url, body = body, encode = "json", content_type_json())
  stop_for_status(response)
  content <- content(response)
  accunews_key(content[["apiKey"]])
  invisible(content)
}