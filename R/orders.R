#' Get open orders
#'
#' @return A tibble
#' @export
#'
#' @examples
#' \dontrun{
#' open_orders()
#' }
open_orders <- function() {
  path <- "open_orders/"
  body <- list(
    key = get_api_key(),
    signature = get_api_signature(),
    nonce = get_api_nonce()
  )
  POST(path, body) %>%
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

#' Get order details
#'
#' @param order_id Order ID.
#'
#' @return A data frame.
#' @export
#'
#' @examples
#' \dontrun{
#' get_order()
#' }
get_order <- function(order_id) {
  path <- "get_order/"
  body <- list(
    key = get_api_key(),
    signature = get_api_signature(),
    nonce = get_api_nonce()
  )

  body$id <- order_id

  POST(path, body) %>%
    content() %>%
    as_tibble() %>%
    clean_names() %>%
    rename_symbols() %>%
    select(-order_id)
}
