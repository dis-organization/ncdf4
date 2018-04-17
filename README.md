
[![Travis build status](https://travis-ci.org/mdsumner/ncdf4.svg?branch=master)](https://travis-ci.org/mdsumner/ncdf4)

<!-- README.md is generated from README.Rmd. Please edit that file -->
ncdf4
=====

The goal of ncdf4 is to provide an "Interface to Unidata netCDF (Version 4 or Earlier) Format Data Files".

This fork of the CRAN package `ncdf4` is intended to update the Windows build process, and specifically to add support for Thredds.

Alternatives:

-   Unidata provides [Visual Studio binaries](https://www.unidata.ucar.edu/downloads/netcdf/index.jsp) that can be used to put a build together
-   pmjherman has [this repo](https://github.com/pmjherman/r-ncdf4-build-opendap-windows)

Todo
----

-   check Makevars.win (assume can remove "DHAVE\_LIBUDUNITS2" but what about "-DHAVE\_DECL\_NC\_RENAME\_GRP=1"?)
-   add tests, especially for Thredds (make sure 32-bit Windows limitation is understood)
-   roxygenize?

Installation
------------

You can install the released version of ncdf4 from [CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ncdf4")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("mdsumner/ncdf4")
```

Example
-------

Read from Thredds (will only work in Windows 64-bit, not 32-bit).

``` r
u <- "http://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day"
nc <- ncdf4::nc_open(u)
class(nc)
#> [1] "ncdf4"
## note that "ncdf" argument is required to trigger use of ncdf4
r <- raster::raster(u, ncdf = TRUE, varname = "x_wind")
print(r)
#> class       : RasterLayer 
#> band        : 1  (of  3774  bands)
#> dimensions  : 1201, 2881, 3460081  (nrow, ncol, ncell)
#> resolution  : 0.125, 0.125  (x, y)
#> extent      : -0.0625, 360.0625, -75.0625, 75.0625  (xmin, xmax, ymin, ymax)
#> coord. ref. : +proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0 
#> data source : http://coastwatch.pfeg.noaa.gov/erddap/griddap/erdQSwind3day 
#> names       : Zonal.Wind 
#> z-value     : 932644800 
#> zvar        : x_wind 
#> level       : 1
```
