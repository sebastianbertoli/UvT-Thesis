df_raw[,9]  %>% arrange((TIMESTAMP)) %>% head()
df_raw[,9]  %>% arrange((TIMESTAMP)) %>% tail()

print(nrow(df_raw)/1000000)
print (length(unique(df_raw$MMSI)) - length(unique(df_1$MMSI)))

print(nrow(df_raw) - nrow(df_1))
print((nrow(df_raw)-nrow(df_1))/nrow(df_raw))
print(nrow(df_1)/1000000)
print (length(unique(df_1$MMSI)))


tmp <- filter(df_1, LAT > 90 | LAT < -90)
tmp <- filter(df_1, LON > 127 | LAT < -127)
tmp <- filter(df_1, COURSE > 3599 | COURSE < 0)
tmp <- filter(df_1, HEADING > 359 | HEADING < 0)
print(nrow(tmp)/nrow(df_raw))
print(length(unique(tmp$MMSI)))
print(length(unique(tmp$MMSI))/length(unique(df_1$MMSI)))
print(nrow(tmp)/nrow(df_1))

print(sum(is.na(df_raw)))

tmp_STATUS <- df_1$STATUS
fn_export_object()
print(length(unique(df_1$POS_ID)))
print(count(df_1$STATUS ))


summary(df_raw[,1])
