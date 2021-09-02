API_USER_ID = "api_user_id"
API_KEY = "api_key"
API_SECRET = "api_secret"

#' Set API credentials
#'
#' @param api_key A CEX API key
#' @param api_secret A CEX API secret
#'
#' @export
#'
#' @examples
#' CEX_API_USER_ID  = Sys.getenv("CEX_USER_ID")
#' CEX_API_KEY      = Sys.getenv("CEX_API_KEY")
#' CEX_API_SECRET   = Sys.getenv("CEX_API_SECRET")
#' set_api_key(CEX_API_KEY, CEX_API_SECRET)
set_credentials <- function(user_id, key, secret) {
  cache_set(API_USER_ID, user_id)
  cache_set(API_KEY, key)
  cache_set(API_SECRET, secret)

  TRUE
}

#' Get User ID
#'
#' @return The user ID.
#' @export
#'
#' @examples
#' get_api_user_id()
get_api_user_id <- function() {
  api_key <- cache_get(API_USER_ID)
  if (is.null(api_key)) stop("API user ID has not been set.")
  api_key
}

#' Get API key
#'
#' @return The API key.
#' @export
#'
#' @examples
#' get_api_key()
get_api_key <- function() {
  api_key <- cache_get(API_KEY)
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
  api_secret <- cache_get(API_SECRET)
  if (is.null(api_secret)) stop("API secret has not been set.")
  api_secret
}

#' Get nonce
#'
#' @return
#' @export
#'
#' @examples
#' get_api_nonce()
get_api_nonce <- function(digits = 11) {
  Sys.time() %>%
    # Seconds since epoch with sub-second resolution.
    strftime("%s %OS1") %>%
    sub(" ..\\.", "", .) %>%
    # Retain only last digits.
    substring(nchar(.) - digits + 1)
}

#' Get API signature
#'
#' @return
#' @export
#'
#' @examples
#' get_api_signature()
get_api_signature <- function() {
  message = paste0(get_api_nonce(), get_api_user_id(), get_api_key())
  digest::hmac(
    key = get_api_secret(),
    object = message,
    algo = 'sha256',
    serialize = FALSE
  ) %>%
    toupper()
}
