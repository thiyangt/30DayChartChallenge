## Packages
library(tidyverse)
library(viridis)
library(treemapify)

# Data
#source: https://www.worldometers.info/geography/7-continents/#google_vignette

# Population share
df <- data.frame(Continent=c("Asia",
                             "Africa",
                             "Europe",
                             "North Amrica",
                             "South America",
                             "Australia/Oceania",
                             "Antarctica"),
                 Share = c(59.08,
                           18.15,
                           9.20,
                           7.51,
                           5.47,
                           0.57,
                           0.00))
df
df$Continent <- factor(df$Continent, levels = c("Asia",
                                                "Africa",
                                                "Europe",
                                                "North Amrica",
                                                "South America",
                                                "Australia/Oceania",
                                                "Antarctica"))
# map
ggplot(df, aes(area = Share, fill = Continent, 
               label = paste(Continent, "\n", Share,"%"))) +
  geom_treemap() + 
  geom_treemap_text(colour = "white",
                    place = "centre",
                    size = 15) +
  theme_minimal()+
  scale_fill_brewer(type = "qual", palette = "Dark2")+
  theme(legend.position = "bottom")+
  labs(title = "World Population Share by Continent in 2023", 
        caption= "Data source: https://www.worldometers.info/geography/7-continents/#google_vignette")
