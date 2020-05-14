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


#load a shp. file 
rm(list=ls(all=TRUE))
setwd("C:/Users/acer/Dropbox/projects/chad/input/from_wb_comp")
dir_input <- "C:/Users/acer/Dropbox/projects/chad/input"
dir_temp <- "C:/Users/acer/Dropbox/projects/chad/temp"
road <- readOGR(dsn = ".", layer = "route_total_polyline")
road <- spTransform(road, CRS("+init=epsg:32434")) # reproject
writeOGR(road, dsn=dir_input,"road_utm",driver="ESRI Shapefile",overwrite_layer = T)oll

#open in QGIS and compute length by Open Attribute Table, Open Field Calculator, and add $Length/1000 as "LENGTH_KM" and overwrite road_utm.
##it is found that no need to calculate length because it's calculated as part of Python code. 
road <- readOGR(dsn = ".", layer = "route_total_polyline")
projection(road) <- CRS("+init=epsg:4326") # reproject
writeOGR(road, dsn=dir_temp,"road",driver="ESRI Shapefile",overwrite_layer = T)