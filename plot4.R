library(dplyr)
library(tidyr)
library(ggplot2)
## This first line will likely take a few seconds. Be patient!
#NEI <- tbl_df(readRDS("summarySCC_PM25.rds"))
#SCC <- tbl_df(readRDS("Source_Classification_Code.rds"))
SCC_filter_sep <- select(SCC, SCC, EI.Sector) %>%
                  filter( grepl("Coal", SCC$EI.Sector)) %>%
                  separate(EI.Sector, into = c("S1", "S2", "S3"), sep = " - ") %>%
                  filter(S1 == "Coal" | S2 == "Coal" | S3 == "Coal")        

set <- filter(NEI, SCC == SCC_filter_sep$SCC, year = 1999:2008) %>%
        select(Emissions, year) %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))
  
  
png("plot4.png")
ggplot(set, aes(x=set$year, y=set$Emissions/1000000)) +
  geom_line() + 
  geom_point() +          
  xlab("Years") +
  ylab("Emissions / 1000000") +
  ggtitle("Emissions over the years from Coal")

dev.off()