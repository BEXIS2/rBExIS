# rBExIS

A package to exchange data and metadata in RStudio and BEXIS2 instances.

## Requirements

- R (e.g. https://cran.r-project.org/bin/windows/base/ for Windows, otherwise start [here](https://cran.r-project.org/bin/))
- RStudio (https://www.rstudio.com/products/rstudio/download/#download)
- Rtools (e.g. https://cran.r-project.org/bin/windows/Rtools/ for Windows, , otherwise start [here](https://cran.r-project.org/bin/))

## Install

Because the rBExIS package is not available through the RStudio package manager, you need to install it from GitHub. But therefore, you need to install and load _devtools_ first.

```r
#install devtools and add to libary
install.packages("devtools")
library(devtools)

```

After that, you should be able to load rBExIS within RStudio. And please do not forget to load it as well.

```r
install_github("BEXIS2/rBExIS", subdir = "rBExIS")
library(rBExIS)
```

## Additional Commands

After installing the package, there are several commands in addition that you might want to execute. With the following one, you are able to (re-)load all functions from rBExIS.

```r
load_all("rBExIS")
```

Furthermore, the next one is used to check the consistency of the package.

```r
check("rBExIS")
```

## Preparation

Before you are actually able to use the package, you need add proper values to the configuration (options). To get a general overview of the options, please use the following command.

```r
bexis.options()
```

You need to set at least the _"base_url"_ which is the domain/url of that BEXIS2 instance you would like to work with. The example would connect rBExIS to the BEXIS2 instance that is running at "https://demo.bexis2.uni-jena.de/".

```r
bexis.options("base_url" = "https://demo.bexis2.uni-jena.de/")
```

Within BEXIS2, the functions are either publically available (i.e. no authentication/authorization is needed to execute the function). On the other side, other functions may need authentication to verify the user of that function. For this reason, you have two different opportunities within rBExIS. Either go with the token from your account (Bearer), or use the username and password instead (Basic). The first example uses basic authentication with administrator (username) and administrator (password). Please be aware of the ":" (colon) in between.

```r
bexis.options("authorization_basic" = "administrator:administrator")
```

The second example is equivalent in the sense of the user and rights. But instead of basic authentication, it uses the bearer token for authentication.

```r
bexis.options("authorization_bearer" = "KJkSKJxEoiXwk9ipAvKkNEJ9isGGi64drtQDRf9KKCDRKSE5JYvz5j8Yx5Unvto5")
```

So, in general there is no difference in which method you could/should use. If you know your token, you might go with it. But instead of yourself into the system and retrieve the token, you can also use your username and password directly.

## Functions

That section summarizes the set of functions that are available within rBExIS.

### List of Dataset Ids

```r
bexis_dataset_ids <- rBExIS::bexis.GetDatasetIds()
```

### Data of specific Dataset

That function uses the parameter _id_ to identify the specific dataset you would like to get the data from.

```r
bexis_data <- rBExIS::bexis.GetDatasetById(id)
```

### List of Metadata Objects

```r
bexis_metadata_list <- rBExIS::bexis.GetMetadata()
```

### Metadata of specific Dataset

That function uses the parameter _id_ to identify the specific dataset you would like to get the metadata from.

```r
bexis_metadata <- rBExIS::bexis.GetMetadataById(id)
```

### List of Data Structures

```r
bexis_structures <- rBExIS::bexis.GetDataStructures()
```

### Data Structure of specific Dataset

That function uses the parameter _id_ to identify the specific data structure you would like to get the information/details from.

```r
bexis_structures <- rBExIS::bexis.GetDataStructureBy()
```

## How to contribute?

* Fork
* Implement/Fix
* Send pull request
* Wait and pray!
