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
  body <- list(
    key = get_api_key(),
    signature = get_api_signature(),
    nonce = get_api_nonce()
  )
  balance <- POST(path, body) %>%
    content() %>%
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
