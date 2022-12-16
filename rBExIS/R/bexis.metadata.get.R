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
  api_url <- get_api_url("metadata/")
  
  if(exists_authorization_bearer())
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options(authorization_bearer)), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_authorization_basic()) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", bexis.options(authorization_basic)), content_type("application/octet-stream"), accept("*/*"))
  } else {
    response <- VERB("GET", api_url, add_headers(content_type("application/octet-stream"), accept("*/*"))
  }
  
  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)
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

bexis.get.metadata_by <- function(id, base_url = bexis.options("base_url"), token = bexis.options("token")) {
  function_requires_base_url()
  
  url = paste0(get_download_url("base_url"),"Metadata/", id);
  
  # get metadata
  response <- GET(url, add_headers(`Authorization` = sprintf("bearer %s", token)))
  
  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)

}

#' Getting all structures from BExIS
#'
#' The function provides access to structure that on a BExIS II instance.
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a list of structure ids.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.structures()
#'       }
#' @export bexis.get.structures

bexis.get.structures <- function(base_url = bexis.options("base_url"), token = bexis.options("token")) {
  function_requires_base_url()
  
  url = paste0(get_download_url("base_url"),"Structures/");
  
  # get metadata
  response <- GET(url, add_headers(`Authorization` = sprintf("bearer %s", token)))
  
  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)
}

#' Getting structure from BExIS
#'
#' The function provides access to structure that on a BExIS II instance.
#' @param id Is the ID of the structure you want to access
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a structure.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.structure_by(id=8)
#'       }
#' @export bexis.get.structure_by

bexis.get.structure_by <- function(id, base_url = bexis.options("base_url"), token = bexis.options("token")) {
  function_requires_base_url()
  
  url = paste0(get_download_url("base_url"),"Structures/", id);
  
  # get metadata
  response <- GET(url, add_headers(`Authorization` = sprintf("bearer %s", token)))
  
  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)
}
