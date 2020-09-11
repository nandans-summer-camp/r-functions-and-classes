rm(list=ls())

library(testthat)
source('./exercises.R')

test_that('generate_numbers gives me N numbers', {
    N <- 100
    res <- generate_numbers(N)
    expect_equal(N, length(res))
})


test_that('generate_variables gives me 2 different vectors, X and Y, of length N', {
    N <- 100
    res <- generate_variables(N)
    expect_equal(N, length(res$X))
    expect_equal(N, length(res$Y))
    expect_false(all(res$Y == res$X))
})


test_that('center_variables centers both X and Y', {
    vars <- list(X = c(5,5,10,10,15,15),
                 Y = c(1,1,2,2,3,3))

    res <- center(vars)
    expect_equal(res$Y, c(-1,-1,0,0,1,1))
    expect_equal(res$X, c(-5,-5,0,0,5,5))
})


test_that('make_variables returns a list with X, Y, and N', {
    X <-  rep(0, 100)
    Y <-  rep(1, 100)
    res <- make_variables(X, Y)
    expect_equal(res$N, 100)
    expect_equal(res$X, X)
    expect_equal(res$Y, Y)
})


test_that('generate_variables and center both use make_variables', {
    N <- 100
    vars <- generate_variables(N)
    centered <- center(vars)
    expect_equal(vars$N, N)
    expect_equal(vars$N, centered$N)
})


test_that('make_variables returns an s3 class called "variables"', {
    X <-  rep(0, 100)
    Y <-  rep(1, 100)
    vars <- make_variables(X, Y)

    expect_true("variables" %in% class(vars))
})


test_that('There is a "mean" method for the variables class', {
    vars <- make_variables(X = c(5,5,10,10,15,15),
                           Y = c(1,1,2,2,3,3))

    res <- mean(vars)

    expect_equal(res$X, 10)
    expect_equal(res$Y, 2)
})
