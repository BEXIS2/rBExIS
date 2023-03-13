#' Getting all metadata objects from BExIS
#' 
#' The function provides access to data that on a BExIS II instance.
#' @return The function returns a list of metadata objects.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetMetadata()
#'       }
#' @export bexis.GetMetadata

bexis.GetMetadata <- function() 
{
  api_url <- get_api_url("/metadata")
  
  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", base64encode(charToRaw(bexis.options("authorization_basic"))))), content_type("application/octet-stream"), accept("*/*"))
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
#' @return The function returns a metadata of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetMetadataById(8)
#'       }
#' @export bexis.GetMetadataById

bexis.GetMetadataById <- function(id) 
{
  api_url <- paste0(get_api_url("/metadata"), "/", id)
  
  if(exists_option("authorization_bearer"))
  {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Bearer %s", bexis.options("authorization_bearer"))), content_type("application/octet-stream"), accept("*/*"))
  } else if(exists_option("authorization_basic")) {
    response <- VERB("GET", api_url, add_headers(Authorization = sprintf("Basic %s", base64encode(charToRaw(bexis.options("authorization_basic"))))), content_type("application/octet-stream"), accept("*/*"))
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


#' Getting metadata structures from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @return The function returns a metadata of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetMetadataStructures()
#'       }
#' @export bexis.GetMetadataStructures
bexis.GetMetadataStructures <- function() {
  api_url <- paste0(get_api_url("/structures"), "/")

  response <- get_response("GET", api_url)
  
  names(response)
  status_code(response)
  
  data <- content(response)
  
  print(data)
}