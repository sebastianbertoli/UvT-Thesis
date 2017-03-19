# Get me some ships that travelled fairly far
df_sample <- fn_sample_by_nobs(df_vessels, 10,15,10)
temp_distancestable <- fn_calc_dist_all(df_sample) %>% arrange(desc(DIST))
temp_topmmsi <- slice(temp_distancestable,1:5) %>% select(MMSI)
df_sample <- inner_join(df_sample, temp_topmmsi, by = 'MMSI')
rm(temp_topmmsi, temp_distancestable)
fn_export_object(df_sample)


# Get me some ships that travelled not so far
df_sample2 <- fn_sample_by_nobs(df_vessels, 400,500,500)
temp_distancestable <- fn_calc_dist_all(df_sample2) %>% arrange(DIST)
temp_topmmsi <- slice(temp_distancestable,1:10) %>% select(MMSI)
df_sample2 <- inner_join(df_sample2, temp_topmmsi, by = 'MMSI')
rm(temp_topmmsi, temp_distancestable)
fn_export_object(df_sample2)


# ------------------------------------------------------------------------------
# Check na, count, ...
# ------------------------------------------------------------------------------
# Check for missing values
na_count <- t(data.frame(sapply(raw_tbl, function(x) sum(is.na(x)))))

# Check how much data per MMSI we have
obs_MMSI <- count(raw_tbl, MMSI)
qplot(y = obs_per_MMSI$n, x = "", geom = "boxplot")


sample <- filter_by_observation(raw_tbl,max_obs = 1, min_obs = 1,n = 1,)

# Export the sampledata for Jeroen 
write.csv(sampledata, file = './sampledata.csv')
write.csv(obs_MMSI[(obs_MMSI$MMSI %in% list_MMSI),], 
          file = './vessel_stats')


