tmp <- read.csv(file='../r-exports/df_1_speeds.csv')
tmp[,3] <- as.factor(tmp[,3])
tmp_count <- data.frame(table(tmp[,3]))
fn_export_object(tmp_count)
