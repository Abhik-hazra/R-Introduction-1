# The purpose of the codes is to go through the entire book without reading the book
# The comment sections contains the important texts from the book

# CHAPTER 1: THE VERY BASICS
# Before beggining all the lines of codes, let me go throw the very basic lines of code in R, ones that I assume everyone 
# knows, I am picking these up from the book itself.

# We will gradually proceed to create a virtual die in R

1:2
## 1 2

1:4
## 1 2 3 4

die <- 1:6
die 
## 1 2 3 4 5 6

die + 1:2
## 2 4 4 6 6 8

die + 1:4
## 2 4 6 8 6 8

# Some R commands may take a long time to run. You can cancel a command once it has begun by pressing ctrl + c. 

# By default, R does element by element execution 

die * die
## 1  4  9 16 25 36

die / 2
## 0.5 1.0 1.5 2.0 2.5 3.0

# When you use two or more vectors in an operation, 
# R will line up the vectors and perform a sequence of individual operations. 

# If you give R two vectors of unequal lengths, 
# R will repeat the shorter vector until it is as long as the longer vector, and then do the math

1:2
## 1 2
die + 1:2
## 2 4 4 6 6 8

# But don’t think that R has given up on traditional matrix multiplication. 
# You just have to ask for it when you want it. 
# You can do inner multiplication with the %*% operator and outer multiplication with the %o% operator:

die %*% die
## 91

die %o% die
##      [,1] [,2] [,3] [,4] [,5] [,6]
## [1,]    1    2    3    4    5    6
## [2,]    2    4    6    8   10   12
## [3,]    3    6    9   12   15   18
## [4,]    4    8   12   16   20   24
## [5,]    5   10   15   20   25   30
## [6,]    6   12   18   24   30   36


# FUNCTIONS

round(3.1415)
## 3

factorial(3)
## 6

sample(x = 1:4, size = 2)
## 3 2

sample(x = die, size = 1)

# Sample without replacement 
sample(die, size = 2)

# If you use it many times, you’ll notice that the second die never has the same value as the first die
# By default, sample builds a sample without replacement. 

# Sample with replacement
sample(die, size = 2, replace = TRUE)

dice <- sample(die, size = 2, replace = TRUE)
sum(dice)
# What would happen if you call dice multiple times? 

# R would not generate a new value everytime you call 'dice'

# Now, we have almost created a virtual die. Now we will create a function called roll(), such that everytime we call this 
# function, we can have the sum of the rolled dice

# THE FUCNTION CONSTRUCTOR

# Every function in R has three basic parts: a name, a body of code, and a set of arguments. 
# To make your own function, you need to replicate these parts and store them in an R object,
# which you can do with the function function. To do this, call function() and follow it with a pair of braces, {}
#  my_function <- function() {}

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

roll()

# The code that you place inside your function is known as the body of the function.
# When you run a function in R, R will execute all of the code in the body and then return the result of the last 
# line of code. If the last line of code doesn’t return a value, neither will your function, 
# so you want to ensure that your final line of code returns a value. 

# ARGUMENTS
# What if we removed one line of code from our function and changed the name die to bones, like this?

roll2 <- function() {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2()

# Now I’ll get an error when I run the function. 
# The function needs the object bones to do its job, but there is no object named bones to be found:

# You can supply bones when you call roll2 if you make bones an argument of the function. 
# To do this, put the name bones in the parentheses that follow function when you define roll2:

roll2 <- function(bones) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2(bones=1:6)

# Notice that roll2 will still give an error if you do not supply a value for the bones argument when you call roll2:
roll2()

# You can prevent this error by giving the bones argument a default value.
# To do this, set bones equal to a value when you define roll2:

roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}

# Now you can supply a new value for bones if you like, and roll2 will use the default if you do not:




