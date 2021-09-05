#' Parse ticker data
#'
#' @noRd
#'
parse_ticker <- function(ticker) {
  ticker %>%
    as_tibble() %>%
    rename(time = timestamp) %>%
    clean_names() %>%
    mutate(
      time = convert_timestamp(time)
    )
}

#' Get ticker
#'
#' Wraps \code{GET https://cex.io/api/ticker/{symbol1}/{symbol2}}.
#'
#' @param base Base currency
#' @param quote Quote currency
#'
#' @return A tibble
#' @export
#'
#' @examples
#' ticker("ETH", "USD")
ticker <- function(base, quote) {
  path <- sprintf("ticker/%s/%s", base, quote)
  GET(path) %>%
    content() %>%
    parse_ticker()
}

#' Get tickers
#'
#' Get tickers for a selection of quote currencies.
#'
#' Wraps \code{https://cex.io/api/tickers/{symbol1}/{symbol2}/.../{symbolN}}.
#'
#' @param symbols A vector of ticker symbols to be used as quote currency in pairs
#'
#' @return A tibble
#' @export
#'
#' @examples
#' # All pairs with USD as quote.
#' tickers("USD")
#' # All pairs with ETH or BTC as quote.
#' tickers(c("ETH", "BTC"))
tickers <- function(symbols) {
  path <- sprintf("tickers/%s", paste(symbols, collapse = "/"))
  GET(path) %>%
    content() %>%
    .$data %>%
    map_dfr(parse_ticker)
}
