qplot
# Quite a number of lines of code



# qplot gives "Quick Plot" 
# If you give qplot two vectors of equal lengths, qplot will draw a scatterplot for you.
# qplot will use the first vector as a set of x values and the second vector as a set of y values.

x <- c(-1, -0.8, -0.6, -0.4, -0.2, 0, 0.2, 0.4, 0.6, 0.8, 1)
x
## -1.0 -0.8 -0.6 -0.4 -0.2  0.0  0.2  0.4  0.6  0.8  1.0

y <- x^3
y
## -1.000 -0.512 -0.216 -0.064 -0.008  0.000  0.008 0.064  0.216  0.512  1.000

qplot(x,y)

## Scatterplots are useful for visualizing the relationship between two variables. 

# However, A histogram visualizes the distribution of a single variable; 
# it displays how many data points appear at each value of x.

# qplot will make a histogram whenever you give it only one vector to plot.
x <- c(1, 2, 2, 2, 3, 3)
qplot(x, binwidth = 1)

x2 <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4)
qplot(x2, binwidth = 1)


# Now, How can you use a histogram to check the accuracy of your dice?

# Well, if you roll your dice many times and keep track of the results, 
# you would expect some numbers to occur more than others. 
# This is because there are more ways to get some numbers by adding two dice together than to get other numbers

# replicate provides an easy way to repeat an R command many times.
# To use it, first give replicate the number of times you wish to repeat an R command, 
# and then give it the command you wish to repeat.
# replicate will run the command multiple times and store the results as a vector:

replicate(10, roll())

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

# The results suggest that the dice are fair. Over the long run, 
# each number occurs in proportion to the number of combinations that generate it.

# Now, how can you bias the results
# the previous distribution occurs because the underlying probability of each of them occuring is equal (1/6)
# The behaviour of our die says that they are fair

# now lets increase the probability of getting a six
# the probability of rolling any single number on a fair die is 1/6. 
# I’d like you to change the probability to 1/8 for each number below six, 
# and then increase the probability of rolling a six to 3/8

# You can change the probabilities by adding a new argument to the sample function.

# You will need to add a prob argument to the sample function inside of roll.

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE, 
                 prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}

# This will cause roll to pick 1 through 5 with probability 1/8 and 6 with probability 3/8

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

# This confirms that we’ve effectively weighted the dice. High numbers occur much more often than low numbers. 


