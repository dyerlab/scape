#' Grabs lat and lon and returns bbox
#'
#' Quick function to return a bounding box from a `data.frame` that
#'  has longitude and latitude columns.
#'
#' @param data A `data.frame` with coordinates in it.
#' @param longitude The name of the column for the x-axis coordinate
#' @param latitude The name of the column for the y-axis coordinate
#' @return A bounding box (left, bottom, right, top)
#'
#' @export
#' @author Rodney Dyer <rjdyer@@vcu.edu>

coords2bbox <- function(data, longitude="Longitude", latitude="Latitude") {

  if( !(longitude %in% names(data)) || !(latitude %in% names(data)) ) {
    stop("Please indicate the column names for the latitude and longitude in your data.frame")
  }

  ret <- c( left = min(data[[longitude]]),
            bottom = min(data[[latitude]]),
            right = max(data[[longitude]]),
            top =  max(data[[latitude]] ) )

  return( ret )

}
