ReadFile <- function(filename) {
  message("Processing ", filename, "...")
  read_csv(filename)
}


ReadFiles <- function(path, pattern, num_files = 100000L) {
  files <- list.files(path, pattern, full.names = TRUE, recursive = TRUE)
  files <- head(files, num_files)
  files %>% map(fn_read_one_file) %>% reduce(rbind)
}


ExportObject <- function(object_to_export, 
                             directory_path = './dataset/') {
  filepath <-  paste(directory_path, deparse(substitute(object_to_export)), 
                     sep = "") 
  if (typeof(object_to_export) == 'list') {
    filepath <- paste(filepath, '.csv', sep = "")  
    write.csv(object_to_export, file = filepath, row.names = FALSE) 
  }
  else{
    filepath <- paste(filepath, '.txt', sep = "")  
    write.table(object_to_export, file = filepath) 
  }
  # cat("Wohoo! Your r-object has been exported to: ")
  # cat(file_path_as_absolute(filepath))
}


Points2Trajectory <- function(df){
  df <- df %>% arrange(TIMESTAMP)  
  idx1 <- seq(1, nrow(df) - 1, 1)
  idx2 <- seq(2, nrow(df), 1) 
  startpoints <- slice(df,idx1) %>% select(START_LON = LON, START_LAT = LAT)
  endpoints <- slice(df,idx2) %>% select(END_LON = LON, END_LAT = LAT)
  start_time <- slice(df,idx1) %>% .$TIMESTAMP
  end_time <- slice(df,idx2) %>% .$TIMESTAMP
  data.frame(slice(df,idx1) %>% select(MMSI),
             slice(df,idx1) %>% select(START_POSID = POSID),
             slice(df,idx2) %>% select(END_POSID = POSID),
             TIME_START = start_time,
             TIME_END = end_time,
             startpoints,
             endpoints,
             DISTANCE = distCosine(startpoints, endpoints),
             TIME_DIFF = as.numeric(end_time - start_time)
             ) %>% 
  mutate(AVG_SPEED = DISTANCE / TIME_DIFF)
}

RemoveObjects <- function(prefix){
  prefix <- paste("^", prefix, sep = "")
  rm(list = ls(pattern = prefix, envir = globalenv()), envir = globalenv())
}