API_KEY = "api_key"
API_SECRET = "api_secret"

#' Set API key
#'
#' @param api_key A CEX API key
#' @param api_secret A CEX API secret
#'
#' @export
#'
#' @examples
#' CEX_API_KEY    = Sys.getenv("CEX_API_KEY")
#' CEX_API_SECRET = Sys.getenv("CEX_API_SECRET")
#' set_api_key(CEX_API_KEY, CEX_API_SECRET)
set_api_key <- function(api_key, api_secret) {
  assign(API_KEY, api_key, envir = cache)
  assign(API_SECRET, api_secret, envir = cache)

  TRUE
}

#' Get API key
#'
#' @return The API key.
#' @export
#'
#' @examples
#' get_api_key()
get_api_key <- function() {
  api_key <- get(API_KEY, envir = cache)
  if (is.null(api_key)) stop("API key has not been set.")
  api_key
}

#' Get API secret
#'
#' @return The API secret.
#' @export
#'
#' @examples
#' get_api_key()
get_api_secret <- function() {
  api_secret <- get(API_SECRET, envir = cache)
  if (is.null(api_secret)) stop("API secret has not been set.")
  api_secret
}
