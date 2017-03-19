# Select Senegal EEZ
df_senegal <- filter(df_1, LAT > 10.6443) %>% filter(LAT < 16.0667) %>% 
  filter(LON > -20.2111) %>% filter(LON < -15.3918)

# Straight trajectories
tmp_mmsi <- filter(df_statistics, disp.dist.ratio >= 0.9)
tmp_mmsi <- filter(tmp_mmsi, n > 100) %>% select(MMSI) %>% slice(1:50)

# Wiggly trajectories
tmp_mmsi2 <- filter(df_statistics, disp.dist.ratio < 0.3)
tmp_mmsi2 <- filter(tmp_mmsi2, n > 100) %>% select(MMSI) %>% slice(1:100)

# Jong with senegal ships
df_straight_trajectories <- inner_join(df_senegal, tmp_mmsi, by = 'MMSI')
df_wiggly_trajectories <- inner_join(df_senegal, tmp_mmsi2, by = 'MMSI')

# ------------------------------------------------------------------------------
# EXPORT
# ------------------------------------------------------------------------------
fn_export_object(df_straight_trajectories)
fn_export_object(df_wiggly_trajectories)
fn_rmobj('tmp')