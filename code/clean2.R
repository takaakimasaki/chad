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

dir_input <- "C:/Users/acer/Dropbox/projects/chad/input"
dir_temp <- "C:/Users/acer/Dropbox/projects/chad/temp"
dir_output <- "C:/Users/acer/Dropbox/projects/chad/output"

setwd(dir_temp)

d_list <- c("Region_region", "Dep_tchad_region")
for (d in d_list) {
ori <- readOGR(dsn = ".", layer = paste("origins_snapped","_",d,sep=""))
write.csv(ori, paste("origins_snapped","_",d,".csv",sep=""),row.names=F)
dests <- readOGR(dsn = ".", layer = paste("dests_snapped","_",d,sep=""))
write.csv(dests, paste("dests_snapped","_",d,".csv",sep=""),row.names=F)
OD <- read.csv(paste(dir_output,"/OD_length_",d,"_INSEED.csv",sep=""))
write.csv(OD,paste(dir_output,"/OD_length_",d,"_INSEED_ren.csv",sep=""),row.names=F)
}