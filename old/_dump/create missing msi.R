
tmp_mmsil <- data.frame(mmsi = as.integer(unique(df_raw$MMSI)))
tmp_mmsir <- data.frame(mmsi = as.integer(unique(df_vesseldetails$MMSI)))

missing_mmsi <- anti_join(tmp_mmsil,tmp_mmsir, by = 'mmsi') 

fn_export_object(missing_mmsi)
fn_rmobj('tmp')
