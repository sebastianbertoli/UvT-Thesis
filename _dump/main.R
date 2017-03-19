# Select a random sample of 500.000 vessels
set.seed(1234)
df_vessel500k <- sample_n(df_1[,c("LAT",'LON','TIMESTAMP')], size = 500000)
fn_export_object(df_vessel500k)

tmp <- filter(df_raw, MMSI == '1193046')
tmp_POS_ID <- df_1[,1]
tmp_POS_ID_unique <- unique(tmp_POS_ID[,2])
print(filter(df_raw, MMSI==305803000))

tmp_df_speeds <- fn_calc_avgspeeds(df_1)
tmp_1 <- filter(df_1_speeds, t_diffs > 1800)
fn_export_object(df_1_speeds)
fn_rmobj('tmp')

tmp_unique <- unique(df_vesseldetails[,1])
tmp_count <- 0
tmp_df_1 <- filter(df_1, MMSI %in% tmp_unique)
print(nrow(df_1) - nrow(tmp_df_1))


tmp <- filter(df_raw, MMSI==352939000)
print(length(unique(df_vesseldetails$MMSI)))
e$fn_export_object(tmp)
