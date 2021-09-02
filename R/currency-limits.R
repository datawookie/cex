#' Get currency limits for all pairs
#'
#' @return A tibble
#' @export
#'
#' @examples
#' currency_limits()
currency_limits <- function() {
  path <- "currency_limits"
  limits <- GET(path) %>%
    content()

  tibble(pairs = limits$data$pairs) %>%
    unnest_wider(pairs) %>%
    clean_names() %>%
    rename_symbols() %>%
    rename(
      min_lot_size_base = min_lot_size
    ) %>%
    select(pair, everything(), -min_lot_size_s2)
}
