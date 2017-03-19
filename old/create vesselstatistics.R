# ------------------------------------------------------------------------------
# Perform calculations (distance, displacement)
# ------------------------------------------------------------------------------
# Get me all distances
tmp_distances <- fn_calc_distances(df_1) 
tmp_distances <- arrange(tmp_distances, MMSI)

# Get me all displacements
tmp_displacements <- fn_calc_displacement(df_1)
tmp_displacements <- arrange(tmp_displacements, MMSI)

# Merge displacements and distances into a statistics df.  
df_statistics <- left_join(tmp_displacements, tmp_distances, by = 'MMSI')

# Caclulate dist/disp ratio
df_statistics <- mutate(df_statistics, disp.dist.ratio = DISP / DIST)

# Add measurement counts
temp_counts <- count(df_1, MMSI)
df_statistics <- left_join(df_statistics, temp_counts, by = 'MMSI')

# ------------------------------------------------------------------------------
# EXPORT
# ------------------------------------------------------------------------------
fn_export_object(df_statistics)
fn_rmobj('tmp')