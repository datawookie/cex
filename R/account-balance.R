#' Get account balance
#'
#' @return A tibble
#' @export
#'
#' @examples
#' \dontrun{
#' account_balance()
#' }
account_balance <- function() {
  path <- "balance/"
  body <- get_api_signature()
  balance <- POST(path, body) %>%
    content()

  balance %>%
    as_tibble() %>%
    pivot_longer(cols = c(-timestamp, -username), names_to = "currency") %>%
    group_by(timestamp, username, currency) %>%
    summarise(value = list(value), .groups = "drop") %>%
    unnest_wider(value) %>%
    rename(time = timestamp) %>%
    mutate(
      time = convert_timestamp(time)
    )
}
