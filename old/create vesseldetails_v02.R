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
tmp_Length <- "(?:Extreme:\\s*(\\d*))"
tmp_Width <- "(?:Extreme:\\s*\\d*[^\\d]*(\\d*))"

# ------------------------------------------------------------------------------
# Load scraped data 
# ------------------------------------------------------------------------------
tmp_1 <- read.csv('../dataset/webscraping/results_round3_vesseldetails.csv', 
                  stringsAsFactors=FALSE)
colnames(tmp_1) <- c('ship.type','engine.details', 'tonnage.capacity', 'dimensions',
                       'name', 'image.src', 'details')

#-------------------------------------------------------------------------------
# Extract regex from scraped data 
# ------------------------------------------------------------------------------
df_vesseldetails <- data.frame(
  imo		        = str_match(tmp_1$details, tmp_IMO)[,2],
  MMSI			    = as.numeric(str_match(tmp_1$details, tmp_MMSI)[,2]),
  ais.type		  = str_match(tmp_1$details, tmp_AIS.Type)[,2],
  call.Sign		  = str_match(tmp_1$details, tmp_Call.Sign)[,2],
  flag			    = str_match(tmp_1$details, tmp_Flag)[,2],
  gross.tonnage = str_match(tmp_1$details, tmp_Gross.Tonnage)[,2],
  deadweight 	  = str_match(tmp_1$details, tmp_Deadweight)[,2],
  length        = str_match(tmp_1$details, tmp_Length)[,2],
  width         = str_match(tmp_1$details, tmp_Width)[,2],
  image.src     = select(tmp_1,image.src),
  ship.type     = select(tmp_1, ship.type),
  ship.name     = select(tmp_1, name)
)

# Trim Whitespace, map to character
tmp_df <- data.frame(lapply(df_vesseldetails, 
                  function(x) str_trim(x, side = 'both'))) %>%
          map_if(is.factor, as.character)
# Remove all duplicates
tmp_df <- unique(tmp_df)

# Check if there are still duplicates
tmp_mmsi <- count(tmp_df, MMSI) %>% filter(n > 1) %>% select(MMSI)

# Remove those vesseldetails of the duplicates that seem wrong
tmp_df <- tmp_df[!(tmp_df$name %in% c('NAJIB 20','KARI')), ]

# Convert MMSI back to numeric
tmp_df$MMSI <- as.numeric(tmp_df$MMSI)

# Save tmp back to df_vesseldetails
df_vesseldetails <- tmp_df


#-------------------------------------------------------------------------------
# Export vesseldetails, remove tempvars
# ------------------------------------------------------------------------------
fn_export_object(df_vesseldetails)
fn_rmobj('tmp')
