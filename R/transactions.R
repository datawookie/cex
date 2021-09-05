#' Get order transactions
#'
#' @param transaction_id Transaction ID
#'
#' @return A tibble
#' @export
#'
#' @examples
#' \dontrun{
#' get_order_tx()
#' }
get_order_tx <- function(order_id) {
  path <- glue("get_order_tx/")
  body <- get_api_signature()
  body$id <- order_id
  POST(path, body) %>%
    content() %>%
    .$data %>%
    .$vtx %>%
    map_dfr(function(order) {
      ifelse(sapply(order, is.null), NA, order) %>%
        as_tibble() %>%
        mutate_at(
          vars(matches("^[cd]s$")),
          as.numeric
        )
    }) %>%
    mutate_at(
      c("a", "amount", "balance"),
      as.numeric
    ) %>%
    mutate(
      time = anytime(time) %>% force_tz("UTC"),
      type = factor(type, levels = TYPES)
    ) %>%
    select(id, time, everything(), -c, -d)
}
