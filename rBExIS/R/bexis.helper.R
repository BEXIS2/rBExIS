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
    return(paste0(bexis.options("base_url"), "/api"))
  } else {
    return(paste0(bexis.options("base_url"), "/api", suffix))
  }
}

exists_option <- function(key) {
	
  if(!(exists(key, bexis.options())))
    return(FALSE)

  if(is.na(bexis.options(key)) )
    return(FALSE)

  if(bexis.options(key) == '')
    return(FALSE)

  return(TRUE)
}

get_auth_header <- function() {
  if(exists_option("authorization_bearer"))
  {
    return(sprintf("Bearer %s", bexis.options("authorization_bearer")))
  }

  if(exists_option("authorization_basic"))
  {
    return(sprintf("Basic %s", base64encode(charToRaw(bexis.options("authorization_basic")))))
  }

  return(NA);
}

get_response <- function(method, api_url) {
  
  auth_header <- get_auth_header()

  if(is.na(auth_header))
  {
    return(VERB(method, api_url, content_type("application/octet-stream"), accept("*/*")))
  }
  else
  {
    return(VERB(method, api_url, add_headers(Authorization = auth_header), content_type("application/octet-stream"), accept("*/*")))
  }
}


.onLoad <- function(lib, pkg) {

  #define packages to install
  packages <- c('httr', 'XML', 'jsonlite', 'base64enc', 'readr')

  #install all packages that are not already installed
  install.packages(setdiff(packages, rownames(installed.packages())))
  lapply(packages, require, character.only = TRUE)

  .bexis.env$.bexis.options = list(
    base_url = NA,
    download_directory = "downloads",
    authorization_bearer = NA,
    authorization_basic = NA
  )
}