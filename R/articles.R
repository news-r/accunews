#' Location
#' 
#' This endpoint retrieves latest local news articles around a specific city/location.
#'
#' @param lat,lon Coordinates to retrieve local news articles from.
#' @param radius Radius in miles. from coordinates, maximum 300 miles.
#' @param pages Number of pages of results to collect (100 per page).
#' 
#' @examples
#' \dontrun{
#'  local <- acc_location(27.964157, -82.452606, pages = 2)
#' }
#' 
#' @export
acc_location <- function(lat, lon, radius = 50, pages = 1) {
  assert_that(radius <= 300)

  url <- .make_url(lon = lon, lat = lat, radius = radius, endpoint = "articles")
  .call_api(url, pages = pages)

}