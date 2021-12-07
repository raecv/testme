# note: context() is deprecated so no need to use

# initialize a test vector
vec <- sort(c(1, 3, 5, 89, 420, 7, 23, 4, 72))

# smoke tests
test_that("binary search returns index for ints in vec", {
  expect_equal(binary_search(vec, 5), 4)
  expect_equal(binary_search(vec, 420), 9)
})
#> Smoke test passed

# boundary tests
test_that("binary search of missing values returns 0", {
  expect_equal(binary_search(vec, 5000), 0)
  expect_equal(binary_search(vec, "sec"), 0)
  expect_equal(binary_search(vec, "NA"), 0)
})
#> Boundary test (missing values returns 0) passed

test_that("binary search thows an error with unexpected values", {
  expect_error(binary_search(vec, NA),
               'missing value where TRUE/FALSE needed')
  expect_error(binary_search(vec, NaN),
               'missing value where TRUE/FALSE needed')
})
#> Boundary test (unexpected values throw error) passed

test_that("binary search returns expected boolean results", {
  expect_equal(binary_search(vec, TRUE), 1)
  expect_equal(binary_search(vec, FALSE), 0)
})
#> Boundary test (returns expected boolean values) passed

test_that("binary search throws error when missing parameters", {
  expect_error(binary_search(vec), "missing, with no default")
  expect_error(binary_search(420), "missing, with no default")
})
#> Boundary test (throws error when missing parameters) passed
