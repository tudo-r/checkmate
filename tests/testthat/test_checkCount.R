context("checkCount")

test_that("checkCount", {
  myobj = 1
  expect_succ_all(Count, myobj)
  myobj = -1
  expect_fail_all(Count, myobj)

  expect_false(testCount(integer(0)))
  expect_false(testCount(NULL))
  expect_false(testCount(FALSE))
  expect_false(testCount(TRUE))

  expect_true(testCount(0L))
  expect_false(testCount(0L, positive = TRUE))
  expect_true(testCount(1L, positive = TRUE))
  expect_true(testCount(1))
  expect_true(testCount(0))
  expect_false(testCount(-1))
  expect_false(testCount(0.5))
  expect_false(testCount(NA_integer_))
  expect_true(testCount(NA, na.ok = TRUE))
  expect_true(testCount(NA_integer_, na.ok = TRUE))
  expect_false(testCount(1:2))

  expect_false(is.integer(assertCount(5)))
  expect_true(is.integer(assertCount(5, coerce = TRUE)))

  expect_error(assertCount(-1), ">= 0")
})
