# These functions are not documented with roxygen as they are not exposed to
# the user in the end. They are hepler functions that allow to dry the code of
# other functions in the package

# url related helpers
get_api_url <- function(suffix = '') 
{
  if(!(exists_base_url())) {
    stop("Please set \"base_url\" within the options by bexis.options(\"base_url\" = \"YOUR.BASE.URL\").")
  } 

  if(is.na(suffix) || suffix == '')
  {
    return(paste0(bexis.options("base_url"), "api/"))
  } else {
    return(paste0(bexis.options("base_url"), "api/", suffix))
  }
}

exists_base_url <- function() {
	if(is.na(bexis.options("base_url")) || bexis.options("base_url") == '')
	{
		return(FALSE)
	} else {
		return(TRUE)
	}
}

exists_authorization_bearer <- function() {
	if(is.na(bexis.options("authorization_bearer")) || bexis.options("authorization_bearer") == '')
	{
		return(FALSE)
	} else {
		return(TRUE)
	}
}

exists_authorization_basic <- function() {
	if(is.na(bexis.options("authorization_basic")) || bexis.options("authorization_basic") == '')
	{
		return(FALSE)
	} else {
		return(TRUE)
	}
}

.onLoad <- function(lib, pkg) {

  library(devtools)
  library(httr)
  library(jsonlite)
  library(XML)

  .bexis.env$.bexis.options = list(
    base_url = NA,
    download_directory = "downloads",
    authorization_token = NA,
    authorization_basic = NA
  )
}