# 1 Create your first data frame

animals <- c("Snake","Ostrich","Cat","Spider")
num_legs <- c(0,2,4,8)

df1 <- data.frame(animals,num_legs)
df1

# 2 Matrix operations

x_vect <- seq(12,2,-2)
x <- matrix(x_vect,2,3)
x

y <- matrix(seq(4),2,2)
y

z <- matrix(seq(4,10,2),2,2)
z

y_t <- t(y)
z_t <- t(z)

y + z
z + y

yz <- y%*%z
zy <- z%*%y
identical(yz,zy)

y_z <- y*z
z_y <- z*y
identical(y_z,z_y)

y%*%x
#x%*%y

y_inv <-solve(y)
y_inv%*%y
y%*%y_inv
# gives identiy matrix

y_inv%*%x
?solve()
solve(y)%*%x

#===============================================================================
# 3 Writing a simple function within R

myFirstRFunc <- function(n){
  a <- seq(1:n)
  i=a[a%%2==0 | a%%7==0]
  return(sum(i))
}

myFirstRFunc(1000)

#===============================================================================
# 4 Version control with RStudio and git

library(usethis)
use_git_config(user.name = "avkaa", user.email = "avekangaro@gmail.com") # Set profile info




