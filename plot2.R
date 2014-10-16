library(dplyr)
library(tidyr)
## This first line will likely take a few seconds. Be patient!
NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))
set <- select(NEI,fips == "24510") %>%
        group_by(year) %>%
        summarise(emissions = sum(Emissions))
png("plot2.png")
plot(set$year,set$emissions/1000000, type = "l",
     main = "Emissions over the years on Baltimore City", xlab = "Years", ylab = "Emissions / 1000000" )
dev.off()