#' @import httr
#' @import dplyr
#' @import tidyr
#' @import purrr
#' @import janitor
#' @import logger
#' @import anytime
#' @import lubridate
NULL

BASE_PATH = "https://cex.io/api/"

globalVariables(
  c(
    ".",
    "amount",
    "base",
    "currency",
    "min_lot_size",
    "min_lot_size_s2",
    "pair",
    "pairs",
    "pending",
    "price",
    "symbol1",
    "symbol2",
    "time",
    "timestamp",
    "type",
    "username",
    "value"
  )
)
