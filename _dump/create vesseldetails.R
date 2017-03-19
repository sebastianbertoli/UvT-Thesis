# ------------------------------------------------------------------------------
# Regex pattern
# ------------------------------------------------------------------------------
tmp_IMO	<- "(?:IMO:\\s*(\\d*))"
tmp_MMSI <- "(?:MMSI:\\s*(\\d*))"
tmp_Call.Sign <- "(?:Call Sign:\\s*(\\S*))"
tmp_Flag <- "(?:Flag:\\s*((?:\\S*\\s){1,3}))"
tmp_AIS.Type <- "(?:AIS Type:\\s*((?:\\S*\\s){1,5}))"
tmp_Gross.Tonnage <- "(?:Gross Tonnage:\\s*(\\d*))"
tmp_Deadweight <- "(?:Deadweight:\\s*(\\d*))"

# ------------------------------------------------------------------------------
# Load scraped data 
# ------------------------------------------------------------------------------
tmp_1 <- read.csv('../dataset/webscraping/results_vesselpage_url1-3000.csv', 
                  stringsAsFactors=FALSE)
tmp_2 <- read.csv('../dataset/webscraping/results_vesselpage_url3001-6285.csv', 
                  stringsAsFactors=FALSE)
tmp_3 <- read.csv('../dataset/webscraping/results_vesselpage_step2.csv', 
                  stringsAsFactors=FALSE)
tmpvdet <- rbind(tmp_1, tmp_2, tmp_3)
colnames(tmpvdet) <- c('infotopleft','imgurl')
tmpvdeti <- tmpvdet$infotopleft

#-------------------------------------------------------------------------------
# Extract regex from scraped data 
# ------------------------------------------------------------------------------
df_vesseldetails <- data.frame(
  IMO		        = str_match(tmpvdeti, tmp_IMO)[,2],
  MMSI			    = as.numeric(str_match(tmpvdeti, tmp_MMSI)[,2]),
  AIS.Type		  = str_match(tmpvdeti, tmp_AIS.Type)[,2],
  Call.Sign		  = str_match(tmpvdeti, tmp_Call.Sign)[,2],
  Flag			    = str_match(tmpvdeti, tmp_Flag)[,2],
  Gross.Tonnage = str_match(tmpvdeti, tmp_Gross.Tonnage)[,2],
  Deadweight 	  = str_match(tmpvdeti, tmp_Deadweight)[,2],
  Imgurl       = select(tmpvdet,imgurl)
)
tmp <- data.frame(lapply(df_vesseldetails[-2], 
                                      function(x) str_trim(x, side = 'both')))
df_vesseldetails <- cbind(MMSI = df_vesseldetails$MMSI,tmp)
df_vesseldetails <- df_vesseldetails %>% map_if(is.factor, as.character)


#-------------------------------------------------------------------------------
# Export vesseldetails, remove tempvars
# ------------------------------------------------------------------------------
fn_export_object(df_vesseldetails)
fn_rmobj('tmp')
