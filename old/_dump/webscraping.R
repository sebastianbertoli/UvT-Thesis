temp_web_azure1 <- read.csv(file = "../webscraping/results/scraper_results__azure_batch1.csv",
                          strip.white=TRUE)
temp_web_mac1 <- read.csv(file = "../webscraping/results/scraper_results__mac_batch1.csv", 
                        strip.white=TRUE)
temp_web_azure2 <- read.csv(file = "../webscraping/results/scraper_results__azure_batch2.csv", 
                          strip.white=TRUE)

temp_web_mac1 <- select(temp_web_mac1, MMSI, vessel.details.href)
temp_web_azure1 <- select(temp_web_azure1, MMSI, vessel.details.href)
temp_web_azure2<- select(temp_web_azure2, MMSI, vessel.details.href)

df_web <- rbind(temp_web_mac1,temp_web_azure1, temp_web_azure2) %>% 
  distinct(MMSI) %>% arrange(MMSI)

export_object(df_web)


fn_rmobs("temp")

