test_that("missing data", {


  x <- 23.3
  expect_that( strata_centroids(x), throws_error("You must pass a data.frame object to this function.") )

  data <- data.frame(Levels = c("A","A","B","B"))
  expect_that( strata_centroids(data), throws_error() )
  names(data)[1] <- "Population"

  expect_that( strata_centroids(data), throws_error() )
  data$Latitude <- c(26.4, 26.6, 32.7, 33.4)

  expect_that( strata_centroids(data), throws_error() )
  data$Longitude <- c(-77.3, -77.6, -84.2, -86.3)

  df <- strata_centroids(data)


  expect_true( is.data.frame(df) )


})
