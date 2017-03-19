# ------------------------------------------------------------------------------
# Perform calculations (distance, displacement)
# ------------------------------------------------------------------------------
# Get me all distances
tmp_distances <- fn_calc_distances(df_1a) 
tmp_distances <- arrange(tmp_distances, MMSI)

# Get me all displacements
tmp_displacements <- fn_calc_displacement(df_1a)
tmp_displacements <- arrange(tmp_displacements, MMSI)

# Merge displacements and distances into a statistics df.  
df_1a_stats2 <- left_join(tmp_displacements, tmp_distances, by = 'MMSI')

# Caclulate dist/disp ratio
df_1a_stats2 <- mutate(df_1a_stats2, disp.dist.ratio = DISP / DIST)

# Add measurement counts TODO NOT WORKING
# tmp_mmsi <- as.integer(unique(df_1a$MMSI))
# tmp_counts <- count(df_1a[,1], tmp_mmsi)
# df_1a_stats2 <- left_join(df_1a_stats2, tmp_counts, by = 'MMSI')

# Add vesseldetails
df_1a_stats2 <- left_join(df_1a_stats2, df_vesseldetails, by = 'MMSI')

# calculate all speeds of datapoints
df_1a_speeds2 <- fn_calc_avgspeeds(df_1a)
df_1a_speeds2 <- left_join(df_1a_speeds2, df_vesseldetails, by = 'MMSI')

# TODO Summary statistics
# library(plyr)
# ddply(df_1a_speeds2,~AIS.Type,summarise,
#       mean=mean(na.omit(avg.speed)),
#       sd=sd(na.omit(avg.speed)))


# ------------------------------------------------------------------------------
# EXPORT
# ------------------------------------------------------------------------------
fn_export_object(df_1a_speeds2)
fn_export_object(df_1a_stats2)
fn_rmobj('tmp')
