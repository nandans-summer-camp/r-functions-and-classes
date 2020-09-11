# Learning R

# We're just going to do some simple exercises to check our
# knowledge of the fundamentals.

# The goal here will be to simulate some simple data and
# plot it.
#
# You will need to install the library "testthat"
# and run the command:
# auto_test('.', '.') in an R process (console)


# 1)
# Write a function, generate_numbers,
# that takes one parameter: N.
# the function should return a numeric
# vector of length N, full of random numbers
# of your choosing.


# 2)
# Write a function, called generate_variables
# which takes one paramter: N.
# the function should return a list with
# two values: X and Y, which should
# each have a vector of length N of
# random variables.



# 3)
# Write a function that removes the mean of
# a set of variables, where a "set of variables"
# is a list with X and Y as returned by the previous
# function and "removing the mean" just means to
# subtract the empirical mean of the vector
# from each value in the vector.
# Call the function "center".



# 4)
# Notice how we've turned a list with an "X" and "Y"
# into a sort of "container for our variables" that
# other functions ("center") now rely on. Likely,
# you wrote "center" in such a way that it actually
# knows how to "construct" the variables container,
# something the "generate_variables" function ALSO knows
# how to do!

# Create a new function called make_variables that
# has two parameters: X and Y and creates a "variables
# list". Modify the list format so that it not only
# has X and Y but also has a new element: N, which is
# a scalar integer representing the number of elements
# in X and Y.



# 5)
# Refactor your functions "center" and "generate_variables"
# to use "make_variables". Don't modify your old "center" function,
# however, we're going to need it later. Write a new one
# here that will just "mask" the old one for now:



# 6)
# So now we delegated the responsibility of "constructing"
# the variable container to make_variables. However, there
# "center" still has a lot of knowledge about the format
# that our variables container has. It knows there's an
# X and a Y, for instance. How can we formalize this
# relationship so that it's clear to all the readers
# of our code? Basically, we want to know what functions
# we need to change if we change the format of our "variable
# container".
#
# R gives us one tool for formalizing this relationship:
# classes!
#
# Classes in R don't look much like classes in Python
# or other Object Oriented languages. It really just
# provides what's called "polymorphism": the ability
# to call the same function name with different arguments
# types and dispatch the operation to different underlying
# functions.
#
# R has two types of classes: S3 (older) and S4 (newer).
#
# We'll focus on creating an S3 class here, which you'll
# see used in many libraries. It's good to understand them.
#
# Uncomment the following lines to see how to make an S3
# class, it's really easy! Try using the "class"
# to query the class of this object, as in the test.
# See what you get!

## make_variables <- function(X, Y) {
##     v <- list(X=X, Y=Y, N=length(X))
##     class(v) <- "variables"
##     v
## }



# 7)
# Now that we have a class, we need to make some "methods"!
#
# Uncomment the following function:

## center <- function(vars) {
##     UseMethod("center")
## }

# 2 previous tests should now fail. Now change your first
# "center" function to be named "center.list" and your second
# from "center" to be named "center.variables".
#
# Like magic, your tests should pass again! What's happening?
#
# Play around a bit and see if you can understand which function
# is being called when.




# 8)
# Many of the basic functions in R work with this
# sort of polymorphism. For example: summary, plot,
# and even "mean" are all polymorphic functions or,
# as they are called, "methods".
#
# Let's make a "mean" method for our "variables container":
#
# just write a function titled "mean.variables" and
# it will automatically be called whenever "mean"
# is called with your class "variables" as an input!
#
# Let's make "mean.variables" return a "variables"
# class with X set to the mean of the original X vector
# and Y the mean of the original Y vector.


################################################
################################################
# Bonus
#
# Congrats! You're done with the tests. But there's
# still lots of assignment for you to practice using
# R so that you're ready for serious stats work.
#
################################################
################################################



# 9)
# Refactor your generate_variables function so that
# it does the following:
#
# A) generates X
# B) generates Y as X + Noise.  Where Noise is some (any)
# random variable.



# 10)
# First, create an "estimator" function that creates a
# predictor of Y from X.
#
# Our predictor will work as follows: first, it makes
# a "coefficient":
#
# coefficient := E[XY] / E[X^2] (this isn't R code)
#
# Where E[XY] will be estimated as the empirical mean of
# the element-wise product of X times Y and E[X^2] the
# empirical mean of the vector where each element is the
# square of the element in the original X vector.
#
# Play around with R to make sure you know how to do that.
#
# Your prediction of Y will then be coefficient*X, where
# * is the element-wise product between the scalar "coefficient"
# and each element in the vector X.
#
# Write this estimator function. It should do the following:
# 1) it should remove the mean of the variables ("center" them!)
# 2) it should calculate the "coefficient".
# 3) it should return the "coefficient" to be used later, by you
#    to make a prediction of Y



# 11)
# Create a function that generates data, estimates your
# predictor, predicts, and returns a value that represents how
# well your predictor did. Something that measures the
# difference between the true Y and the one predicted
# by your predictor, for example.



# 12)
# Now plot how well your predictor does as your vary
# the way you generate your data (ie vary some parameter in
# the "noise" or vary how you generate X).
