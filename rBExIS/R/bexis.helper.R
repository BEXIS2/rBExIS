# These functions are not documented with roxygen as they are not exposed to
# the user in the end. They are hepler functions that allow to dry the code of
# other functions in the package

# url related helpers
get_api_url <- function(suffix = '') 
{
  if(!(exists_option("base_url"))) {
    stop("Please set \"base_url\" within the options by bexis.options(\"base_url\" = \"YOUR.BASE.URL\").")
  } 

  if(is.na(suffix) || suffix == '')
  {
    return(paste0(bexis.options("base_url"), "api/"))
  } else {
    return(paste0(bexis.options("base_url"), "api/", suffix))
  }
}

exists_option <- function(key) {
	
  if(!(exists(bexis.options(key))))
    return(FALSE)

  if(is.na(bexis.options(key)) )
    return(FALSE)

  if(bexis.options(key) == '')
    return(FALSE)

  return(TRUE)
}

.onLoad <- function(lib, pkg) {

  library(devtools)
  library(httr)
  library(jsonlite)
  library(XML)

  .bexis.env$.bexis.options = list(
    base_url = NA,
    download_directory = "downloads",
    authorization_bearer = NA,
    authorization_basic = NA
  )
}