#' Articles
#' 
#' This endpoint retrieves latest or most popular local or world news articles around a specific city/location.
#'
#' @param q Query to search for world latest articles.
#' @param lat,lon Coordinates to retrieve local news articles from.
#' @param radius Radius in miles. from coordinates, maximum 300 miles.
#' @param pages Number of pages of results to collect (100 per page).
#' @param popular Set to \code{TRUE} to retrieve popular local or world news.
#' 
#' @examples
#' \dontrun{
#'  world <- acc_world(popular = TRUE)
#'  local <- acc_local(27.964157, -82.452606, pages = 2)
#' }
#' 
#' @name articles
#' @export
acc_local <- function(lat, lon, popular = FALSE, radius = 50, pages = 1) {
  assert_that(radius <= 300)
  popular <- tolower(popular)
  url <- .make_url(lon = lon, lat = lat, radius = radius, popular = popular, endpoint = "articles")
  .call_api_articles(url, pages = pages)
}

#' @rdname articles
#' @export
acc_world <- function(q = NULL, popular = FALSE, pages = 1){
  popular <- tolower(popular)
  url <- .make_url(keyword = q, popular = popular, endpoint = "articles")
  .call_api_articles(url, pages = pages)
}