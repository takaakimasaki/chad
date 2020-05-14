###Taxation in Tanzania###
#install_list <- c("rgdal","tmap","gridExtra","dismo","plyr","rgeos","dplyr","ggplot2","maptools","spatialEco","chron","ncdf","ncdf4","xlsx")
#install.packages(install_list)
library(rgdal)
library(rgeos)
library(tmap)
library(spdep)
library(ggplot2)
library(classInt)
library(maptools)
library(raster)
library(sp)
library(spatialEco)
library(dplyr)


#reproject UTM to WG
rm(list=ls(all=TRUE))
setwd("C:/Users/acer/Dropbox/projects/chad/input")
dir_input <- "C:/Users/acer/Dropbox/projects/chad/input"
dir_temp <- "C:/Users/acer/Dropbox/projects/chad/temp"
road <- readOGR(dsn = ".", layer = "road_utm")
road <- spTransform(road, CRS("+init=epsg:4326")) # reproject
writeOGR(road, dsn=dir_input,"road",driver="ESRI Shapefile",overwrite_layer = T)

#run Chad_Extract from osm.pbf.ipynb, Chad_Clean Network.ipynb, and OD calculation.ipynb in order
