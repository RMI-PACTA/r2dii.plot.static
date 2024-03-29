test_that("inputs a data frame structured as example_data", {
  expect_no_error(process_input_data(fake_example_data()))
})

test_that("outputs a visible data frame", {
  expect_s3_class(process_input_data(fake_example_data()), "data.frame")
  expect_visible(process_input_data(fake_example_data()))
})

test_that("adds a column `metric_type`", {
  before <- fake_example_data()
  expect_false(hasName(before, "metric_type"))

  after <- process_input_data(before)
  expect_true(hasName(after, "metric_type"))
})

test_that("depends on input column `metric`", {
  missing_metric <- select(fake_example_data(), -metric)
  expect_snapshot_error(process_input_data(missing_metric))
})

test_that("modifies `metric`", {
  before <- example_data
  after <- process_input_data(before)
  expect_false(identical(before$metric, after$metric))
})

test_that("handles values of `metric`", {
  # FIXME: If metric has none of the expected values, Should we throw an error?
  expect_no_error(
    process_input_data(bad <- fake_example_data(metric = "bad metric"))
  )
})
