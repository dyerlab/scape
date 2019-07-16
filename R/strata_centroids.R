#' Partition coordinates by strata and find mean coordinates
#'
#' This function partitions the data.frame or tibble into subgroups
#'   and returns the names and centroids of the strata.
#'
#' @param data A data frame object with coordinates and a column to be used as
#'    stratum designations.
#' @param stratum The name of the column to use as the partition.
#' @param latitude The name of the column with the Y-coordinate (default = Latitude)
#' @param longitude The name of the column with the X-coordinate (default = Longitude)
#' @return A data.frame object with strata and latitude and longitude
#'
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @import dplyr
#' @export
#'

strata_centroids <- function( data, stratum="Population", longitude="Longitude", latitude="Latitude") {
  library(dplyr)
  if( !is.data.frame(data) ) {
    stop("You must pass a data.frame object to this function.")
  }

  if( !( stratum %in% names(data))) {
    stop("You must specify a column for stratum that is actually in the data...")
  }

  if( !(latitude %in% names(data))) {
    stop("You need top specify a y-coordiante.")
  }
  if( !(longitude %in% names(data))) {
    stop("You need top specify a x-coordiante.")
  }

  df <- group_by( data, get(stratum) ) %>% summarize(X = mean( get(longitude)), Y = mean( get(latitude))  )
  names(df) <- c(stratum,longitude,latitude)
  return(df)
}
