#' Getting all metadata objects from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a list of metadata objects.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.metadatas()
#'       }
#' @export bexis.get.metadatas

bexis.get.metadata <- function() 
{
  api_url <- get_api_url("/metadata")
  
  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", bexis.options("authorization_basic"))), content_type("application/octet-stream"), accept("*/*"))
  } else {
    response <- VERB("GET", api_url, content_type("application/octet-stream"), accept("*/*"))
  }
  
  names(response)
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}

#' Getting metadata from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param id Is the ID of the dataset you want to access
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a metadata of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.metadata_by(id=8)
#'       }
#' @export bexis.get.metadata_by

bexis.get.metadata <- function(id) 
{
  api_url <- paste0(get_api_url("/metadata"), "/", id)
  
  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", bexis.options("authorization_basic"))), content_type("application/octet-stream"), accept("*/*"))
  } else {
    response <- VERB("GET", api_url, content_type("application/octet-stream"), accept("*/*"))
  }
  
  names(response)
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}