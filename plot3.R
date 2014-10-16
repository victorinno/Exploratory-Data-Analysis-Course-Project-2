library(ggplot2)
library(Sleuth2)
library(dplyr)
## This first line will likely take a few seconds. Be patient!
#NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
#SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))
set <- select(NEI,fips == "24510") %>%
        group_by(type,year) %>%
        summarise(emissions = sum(Emissions))

png("plot3.png")
ggplot(set, aes(x=set$year, y=set$emissions/1000000, group = set$type, colour = set$type)) +
  geom_line() + 
  geom_point() +          
  xlab("Years") +
  ylab("Emissions / 1000000") +
  ggtitle("Emissions over the years on Baltimore City") +
  scale_colour_discrete(name  = "Types")

dev.off()