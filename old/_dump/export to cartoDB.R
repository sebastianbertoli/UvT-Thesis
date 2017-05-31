# Select a random sample of 500.000 vessels
set.seed(1234)
df_vessel3M <- sample_n(df_1[,c("LAT",'LON')], size = 3000000)
fn_export_object(df_vessel3M)
rm(df_vessel3M)


df_vessel100k <- sample_n(df_1[,c("LAT",'LON','TIMESTAMP')], size = 100000)
fn_export_object(df_vessel100k)
