df_1c <- filter(df_1, LAT > 11.00) %>% filter(LAT < 20) %>% 
  filter(LON < -11.5) %>% filter(LON > -21.5) 

tmp_mmsi <- count(df_1c, MMSI) %>% filter(n > 10) %>% select(MMSI) 
df_1c <- inner_join(tmp_mmsi, df_1c, by = 'MMSI')
df_1c <- inner_join(df_1c, df_vesseldetails, by = 'MMSI')
df_1c <- subset(df_1c, select = c(MMSI,TIMESTAMP, LAT, LON, AIS.Type,SPEED ))
fn_export_object(df_1c)

fn_rmobj('tmp')
