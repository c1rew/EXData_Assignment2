library(ggplot2)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
vehicleSCC <- SCC[grepl("^Mobile.*Vehicles$",SCC$EI.Sector), ]
BaltimoreNEI <- NEI[NEI$fips =="24510", ]
vehicleNEI <- BaltimoreNEI[(BaltimoreNEI$SCC %in% vehicleSCC$SCC),]
EmissionByYear <- aggregate(.~year, data=vehicleNEI[, c(4,6)], sum)
png(file="plot5.png")
plot5 <- ggplot(data=EmissionByYear,aes(x=year,y=Emissions))+geom_line()+geom_point(shape=20)+ylab("Emissions/Ton")+ggtitle("Baltimore PM2.5 Emissions From Motor Vehicle")
print(plot5)
dev.off()