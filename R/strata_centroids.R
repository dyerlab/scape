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
#' @param mode The format of the returned object as a data.frame (default), spatialPoints or sf object.
#' @return A data.frame object with strata and latitude and longitude
#'
#' @author Rodney J. Dyer <rjdyer@@vcu.edu>
#' @importFrom dplyr group_by summarize
#' @importFrom sp SpatialPoints
#' @importFrom sf st_as_sf
#' @export
#'

strata_centroids <- function( data, stratum="Population", longitude="Longitude", latitude="Latitude", mode=c("data.frame","SpatialPoints", "sf")[1]) {

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

  df <- dplyr::group_by( data, get(stratum) ) %>%
    dplyr::summarize(X = mean( get(longitude)), Y = mean( get(latitude))  ) %>%
    as.data.frame()

  names(df) <- c(stratum,longitude,latitude)

  if( mode == "SpatialPoints") {
    ret <- data.frame(df[,c(2:3)])
    row.names(ret) <- df[,1]
    ret <- sp::SpatialPoints( ret[,c(longitude,latitude)] )
    return(  ret )

  }
  else if( mode == "sf") {

    return( sf::st_as_sf(x=df, coords=c(longitude,latitude) ) )

  } else {
    return(df)
  }

}
