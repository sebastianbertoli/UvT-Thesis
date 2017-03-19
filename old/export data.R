temp_mmsi <- filter(df_statistics, disp.dist.ratio >= 0.9)
temp_mmsi <- filter(temp_mmsi, n > 100) %>% select(MMSI) %>% slice(1:50)

df_straight_trajectories <- inner_join(df_senegal, temp_mmsi, by = 'MMSI')
fn_export_object(df_straight_trajectories)


temp_mmsi2 <- filter(df_statistics, disp.dist.ratio < 0.3)
temp_mmsi2 <- filter(temp_mmsi2, n > 100) %>% select(MMSI) %>% slice(1:100)

df_wiggly_trajectories <- inner_join(df_senegal, temp_mmsi2, by = 'MMSI')
fn_export_object(df_wiggly_trajectories)

# Select a random sample of 500.000 vessels
set.seed(1234)
temp_df <- filter(df_1, LAT > 15.00) %>% filter(LAT < 16) %>% filter(LON < -17.5) %>% filter(LON > -18.5) 
nrow(temp_df)
tmp_df_vessels_test <- sample_n(temp_df[,c("LAT",'LON')], size=134260)
fn_export_object(tmp_df_vessels_test)
