API_USER_ID = "api_user_id"
API_KEY = "api_key"
API_SECRET = "api_secret"

#' Set API credentials
#'
#' @param user_id API user ID.
#' @param key A CEX API key.
#' @param secret A CEX API secret.
#'
#' @export
#'
#' @examples
#' CEX_API_USER_ID  = Sys.getenv("CEX_USER_ID")
#' CEX_API_KEY      = Sys.getenv("CEX_API_KEY")
#' CEX_API_SECRET   = Sys.getenv("CEX_API_SECRET")
#'
#' set_credentials(CEX_API_USER_ID, CEX_API_KEY, CEX_API_SECRET)
set_credentials <- function(user_id = NULL, key = NULL, secret = NULL) {
  if (!is.null(user_id)) cache_set(API_USER_ID, user_id)
  if (!is.null(key)) cache_set(API_KEY, key)
  if (!is.null(secret)) cache_set(API_SECRET, secret)

  TRUE
}

#' Get User ID
#'
#' @return The user ID.
#' @export
#'
#' @examples
#' set_credentials(user_id = Sys.getenv("CEX_USER_ID"))
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
#' set_credentials(key = Sys.getenv("CEX_API_KEY"))
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
#' set_credentials(secret = Sys.getenv("CEX_API_SECRET"))
#' get_api_secret()
get_api_secret <- function() {
  api_secret <- cache_get(API_SECRET)
  if (is.null(api_secret)) stop("API secret has not been set.")
  api_secret
}

#' Get nonce
#'
#' If you change the way that the nonce is generated then you might need to
#' regenerate your API key. The reason for this is that the nonce associated
#' with any given key can only increase.
#'
#' @param digits Number of digits in nonce string.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' get_api_nonce()
get_api_nonce <- function(digits = 14) {
  nonce <- Sys.time() %>%
    # Seconds since epoch with sub-second resolution.
    strftime("%s %OS4") %>%
    sub(" ..\\.", "", .) %>%
    # Retain only last digits.
    substring(nchar(.) - digits + 1)

  log_debug("nonce = {nonce}")
  nonce
}

#' Get API signature
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' \dontrun{
#' get_api_signature()
#' }
get_api_signature <- function() {
  nonce <- get_api_nonce()

  message = digest::hmac(
    key = get_api_secret(),
    object = paste0(nonce, get_api_user_id(), get_api_key()),
    algo = 'sha256',
    serialize = FALSE
  ) %>%
    toupper()

  list(
    key = get_api_key(),
    signature = message,
    nonce = nonce
  )
}
