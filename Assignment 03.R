if (!require("data.table")) install.packages("data.table")
library("data.table")

#Read data in
DF <- fread("Yellow_Sample.csv", header="auto", 
            data.table=FALSE)

rm(list=ls(all=TRUE))
header <- read.table("Yellow_Sample.csv", header = TRUE,
                     sep=",", nrow = 1)
Yellow_Sample <- fread("Yellow_Sample.csv",
                       skip=1, sep=",",header=FALSE,
                       data.table=FALSE)
setnames(Yellow_Sample, colnames(header))
rm(header)

# Looking at our data
View(Yellow_Sample)
str(Yellow_Sample)

# Using summary()
summary(Yellow_Sample)
summary(Yellow_Sample $ trip_distance)
#
# Cleaning trip distance
Yellow_Sample <- Yellow_Sample[which(Yellow_Sample$trip_distance>=0 & Yellow_Sample$trip_distance<=10),]
summary(Yellow_Sample $ trip_distance)
summary(Yellow_Sample$total_amount)