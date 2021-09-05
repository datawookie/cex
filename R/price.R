#' Get last price
#'
#' Wraps \code{GET https://cex.io/api/last_price/{symbol1}/{symbol2}}.
#'
#' @param base Base currency
#' @param quote Quote currency
#'
#' @return A tibble
#' @export
#'
#' @examples
#' last_price("ETH", "USD")
#' last_price("BTC", "USD")
last_price <- function(base, quote) {
  path <- sprintf("last_price/%s/%s", base, quote)
  GET(path) %>%
    content() %>%
    as_tibble() %>%
    select(
      base = curr1,
      quote = curr2,
      price = lprice
    )
}
