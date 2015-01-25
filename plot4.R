library(ggplot2)
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
coalSCC <- SCC[grepl("^Fuel Comb.*Coal$",SCC$EI.Sector), ]
coalNEI <- NEI[(NEI$SCC %in% coalSCC$SCC),]
EmissionByYear <- aggregate(.~year, data=coalNEI[, c(4,6)], sum)
png(file="plot4.png")
plot4 <- ggplot(data=EmissionByYear,aes(x=year,y=Emissions))+geom_line()+geom_point(shape=20)+ylab("Emissions/Ton")+ggtitle("PM2.5 Emissions From Coal Combustion-Related Sources")
print(plot4)
dev.off()

