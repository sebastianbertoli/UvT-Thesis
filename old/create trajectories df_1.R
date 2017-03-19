# Export df_1d minimum data necessary.

df_1d <- filter(df_1, LAT > 26.00) %>% filter(LAT < 31) %>% 
         filter(LON < -9.0) %>% filter(LON > -20) 
df_1d <- select(df_1d, MMSI, LON, LAT, TIMESTAMP, SPEED)
fn_export_object(df_1d)

# Export vessel details
tmp_details <- select(df_vesseldetails, MMSI, ais.type, gross.tonnage, deadweight, ship.type)
fn_export_object(tmp_details)
