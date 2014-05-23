# Load Data 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data for Emission
Emissions <- aggregate(NEI[, 4], by=list(NEI$year), FUN=sum)
Emissions$PM_2.5 <- round(Emissions[,2]/1000,2)

# Subset data
data <- subset(NEI, fips=='24510')

# Plot 
png(filename='plot2.png')
barplot(tapply(X=data$Emissions, INDEX=data$year, FUN=sum), 
        main='Total Emission in Baltimore City', xlab='Year', ylab=expression('PM_2.5'), col="blue")
dev.off()