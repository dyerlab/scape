test_that("coords", {


  data <- data.frame( X = c(1,2,3), Y = c(4,5,6) )

  expect_that( coords2bbox(data), throws_error("Please indicate the column names for the latitude and longitude in your data.frame"))

  expect_that( coords2bbox(data, longitude="X"), throws_error("Please indicate the column names for the latitude and longitude in your data.frame"))

  expect_that( coords2bbox(data, latitude="Y"), throws_error("Please indicate the column names for the latitude and longitude in your data.frame"))

  bx <- coords2bbox(data, longitude="X", latitude="Y")

  names(data) <- c("Longitude","Latitude")

  by <- coords2bbox( data )

  expect_equal( bx, by )

  expect_equal( as.numeric(bx), c(1,4,3,6) )

})
