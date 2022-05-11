# This script is used to extract a series of waypoints from a list of gpx files

# Note: Please always copy the list of gpx files to a temporary folder before running this script for the sake
# of avoiding any overwriting errors

# Load necessary libraries
library(dplyr)
library(sf)

# List all filenames in folder starting with "Waypoint"
# Works for waypoint files with names like "Waypoints_22-FEB-16.gpx"
# Please note that pathname should be modified as required

files <- list.files(path="data/waypoint-data/", pattern = "^Waypoints_",
                    full.names = T)

# Initialise empty data frame
wpoints <- NULL

for (i in 1:length(files)) {
  
  # read the file necessary
  a <- st_read(files[i])

  # I need elevation, site-code name, longitude and latitude
  data_needed <- data.frame(a$ele, a$name, st_coordinates(a))

  # append to the empty dataframe
  wpoints <- bind_rows(wpoints, data_needed)
}

# Optional: If you want to rename files
names(wpoints) <- c("elevation", "siteCode","longitude","latitude")

# write out the .csv to your folder of choice
write.csv(wpoints, "data/extracted-waypoints.csv", row.names = F)
