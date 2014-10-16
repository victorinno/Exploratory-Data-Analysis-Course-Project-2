library(dplyr)
library(tidyr)
## This first line will likely take a few seconds. Be patient!
NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))
set <- group_by(NEI, year)
plot_set <- summarise(set, emissions = sum(Emissions))
png("plot1.png")
plot(plot_set$year,plot_set$emissions/1000000, type = "l",
     main = "Emissions over the years on US", xlab = "Years", ylab = "Emissions / 1000000" )
dev.off()