#' Getting a single metadata structure from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetDatasetIds()
#'       }
#' @export bexis.GetDatasetIds

bexis.GetDatasetIds <- function() 
{
  api_url <- paste0(get_api_url("/data"), "/")
  
  response <- get_response("GET", api_url)
   
  names(response)
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}

#' Getting a single dataset from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param id Is the ID of the metadata structure you want to access
#' @return The function returns a metadata of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetDatasetById(8)
#'       }
#' @export bexis.GetDatasetById

bexis.GetDatasetById <- function(id) 
{
  api_url <- paste0(get_api_url("/data"), "/", id)
  
  response <- get_response("GET", api_url)
   
  names(response)
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}

#' Getting all dataset ids from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a list of dataset ids.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.datasets(id=8)
#'       }
#' @export bexis.get.datasets

bexis.get.datasets <- function() 
{
  api_url <- get_api_url("/data")
  
  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", bexis.options("authorization_basic"))), content_type("application/octet-stream"), accept("*/*"))
  } else {
    response <- VERB("GET", api_url, content_type("application/octet-stream"), accept("*/*"))
  }
  
  names(response)
  status_code(response)
  
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}


#' Getting data from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param id Is the ID of the dataset you want to access
#' @param base_url Is the URL of the BExIS instance (e.g. www.mybexis.de)
#' If the base url is already provided by the function bexis.options()
#'  then this value will be taken and you do not need to provide it again.
#' @param token is an authorization key to access the data in Bexis. Get the token key in practice user profile.
#'
#' @return The function returns a data frame of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.get.dataset_by(id=8)
#'       }
#' @export bexis.get.dataset_by

bexis.get.dataset_by <- function(id, base_url = bexis.options("base_url"), token = bexis.options("token")) {
	function_requires_base_url()

  response <- GET(paste0(get_download_url("base_url"),"Data/", id), add_headers(`Authorization` = sprintf("bearer %s", token)))

  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)

}

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

bexis.get.metadatas <- function(base_url = bexis.options("base_url"), token = bexis.options("token")) {
  function_requires_base_url()
  
  url = paste0(get_download_url("base_url"),"Metadata/");
  
  # get metadata
  response <- GET(url, add_headers(`Authorization` = sprintf("bearer %s", token)))
  
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

bexis.get.structures <- function() {
  api_url <- paste0(get_api_url("/structures"), "/")

  get_response(api_url, "GET", )

  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", base64encode(charToRaw(bexis.options("authorization_basic"))))), content_type("application/octet-stream"), accept("*/*"))
  } else {
    response <- VERB("GET", api_url, content_type("application/octet-stream"), accept("*/*"))
  }
  
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
