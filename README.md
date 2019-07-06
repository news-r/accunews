
<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/news-r/accunews.svg?branch=master)](https://travis-ci.org/news-r/accunews) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/news-r/accunews?branch=master&svg=true)](https://ci.appveyor.com/project/news-r/accunews) <!-- badges: end -->

accunews
========

Access local and world news from R with [AccuNews](https://www.accunewsapp.com).

Installation
------------

``` r
# install.packages("remotes")
remotes::install_github("news-r/accunews")
```

Articles:

-   `acc_local_articles`
-   `acc_world_articles`

Sources:

-   `acc_local_sources`
-   `acc_world_sources`

Setup
-----

Create a free account at [accunews.com](https://www.accunewsapp.com/api/v1/docs/#authentication).

``` r
accunews_key("xxXXxxXx")
```

Note that you can specify the `ACCUNEWS_API_KEY` key as an environment variable in your `.Renviron` for convenience.

Example
-------

``` r
library(accunews)

# get articles local (to somewhere)
acc_local_articles(27.964157, -82.452606, pages = 2)
#> ❯ Crawling page 1
#> ❯ Crawling page 2
#> # A tibble: 200 x 12
#>    title link  time  image summary readtime source_name source_icon
#>    <chr> <chr> <chr> <chr> <chr>   <chr>    <chr>       <chr>      
#>  1 Pare… http… 2019… http… ""      <NA>     WFLA        http://www…
#>  2 Hump… http… 2019… http… "- A w… 1 min r… FOX 13 NEWS http://www…
#>  3 Two … http… 2019… http… "TAMPA… 1 min r… WFLA        http://www…
#>  4 Ecke… http… 2019… http… "- It … 1 min r… FOX 13 NEWS http://www…
#>  5 TxDO… http… 2019… http… "TAMPA… 1 min r… WFLA        http://www…
#>  6 Gato… http… 2019… http… "Copyr… 1 min r… WFLA        https://ww…
#>  7 Stat… http… 2019… http… "Copyr… 1 min r… WFLA        http://www…
#>  8 Clic… http… 2019… http… "HILLS… 1 min r… WFLA        http://www…
#>  9 'Cli… http… 2019… http… "Previ… 1 min r… WFLA        http://www…
#> 10 NBC'… http… 2019… http… "\"Thi… 1 min r… WFLA        https://ww…
#> # … with 190 more rows, and 4 more variables: source_type <chr>,
#> #   source_lat <dbl>, source_lon <dbl>, source_address <chr>

# get business news sources
acc_world_sources(type = "business")
#> ❯ Crawling page 1
#> # A tibble: 56 x 17
#>    source_name source_parent_n… source_homepage source_lat source_lon
#>    <chr>       <chr>            <chr>                <dbl>      <dbl>
#>  1 Reuters     Thomson Reuters  www.reuters.com       43.7      -79.4
#>  2 Forbes      Forbes Media LLC www.forbes.com        40.7      -74.0
#>  3 Free        Vice Media, Inc. free.vice.com         40.7      -74.0
#>  4 MarketWatch Dow Jones & Com… www.marketwatc…       37.8     -122. 
#>  5 The Wall S… Dow Jones & Com… www.wsj.com           40.8      -74.0
#>  6 Washington… The Washington … www.washington…       38.9      -77.0
#>  7 Bloomberg.… Bloomberg L.P.   www.bloomberg.…       40.8      -74.0
#>  8 Entreprene… Entrepreneur Me… www.entreprene…       33.7     -118. 
#>  9 NPR.org     National Public… www.npr.org           38.9      -77.0
#> 10 Barrons On… Dow Jones & Com… www.barrons.com       38.9      -77.0
#> # … with 46 more rows, and 12 more variables: source_address <chr>,
#> #   source_icon <chr>, source_type <chr>, source_phone <chr>,
#> #   source_description <chr>, source_facebook <chr>, source_twitter <chr>,
#> #   source_instagram <chr>, source_youtube <chr>, source_email <chr>,
#> #   source_snapchat <chr>, source_pinterest <chr>
```
