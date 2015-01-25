library(ggplot2)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
BaltimoreNEI <- NEI[NEI$fips =="24510", ]
EmissionByYearType <- aggregate(.~year+type, data=BaltimoreNEI[, c(4,5,6)], sum)
png(file="plot3.png")
plot3 <- ggplot(data=EmissionByYearType,aes(x=year,y=Emissions,colour=type))+geom_line()+geom_point(shape=20)+ylab("Emissions/Ton")+ggtitle("Baltimore PM2.5 Emissions")
print(plot3)
dev.off()
