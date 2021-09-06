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

Endpoints which have currently been implemented in this package.

### Public API calls

-   [x] GET <https://cex.io/api/currency_limits>
-   [x] GET <https://cex.io/api/ticker/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [x] GET
    <https://cex.io/api/tickers/%7Bsymbol1%7D/%7Bsymbol2%7D/>…/{symbolN}
-   [x] GET <https://cex.io/api/last_price/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] GET
    <https://cex.io/api/last_prices/%7BmarketSymbol1%7D/%7BmarketSymbol2%7D/>…/{marketSymbolN}
-   [ ] POST <https://cex.io/api/convert/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] POST
    <https://cex.io/api/price_stats/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] GET
    <https://cex.io/api/ohlcv/hd/%7Bdate%7D/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] GET <https://cex.io/api/order_book/%7Bsymbol1%7D/%7Bsymbol2%7D/>
-   [ ] GET
    <https://cex.io/api/trade_history/%7Bsymbol1%7D/%7Bsymbol2%7D/>

### Private API calls

-   [x] POST <https://cex.io/api/balance/>
-   [x] POST <https://cex.io/api/open_orders/>
-   [ ] POST
    <https://cex.io/api/open_orders/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] POST <https://cex.io/api/active_orders_status>
-   [x] POST
    <https://cex.io/api/archived_orders/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] POST <https://cex.io/api/cancel_order/>
-   [ ] POST
    <https://cex.io/api/cancel_orders/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [ ] POST
    <https://cex.io/api/place_order/%7Bsymbol1%7D/%7Bsymbol2%7D>
-   [x] POST <https://cex.io/api/get_order/>
-   [x] POST <https://cex.io/api/get_order_tx/>
-   [ ] POST <https://cex.io/api/get_address/>
-   [ ] POST <https://cex.io/api/get_myfee/>
-   [ ] POST
    <https://cex.io/api/cancel_replace_order/%7Bsymbol1%7D/%7Bsymbol2%7D>
