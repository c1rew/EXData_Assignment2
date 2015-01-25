library(ggplot2)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
vehicleSCC <- SCC[grepl("^Mobile.*Vehicles$",SCC$EI.Sector), ]
subNEI <- NEI[NEI$fips =="24510" | NEI$fips =="06037", ]
vehicleNEI <- subNEI[(subNEI$SCC %in% vehicleSCC$SCC),]
EmissionByYear <- aggregate(.~year+fips, data=vehicleNEI[, c(1,4,6)], sum)
png(file="plot6.png")
plot6 <- ggplot(data=EmissionByYear,aes(x=year,y=Emissions,color=fips))+geom_line()+geom_point(shape=20)+ylab("Emissions/Ton")+ggtitle("PM2.5 Emissions From Motor Vehicle ")+scale_color_discrete(name="City",label=c("LA Country","Baltimore"))
print(plot6)
dev.off()
