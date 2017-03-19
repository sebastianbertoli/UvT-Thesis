# ------------------------------------------------------------------------------
# Create df_raw
# ------------------------------------------------------------------------------
df_raw <- fn_read_all_files("../dataset/AIS/", "\\.csv") %>% arrange(desc(MMSI))
df_raw$MMSI <- as.numeric(df_raw$MMSI)
df_raw$SPEED <- as.numeric(df_raw$SPEED/10)
df_raw$TIMESTAMP <- as.POSIXct(df_raw$TIMESTAMP, format = "%y/%m/%d %H:%M:%S")


# ------------------------------------------------------------------------------
# Create df_1
# ------------------------------------------------------------------------------

# Only keep MMSI that are vessels. See: http://goo.gl/hJ2FjZ for reference
df_1 <- (filter(df_raw, grepl('^[234567]\\d*', as.character(MMSI))))
df_1 <- filter(df_1, MMSI >= 200000000)

# Remove MMSI's with not enough obsv?
tmp_mmsi <- count(df_1, MMSI) %>% filter(n >= 10) %>% select(MMSI) 
df_1 <- inner_join(tmp_mmsi, df_1, by = 'MMSI')

# Only keep data for which I have vesseldetails
df_1 <- inner_join(df_1, df_vesseldetails, by = 'MMSI')

# ------------------------------------------------------------------------------
# Create df_1a a small square above dakar
# ------------------------------------------------------------------------------
# Create square of ships to analyse. 
df_1a <- filter(df_1, LAT > 14.00) %>% filter(LAT < 16) %>% 
  filter(LON < -15.5) %>% filter(LON > -18.5) 

df_1b <- filter(df_1, LAT > 14.50) %>% filter(LAT < 14.8) %>% 
  filter(LON < -17) %>% filter(LON > -17.5) 

