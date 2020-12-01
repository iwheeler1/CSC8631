helper.avgview <- function(y)
{
  temp = rep(NULL,7)
  for (i in 9:15)
  {
    temp[i-8] = sum((y[i]/100)*y[4])/13
  }
  return(temp)
}

helper.avgper <- function(y)
{
  temp = rep(NULL,7)
  for (i in 9:15)
  {
    temp[i-8] = sum(y[i])/13
  }
  return(temp)
}