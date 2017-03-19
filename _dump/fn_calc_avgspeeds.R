# Todo some results seem to magically disappaer :-(
fn_calc_avgspeeds <- function(df){
  # get all ship id's
  mmsi_list <- as.vector(unique(df$MMSI))
  # inizialise matrix to save calculated results
  speeds <- matrix(nrow = 0,ncol = 4)
  # take each ship id, filter the dataset by that id, calculate speed and attach
  # results to the speeds matrix
  for (value in mmsi_list){ #TODO Vectorise this.
    speeds <- rbind(speeds, fn_calc_avgspeed(filter(df, MMSI == value)))
  }
  speeds
}