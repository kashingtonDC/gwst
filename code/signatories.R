library(tidyverse)
library(tsibble)

d <- read_csv("~/Downloads/contact02 (1).csv") 

# numebr of duplicates
nrow(d) - nrow(distinct(d, Email))

# locate the duplciates 
count(d, Email) %>% 
  arrange(-n) %>% 
  filter(n > 1)

# number of signatories
nrow(distinct(d, Email))

# number of countries
nrow(count(d, Country))

# Signatories over time
p <- d %>% 
  as_tsibble(index = `Submission Time`,
             key = ID) %>% 
  index_by(date = ~ as_date(.)) %>% 
  summarise(count = n()) %>% 
  ggplot(aes(date, count)) +
  geom_line(color = "#2c7fb8") +
  labs(title = "coming to a [hydraulic] head?",
       subtitle = "signatories of groundwaterstatement.org (daily count)",
       y = "",
       x = "") +
  scale_x_date(date_breaks = "1 week",
               date_labels = "%b %d",
               date_minor_breaks = "1 day") +
  scale_y_continuous(limits = c(0,150)) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.ticks.x = element_line(color = "grey80")) 

ggsave(filename = "signatories.pdf", p, height = 3, width = 7)
