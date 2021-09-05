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
  body <- get_api_signature()
  orders <- POST(path, body) %>%
    content()

  orders %>%
    map_dfr(as_tibble) %>%
    rename_symbols() %>%
    mutate(
      time = convert_timestamp(time, 1000),
      type = factor(type, levels = TYPES),
      price = as.numeric(price),
      amount = as.numeric(amount),
      pending = as.numeric(pending)
    ) %>%
    select(id, time, base, quote, pair, everything())
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
  body <- get_api_signature()

  body$id <- order_id

  order <- POST(path, body) %>%
    content()

  order %>%
    as_tibble() %>%
    clean_names() %>%
    rename_symbols() %>%
    select(-order_id)
}

#' Get archived orders
#'
#' @param base Base currency
#' @param quote Quote currency
#'
#' @return A tibble
#' @export
#'
#' @examples
#' \dontrun{
#' archived_orders()
#' }
archived_orders <- function(base, quote) {
  path <- glue("archived_orders/{base}/{quote}")
  body <- get_api_signature()
  orders <- POST(path, body) %>%
    content()

  orders %>%
    map_dfr(function(order) {
      ifelse(sapply(order, is.null), NA, order)
    }) %>%
    clean_names() %>%
    rename_symbols() %>%
    mutate(
      time = anytime(time) %>% force_tz("UTC"),
      last_tx_time = anytime(last_tx_time) %>% force_tz("UTC"),
      type = factor(type, levels = TYPES),
      price = as.numeric(price),
      amount = as.numeric(amount)
    ) %>%
    select(id, time, base, quote, pair, everything())
}
