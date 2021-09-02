{cex}
================

<!-- README.md is generated from README.Rmd. Please edit that file -->

# cex <img src="man/figures/cex-hex.png" align="right" alt="" width="120" />

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/cex)](https://cran.r-project.org/package=cex)
[![Travis-CI build
status](https://travis-ci.org/datawookie/cex.svg?branch=master)](https://travis-ci.org/datawookie/cex)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/datawookie/cex.svg)](https://codecov.io/github/datawookie/cex)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R-CMD-check](https://github.com/datawookie/cex/workflows/R-CMD-check/badge.svg)](https://github.com/datawookie/cex/actions)
<!-- badges: end -->

An R wrapper around the [CEX API](https://cex.io/rest-api).

The documentation for `{cex}` is hosted at
<https://datawookie.github.io/cex/>.

## API Key

You’re going to need to have an API key from your CEX account. If you
don’t yet have an account, create one. Then create and active a key from
the [API settings](https://cex.io/trade/profile#/api). Store the key and
secret somewhere secure.

## Endpoints

### Public API calls

-   [x] Currency limits
-   [ ] Ticker
-   [ ] Tickers for all pairs by markets
-   [ ] Last price
-   [ ] Last prices for given markets
-   [ ] Converter
-   [ ] Chart
-   [ ] Historical 1m OHLCV Chart
-   [ ] Orderbook
-   [ ] Trade history

### Private API calls

-   [x] Account balance
-   [x] Open orders
-   [ ] Open orders by pair
-   [ ] Active order status
-   [ ] Archived orders
-   [ ] Cancel order
-   [ ] Cancel all orders for given pair
-   [ ] Place order
-   [x] Get order details
-   [ ] Get order transactions
-   [ ] Get crypto address
-   [ ] Get my fee
-   [ ] Cancel replace order
