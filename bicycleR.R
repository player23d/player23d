### Introdution

##For the capstone project of the Google Data Analytics certificate, I have chosen the Cyclistic bike share data to work on. For the case study, I will perform real-world tasks of a junior data analyst for the marketing team at Cyclistic, a fictional bike-share company in Chicago.
#To answer key business questions, I will follow the six steps of the data analysis process : Ask, Prepare, Process, Analyze, Share and Act.


### The scenario

##The director of marketing of Cyclistic, Lily Moreno, believes that the company’s future growth depends on maximizing the number of annual memberships. Hence, the marketing analyst team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, the analytics team could be able to design a new marketing strategy to convert casual riders into annual members. 

##Three questions will guide the future marketing campaign:
  
#  1.How do annual members and casual riders use Cyclistic bikes differently?
  
#  2.Why would casual riders buy Cyclistic annual memberships?
  
#  3.How can Cyclistic use digital media to influence casual riders to become members?
  
##  I have been assigned by Moreno the first question. 


### The Ask phase

#A statement of the business task: 
  
  #Cyclistic has concluded that annual members are much more profitable than casual riders. So, we want to design a marketing strategies and a campaign that helps us converting casual riders into annual members. 

#My key stakeholders are: 
  
  # 1-Lily Moreno: The director of marketing and my manager. Moreno has initiated   this  strategy. The first stakeholder to deliver to. 

# 2-The executive team: For Moreno´s idea to work, the executive team must approve our recommendations, so so they must be backed up with compelling data insights and professional data visualizations.


### The Prepare phase

#Data Source: 
  ##Past 12 month of original bike share data set from 01/01/2021 to 31/12/2021 was extracted as 12 zipped .cs[files]####(https://divvy-tripdata.s3.amazonaws.com/index.html). The data is made available and licensed by Motivate International Inc under this [license](https://ride.divvybikes.com/data-license-agreement).
  
  ##Data Organization & Description:
  
  ##File naming convention: YYYY_MM
  
  ##File Type:  csv  format 
  
  ##File Content: Each csv file consist of 13 columns which contain information related to ride id, rider type, ride start and end time, start and end location  etc. Number of rows varies between 49k to 531k from different excel files.
  
  
##Data credibility: 

##The data set is reliable, the data is complete and accurate for the chosen time window.

##The data is original, it is a first arty information.

##The data is comprehensive, the data set contains all information needed to answer the question.

##The data is current, rider data of the last 12 months was used.

##The data is cited and vetted by Chicago department of transportation.


##Data Security: Riders’ personal identifiable information is hidden through tokenization.

##Original files are backed up in a separate folder.


##Data Limitations: As riders’ personal identifiable information is hidden, thus will not be able to connect pass purchases to credit cards numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.

### The Process Phase

##I used R for data verification and cleaning: Reasons:
  ##The 12 data sets combined will contain more than 5 million rows of data. Excel worksheet limitation is 1,048,576 rows. Moreover, some csv files could not uploaded to BigQuery for file size problems. Thus, R is used to perform all tasks from organizing, cleaning analyzing and visualizing data.


### The Analyze Phase
#### Setting up the environment

#Here, I use several libraries that help reading, cleaning, organizing and analyzing the data.

##{r libraries, echo=TRUE, eval=TRUE}

library(tidyverse)
library(janitor)
library(dbplyr)
library(dplyr)
library(dtplyr)
library(readxl)
library(forcats)
library(ggplot2)
library(purrr)
library(readr)
library(lubridate)
library(readxl)
library(stringr)
library(writexl)
#### Importing data 
#Cyclist data from 03/2023 until 02/2024 is imported and read as csv. files. 

# Specifica il percorso della cartella contenente i file dataset
percorso <- "C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/"

# Carica il dataset1
dataset1 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset1.csv"))

# Carica il dataset2
dataset2 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset2.csv"))

# Carica il dataset3
dataset3 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset3.csv"))

# Carica il dataset4
dataset4 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset4.csv"))

# Carica il dataset5
dataset5 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset5.csv"))

# Carica il dataset6
dataset6 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset6.csv"))

# Carica il dataset7
dataset7 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset7.csv"))

# Carica il dataset8
dataset8 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset8.csv"))

# Carica il dataset9
dataset9 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset9.csv"))

# Carica il dataset10
dataset10 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset10.csv"))

# Carica il dataset11
dataset11 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset11.csv"))

# Carica il dataset12
dataset12 <- read.csv(file.path("C:/Users/spore/Desktop/Data analyst/Progetti Google/How Does a Bike-Share Navigate Speedy Success/bycicle/data/","dataset12.csv"))

#Compare column names each of the files. While the names don't have to be in the same order, they DO need to match perfectly before they are  joined  into one file.
```{r colname inspection, echo=TRUE, eval=TRUE}
colnames(dataset1)
colnames(dataset2)
colnames(dataset4)
colnames(dataset3)
colnames(dataset5)
colnames(dataset6)
colnames(dataset7)
colnames(dataset8)
colnames(dataset9)
colnames(dataset10)
colnames(dataset11)
colnames(dataset12)
```
Afterwards, the 12 data sets are combined into one big data frame of 5595028 observations.

bike_rides <- rbind(dataset1,dataset2,dataset3,dataset4,dataset5,dataset6, dataset7,dataset8,dataset9,dataset10,dataset11,dataset12)

####  Clean up and organize data to prepare for analysis
##Inspect the new table that has been created.

##{r all_trips inspection, echo=TRUE, eval=TRUE}
colnames(all_trips)  #List of column names
dim(all_trips)  #Dimensions of the data frame
head(all_trips)  #See the first 6 rows of data frame
str(all_trips)  #See list of columns and data types (numeric, character, etc)

bike_rides <-janitor ::remove_empty(bike_rides,which =c("cols"))

bike_rides <-janitor ::remove_empty(bike_rides,which =c("rows"))
bike_rides <- %% filter(start_station_name !="")

##
###Convert Data 
##
# Correzione delle assegnazioni di variabili incomplete o errate
# Converti le colonne "started_at" e "ended_at" in formato data e ora
bike_rides$started_at <- ymd_hms(bike_rides$started_at)
bike_rides$ended_at <- ymd_hms(bike_rides$ended_at)

# Crea le colonne "started_date", "ended_date", "started_hour" e "ended_hour"
bike_rides$started_date <- as.Date(bike_rides$started_at)
bike_rides$ended_date <- as.Date(bike_rides$ended_at)
bike_rides$started_hour <- hour(bike_rides$started_at)
bike_rides$ended_hour <- hour(bike_rides$ended_at)

# Calcola la differenza in minuti tra "started_at" e "ended_at"
bike_rides$Minutes <- difftime(bike_rides$ended_at, bike_rides$started_at, units = "mins")

# Trasforma i valori della colonna "Minutes" in valori assoluti
bike_rides$Minutes <- abs(bike_rides$Minutes)

# Calcola il giorno della settimana per "started_at" e "ended_at"
bike_rides$started_weekday <- wday(bike_rides$started_at, label = TRUE)
bike_rides$ended_weekday <- wday(bike_rides$ended_at, label = TRUE)


# Filtraggio delle righe in base al valore della variabile minutes
bike_rides <- bike_rides %>% filter(Minutes > 0)


##Create Summary data frame

bikesrides2 <- bike_rides%>% group_by(weekly = floor_date(bike_rides$weekly, "week"), started_hour) %>%
summarise(
Minutes = sum(Minutes),
Mean = mean(Minutes),
Median = median(Minutes),
Max = max(Minutes),
Min = (Minutes),
Count = n()

) %>% ungroup()

##Plot of Rides By Date

#### Summary Stats:Counts
#Summary of Hourly Counts

summary(bikesrides2$Count)

##Count of rides by Hour

#Table of Counts by Hour

xtabs(bikesrides2$Count ~ bikesrides2$started_hour)


bikesrides2$Monthly <- lubridate::month(bikesrides2$weekly)

bikesrides2 %>% 
  ggplot() + 
  geom_col(aes(x=weekly, y=Count)) + 
  scale_y_continuous(labels = scales::comma) + 
  labs(title= "Count of Rides per Day", 
       subtitle = "(Based on 28 day moving average)", 
       y="Average rides per day") + 
  facet_wrap(~Monthly, scale="free") +
  theme(axis.text.x = element_text(angle = 45))

bikesrides2$Monthly <- lubridate::month(bikesrides2$weekly)

bikesrides2 %>% 
  ggplot() + 
  geom_col(aes(x=started_hour, y=Count)) + 
  scale_y_continuous(labels = scales::comma) + 
  labs(title= "Count of Rides by Hours", 
       y="Rides per Hour")  # Aggiunta di una virgola mancante



##Count of Rides by Bike Type
### Summary of Bike Types

bikestype <- bike_rides %>% group_by(rideable_type,weekly =
floor_date(weekly,"week"))%>%
summarise(
Minutes = sum(Minutes),
Mean = mean(Minutes),
Median = median(Minutes),
Max = max(Minutes),
Min= min(Minutes),
Count = n()
) %>% ungroup()

#Count by Bike Type (total by week)

table(bikestype$rideable_type)

ggplot(bikestype) +
  geom_area(aes(x=weekly, y=Count, fill=rideable_type)) +
  scale_y_continuous(labels = scales::comma) +
  labs(title="Count of Rides by Bike type")

bike_rides %>% count(start_station_name,sort = TRUE) %>%

  top_n(20) %>% 
  ggplot() + 
  geom_col(aes(x=reorder(start_station_name, n), y=n)) + 
  coord_flip() +
  labs(title = "Top 20 Start Stations by Ride Count",
       y = "Station Name", 
       x = "Count of Rides") +
  scale_y_continuous(labels = scales::comma)


ggplot(bikestype) +
  geom_col(aes(x=weekly, y=Count, fill=member_casual)) +
  scale_y_continuous(labels = scales::comma) +
  labs(title="Count of Rides by Rider type", subtitle="(for 12 Months ending February 2024)")
bikesrides2$CntMA <- forecast::ma(bikesrides2$Count, 28)

#bikes_type_wbikestype %>% group_by(weekly = floor_date(weekly,"week"),rideable_type %>% summarise(Total= sum(Count))
ggplot(bikestype) +
  geom_col(aes(x=weekly, y=Minutes))
  scale_y_continuous(labels = scales::comma) +
facet_wrap(~rideable_type) + 
  labs(title="Total Ride Minutes by week")

ggplot(bikestype,aes(x=weekly,y=Minutes,fill=rideable_type)) +
geom_area(stat = "identity", position = position_dodge(),
alpha = 0,75) +
scale_y_continous(labels = comma) +
labs(title = "Rides Minutes by Bike Type and Week",
y="Bike Trip in Minutes")

### The Share phase 

#### Conclusions/Summary of insights 

#Members and casual riders differ in how long they use the bikes, how often they use the bikes, and on which days of the week does every group peak


#### Recommendations

#Give discounts for longer rides when you have a membership
#Longer rides can get some type of rewards program when they become members

# The marketing campaign should be launched between Tuesday and Thursday, as the number of trips made by riders peaks at this time of the year.

# As casual rider usage reach its highest point on the weekend, the marketing campaign can include weekend-only membership at a sensible price. This could attract casual riders to convert to members.

# The campaign could include ride-length-based tariff plan (maybe only on weekends): Bike more, pay less ! 
# This provides more incentive for the member rides to cycle longer distances. 

# Alternatively, longer rides can be rewarded with benefits such as discount vouchers. 






