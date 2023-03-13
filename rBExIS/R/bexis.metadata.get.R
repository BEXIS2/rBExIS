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
  
  response <- get_response("GET", api_url)
  
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
  
  response <- get_response("GET", api_url)
   
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

#' Getting a single metadata structure from BExIS
#'
#' The function provides access to data that on a BExIS II instance.
#' @param id Is the ID of the metadata structure you want to access
#' @return The function returns a metadata of the requested dataset.
#' An error is provided in case the data is not found or if you don't
#' have the rights to access it.
#'
#' @examples \dontrun{
#'         bexis.GetMetadataStructureById(8)
#'       }
#' @export bexis.GetMetadataStructureById

bexis.GetMetadataStructureById <- function(id) 
{
  api_url <- paste0(get_api_url("/structures"), "/", id)
  
  response <- get_response("GET", api_url)
   
  names(response)
  if(status_code(response) != 200)
  {
    print(status_code(response))
  }

  print(content(response))
}