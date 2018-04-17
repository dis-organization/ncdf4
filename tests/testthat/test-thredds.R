context("test-thredds.R")
u <- "http://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day"

test_that("thredds works", {
  expect_that(ncdf4::nc_open(u), is_a("ncdf4"))
  
  expect_that(raster::raster(u, ncdf = TRUE, varname = "x_wind"), is_a("BasicRaster"))
  
})
