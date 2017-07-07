# Add information on hour of travel
tmp_hour <- filter(trips, VESSEL_TYPE %in% categories, AVG_SPEED >= 0.5) %>% 
  select(TRIP_ID, MMSI, TIME_END) %>% 
  mutate(hour_time = hour(TIME_END)) %>% 
  select(-(TIME_END)) %>% 
  group_by(TRIP_ID) %>% 
  count(hour_time)
tmp_groupcount <- tmp_hour %>% group_by(TRIP_ID) %>% summarise_at("n",sum)
tmp_hour_prop <- left_join(tmp_hour, tmp_groupcount,by = "TRIP_ID") %>% 
  mutate(prop = n.x / n.y) %>% 
  select(TRIP_ID, hour_time, prop) %>% 
  mutate(hour_time = paste0('H_', hour_time)) %>% 
  spread(key="hour_time",value="prop") %>% 
  round(3)
tmp_hour_prop[is.na(tmp_hour_prop)] <- 0

# Add information on day of travel
tmp_wday <- filter(trips, VESSEL_TYPE %in% categories) %>% 
  select(TRIP_ID, MMSI, TIME_END) %>% 
  mutate(wday = wday(TIME_END)) %>% 
  select(-(TIME_END)) %>% 
  group_by(TRIP_ID) %>% 
  count(wday)
tmp_groupcount <- tmp_wday %>% group_by(TRIP_ID) %>% summarise_at("n",sum)
tmp_wday_prop <- left_join(tmp_wday, tmp_groupcount,by = "TRIP_ID") %>% 
  mutate(prop = n.x / n.y) %>% 
  select(TRIP_ID, wday, prop) %>% 
  mutate(wday = paste0('D_', wday)) %>% 
  spread(key="wday",value="prop") %>% 
  round(3)
tmp_wday_prop[is.na(tmp_wday_prop)] <- 0
