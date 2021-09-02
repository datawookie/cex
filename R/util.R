rename_symbols <- function(.data) {
  .data %>%
    rename(
      base = symbol1,
      quote = symbol2
    ) %>%
    mutate(
      pair = paste(base, quote, sep = "/")
    )
}

convert_timestamp <- function(timestamp, factor = 1) {
  as.POSIXct(as.numeric(timestamp) / factor, origin = "1970-01-01", tz = "UTC")
}
