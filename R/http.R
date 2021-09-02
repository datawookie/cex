api_url <- function(path) {
  paste0(BASE_PATH, path)
}

check_response <- function(response) {
  if (status_code(response) == 404) {
    stop("Page not found!", call. = FALSE)
  }
}

#' Wrapper for content()
#'
#' Asserts UTF-8 encoding.
#'
#' @param x A request object
#' @param type MIME type
content <- function(x, type = "application/json") {
  httr::content(x, type = type, encoding = "UTF-8")
}

#' GET an URL
#'
#' @noRd
#'
#' @param path The path of the endpoint.
#' @param query The query parameters.
#'
#' @inherit httr::GET return
GET <- function(path, query = NULL) {
  url <- api_url(path)
  log_debug("GET {url}")

  response <- httr::GET(
    url,
    query = query
  )

  check_response(response)

  response
}

#' POST file to an URL
#'
#' @noRd
#'
#' @param path The path of the endpoint.
#' @param body The body of the query.
#'
#' @inherit httr::POST return
POST <- function(path, body = NULL) {
  url <- api_url(path)
  log_debug("POST {url}")

  response <- httr::POST(
    url,
    body = body,
    encode = "json"
  )

  check_response(response)

  response
}

#' DELETE
#'
#' @noRd
#'
#' @param path The path of the endpoint.
#'
#' @inherit httr::DELETE return
DELETE <- function(path) {
  url <- api_url(path)
  log_debug("DELETE {url}")

  response <- httr::DELETE(
    url,
    add_headers(
      "X-Api-Key" = get_api_key()
    ),
    encode = "json"
  )

  check_response(response)

  response
}
