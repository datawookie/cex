test_that("set api key and secret", {
  expect_true(set_api_key(CEX_API_KEY, CEX_API_SECRET))
})

test_that("get api key", {
  expect_equal(get_api_key(), CEX_API_KEY)
})

test_that("get api secret", {
  expect_equal(get_api_secret(), CEX_API_SECRET)
})
