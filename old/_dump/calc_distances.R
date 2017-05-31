# ------------------------------------------------------------------------------
# START HERE
# ------------------------------------------------------------------------------

testsample <- sample_by_nobs(max_obs = 10, min_obs = 10, n = 1, columnvc = c(2,5,6))
head(testsample)
# TASK 1: Calculate distance travelled by a vessel. 
# Here I am stuck. I have found this ressource: 
# https://cran.r-project.org/web/views/Spatial.html but I  am a bit overwhelmed 
# with the different packages available. Basically all I  want to do is based on 
# the data I sampled and sorted by TIMESTAMP to calculate  how far a ship has 
# travelled. All this taking into account that the earth is a  sphere etc.
# I'd like to do this for n-ships (I sampled 2 for the working example)' and then
# add this information into a new column in vessel_stats matching the MMSI.
# 
# Also, as an optionl task I wonder if there is a package that can give me an
# approximation of what the true path of the vessel was? But I imagine that
# would be more of a data science task itself, right?

# Using the geosphere library but not working...
# test <- alongTrackDistance(c(9.470384,0.3550667), c(9.470450, 0.3550833), r=6378137)


# TASK 2: Filter Lat-Lon points based on an area but preferrably a polygon and 
# not just a square. I found the link below and from what I understood I need to
# define first a polygon and then use the crop function to retain elements withing
# that polygon.
# # http://www.maths.lancs.ac.uk/~rowlings/Teaching/UseR2012/cheatsheet.html


# TASK 3: Plot points on map using ggmap (only if there is time, not crucial at
# this stage as far as I am concerned)
# Source: https://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
# I have had a look at the tutorial but I was wondering if you
# can give us a quick intro using the package and plotting LAT-LON data? At this
# stage however I do not have more specific questions regarding this as I have not
# had enough time yet to play with it. 


# TASK 4: Various issues with R. 
# Error in fetch(key) : lazy-load database
# '/Library/Frameworks/R.framework/Versions/3.2/Resources/library/ggmap/help/
# ggmap.rdb' is corrupt

