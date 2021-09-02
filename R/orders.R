#' Get open orders
#'
#' @return A tibble
#' @export
#'
#' @examples
#' open_orders()
open_orders <- function() {
  path <- "open_orders/"
  body <- list(
    key = get_api_key(),
    signature = get_api_signature(),
    nonce = get_api_nonce()
  )
  balance <- POST(path, body) %>%
    content() %>%
    map_dfr(as_tibble) %>%
    rename_symbols() %>%
    mutate(
      time = convert_timestamp(time, 1000),
      type = factor(type, levels = c("buy", "sell")),
      price = as.numeric(price),
      amount = as.numeric(amount),
      pending = as.numeric(pending)
    )
}
