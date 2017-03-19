# ------------------------------------------------------------------------------
# Perform calculations (distance, displacement)
# ------------------------------------------------------------------------------
# Get me all distances
tmp_distances <- fn_calc_distances(df_1b) 
tmp_distances <- arrange(tmp_distances, MMSI)

# Get me all displacements
tmp_displacements <- fn_calc_displacement(df_1b)
tmp_displacements <- arrange(tmp_displacements, MMSI)

# Merge displacements and distances into a statistics df.  
df_1b_stats <- left_join(tmp_displacements, tmp_distances, by = 'MMSI')

# Caclulate dist/disp ratio
df_1b_stats <- mutate(df_1b_stats, disp.dist.ratio = DISP / DIST)

# Add measurement counts
tmp_mmsi <- as.integer(unique(df_1b$MMSI))
tmp <- as.integer(df_1b$MMSI)
tmp_counts <- count(df_1b, MMSI)
df_1b_stats <- left_join(df_1b_stats, tmp_counts, by = 'MMSI')

# Add vesseldetails
df_1b_stats <- left_join(df_1b_stats, df_vesseldetails, by = 'MMSI')

# calculate all speeds of datapoints
df_1b_speeds <- fn_calc_avgspeeds(df_1b)
df_1b_speeds <- left_join(df_1b_speeds, df_vesseldetails, by = 'MMSI')

# TODO Summary statistics
library(plyr)
ddply(df_1b_speeds,~AIS.Type,summarise,
      mean=mean(na.omit(avg.speed)),
      sd=sd(na.omit(avg.speed)))


# ------------------------------------------------------------------------------
# EXPORT
# ------------------------------------------------------------------------------
fn_export_object(df_1b_speeds)
fn_export_object(df_1b_stats)
fn_rmobj('tmp')
