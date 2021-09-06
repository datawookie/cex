#' @import httr
#' @import dplyr
#' @importFrom glue glue
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
    "curr1",
    "curr2",
    "d",
    "last_tx_time",
    "lprice",
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

TYPES = c("buy", "sell", "cancel")
