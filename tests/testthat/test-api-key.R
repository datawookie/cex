test_that("set api user ID, key and secret", {
  expect_true(set_credentials(CEX_API_USER_ID, CEX_API_KEY, CEX_API_SECRET))
})

test_that("get api user ID", {
  expect_equal(get_api_user_id(), CEX_API_USER_ID)
})

test_that("get api key", {
  expect_equal(get_api_key(), CEX_API_KEY)
})

test_that("get api secret", {
  expect_equal(get_api_secret(), CEX_API_SECRET)
})
