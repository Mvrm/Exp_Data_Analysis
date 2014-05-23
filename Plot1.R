# Load Data 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data for Emission
Emissions <- aggregate(NEI[, 4], by=list(NEI$year), FUN=sum)
Emissions$PM_2.5 <- round(Emissions[,2]/1000,2)

#Plot
png(filename='plot1.png')
barplot(Emissions$PM_2.5, names.arg=Emissions$Group.1, xlab='Year', ylab='PM_2.5 in Kilotons', main= 'Total Emission of PM_2.5', col="blue")

dev.off()