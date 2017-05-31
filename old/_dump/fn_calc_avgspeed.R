fn_calc_avgspeed <- function(df){
  if (nrow(df) <= 1) {
    NULL  
  } else {
    MMSI <- df$MMSI
    df <- df %>% arrange(TIMESTAMP) %>% select(LON, LAT, TIMESTAMP)
    indexes1 <- seq(1,nrow(df),1)
    indexes2 <- seq(2,nrow(df),1)
    indexes2 <- c(indexes2,nrow(df))
    df <- cbind(slice(df,indexes1), slice(df, indexes2))
    distances <- distCosine(df[,1:2], df[,4:5])
    t_diffs <- as.vector(difftime(df[,6],df[,3],units = "sec"))
    m <- matrix()
    m <- cbind(distances, t_diffs)
    m <- cbind(MMSI,m,avg.speed = apply(m,1,function (x) x[1]/x[2]))
    # Exclude the last element which is junk. 
    m[-nrow(m),]
  }
}

# 
# df <- filter(df_1, MMSI=='209309000')
fn_calc_avgspeed2 <- function(df){
  if (nrow(df) <= 1) {
    NULL  
  } else {
    df <- df %>% arrange(TIMESTAMP)
    indexes1 <- seq(1,nrow(df)-1,1)
    indexes2 <- seq(2,nrow(df),1)
    distances <- distCosine(df[indexes1,c('LON','LAT')], df[indexes2,c('LON','LAT')])
    t_diffs <- 2120
    m <- cbind(distances, t_diffs)
    m <- cbind(df$MMSI[1],m,avg.speed = apply(m,1,function (x) x[1]/x[2]))
  }
}