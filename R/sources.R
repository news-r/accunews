#' Sources
#' 
#' Get local and world news sources.
#' 
#' @inheritParams articles
#' @param type Type of source/publisher to query for e.g. \code{politics} or \code{sports}.
#' 
#' @examples
#' \dontrun{
#'  src <- acc_world_sources(type = "business")
#' }
#' 
#' @name source
#' @export
acc_local_sources <- function(lat, lon, radius = 50, pages = 1) {
  assert_that(radius <= 300)
  url <- .make_url(lon = lon, lat = lat, radius = radius, endpoint = "sources")
  .call_api_sources(url, pages = pages)
}

#' @name source
#' @export
acc_world_sources <- function(popular = FALSE, type = NULL, pages = 1) {
  popular <- tolower(popular)
  url <- .make_url(popular = popular, type = type, endpoint = "sources")
  .call_api_sources(url, pages = pages)
}