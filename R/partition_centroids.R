#' Partition coordinates by groups and find centers
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
#' @export
#'

partition_centroids <- function( data, stratum="Population", latitude="Latitude", longitude="Longitude") {
  if( !is.data.frame(data)) {
    stop("You must pass a data.frame object to this function.")
  }


}
