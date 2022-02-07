
install.packages("opendatatoronto")
library(opendatatoronto)
library(tidyverse)	
library(dplyr)
library(knitr)

# get package
package <- show_package("9d11c7aa-7613-4d3e-95f3-a02e2b1aa2d7")
package

# get all resources for this package
resources <- list_package_resources("9d11c7aa-7613-4d3e-95f3-a02e2b1aa2d7")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data


data <- tibble(
  ReportedYear = data$ReportedYear,
  GeoDivision = data$GeoDivision,
  Category = data$Category,
  Subtype = data$Subtype,
  Count_ = data$Count_,
  CountCleared = data$CountCleared,
  ObjectId = data$ObjectId,
  geometry = data$geometry,
  Index_ = data$Index_
)

class(data)


# Data cleaning 
# filter out entry with no location specified
# Remove columns that are not needed
cleaned_data <- 
  data %>%
  filter(GeoDivision != "NSA") %>%
  filter(ReportedYear == "2020")%>%
  select(ReportedYear, GeoDivision, Category, Subtype, Count_,CountCleared)

#Gathering and organizing categorical data for each division
#Category 1 "Crimes Against Property"
D11CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Crimes Against Property")
D11cat1total <-sum(D11CAT1DATA$Count_)

D12CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Crimes Against Property")
D12cat1total <-sum(D12CAT1DATA$Count_)

D13CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Crimes Against Property")
D13cat1total <-sum(D13CAT1DATA$Count_)

D14CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Crimes Against Property")
D14cat1total <-sum(D14CAT1DATA$Count_)

D22CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Crimes Against Property")
D22cat1total <-sum(D22CAT1DATA$Count_)

D23CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Crimes Against Property")
D23cat1total <-sum(D23CAT1DATA$Count_)

D31CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Crimes Against Property")
D31cat1total <-sum(D31CAT1DATA$Count_)

D32CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Crimes Against Property")
D32cat1total <-sum(D32CAT1DATA$Count_)

D33CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Crimes Against Property")
D33cat1total <-sum(D33CAT1DATA$Count_)

D41CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Crimes Against Property")
D41cat1total <-sum(D41CAT1DATA$Count_)

D42CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Crimes Against Property")
D42cat1total <-sum(D42CAT1DATA$Count_)

D43CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Crimes Against Property")
D43cat1total <-sum(D43CAT1DATA$Count_)

D51CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Crimes Against Property")
D51cat1total <-sum(D51CAT1DATA$Count_)

D52CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Crimes Against Property")
D52cat1total <-sum(D52CAT1DATA$Count_)

D53CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Crimes Against Property")
D53cat1total <-sum(D53CAT1DATA$Count_)

D54D55CAT1DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Crimes Against Property")
D54D55cat1total <-sum(D54D55CAT1DATA$Count_)

#Collecting all the Category 1 totals 
Cat1totals <- c(D11cat1total,D12cat1total, D13cat1total,D14cat1total, D22cat1total, D23cat1total, D31cat1total, D32cat1total,D33cat1total,D41cat1total,D42cat1total,D43cat1total,D51cat1total,D52cat1total,D53cat1total,D54D55cat1total)

#Category 2 "Crimes Against the Person "
D11CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Crimes Against the Person")
D11cat2total <-sum(D11CAT2DATA$Count_)

D12CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Crimes Against the Person")
D12cat2total <-sum(D12CAT2DATA$Count_)

D13CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Crimes Against the Person")
D13cat2total <-sum(D13CAT2DATA$Count_)

D14CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Crimes Against the Person")
D14cat2total <-sum(D14CAT2DATA$Count_)

D22CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Crimes Against the Person")
D22cat2total <-sum(D22CAT2DATA$Count_)

D23CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Crimes Against the Person")
D23cat2total <-sum(D23CAT2DATA$Count_)

D31CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Crimes Against the Person")
D31cat2total <-sum(D31CAT2DATA$Count_)

D32CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Crimes Against the Person")
D32cat2total <-sum(D32CAT2DATA$Count_)

D33CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Crimes Against the Person")
D33cat2total <-sum(D33CAT2DATA$Count_)

D41CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Crimes Against the Person")
D41cat2total <-sum(D41CAT2DATA$Count_)

D42CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Crimes Against the Person")
D42cat2total <-sum(D42CAT2DATA$Count_)

D43CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Crimes Against the Person")
D43cat2total <-sum(D43CAT2DATA$Count_)

D51CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Crimes Against the Person")
D51cat2total <-sum(D51CAT2DATA$Count_)

D52CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Crimes Against the Person")
D52cat2total <-sum(D52CAT2DATA$Count_)

D53CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Crimes Against the Person")
D53cat2total <-sum(D53CAT2DATA$Count_)

D54D55CAT2DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Crimes Against the Person")
D54D55cat2total <-sum(D54D55CAT2DATA$Count_)

#Collecting all the Category 2 totals 
Cat2totals <- c(D11cat2total,D12cat2total, D13cat2total,D14cat2total, D22cat2total, D23cat2total, D31cat2total, D32cat2total,D33cat2total,D41cat2total,D42cat2total,D43cat2total,D51cat2total,D52cat2total,D53cat2total,D54D55cat2total)

#Category 3 "Controlled Drugs and Substances Act"
D11CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D11cat3total <-sum(D11CAT3DATA$Count_)

D12CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D12cat3total <-sum(D12CAT3DATA$Count_)

D13CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D13cat3total <-sum(D13CAT3DATA$Count_)

D14CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D14cat3total <-sum(D14CAT3DATA$Count_)

D22CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D22cat3total <-sum(D22CAT3DATA$Count_)

D23CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D23cat3total <-sum(D23CAT3DATA$Count_)

D31CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D31cat3total <-sum(D31CAT3DATA$Count_)

D32CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D32cat3total <-sum(D32CAT3DATA$Count_)

D33CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D33cat3total <-sum(D33CAT3DATA$Count_)

D41CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D41cat3total <-sum(D41CAT3DATA$Count_)

D42CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D42cat3total <-sum(D42CAT3DATA$Count_)

D43CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D43cat3total <-sum(D43CAT3DATA$Count_)

D51CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D51cat3total <-sum(D51CAT3DATA$Count_)

D52CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D52cat3total <-sum(D52CAT3DATA$Count_)

D53CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D53cat3total <-sum(D53CAT3DATA$Count_)

D54D55CAT3DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Controlled Drugs and Substances Act")
D54D55cat3total <-sum(D54D55CAT3DATA$Count_)

#Collecting all the Category 3 totals
Cat3totals <- c(D11cat3total,D12cat3total, D13cat3total,D14cat3total, D22cat3total, D23cat3total, D31cat3total, D32cat3total,D33cat3total,D41cat3total,D42cat3total,D43cat3total,D51cat3total,D52cat3total,D53cat3total,D54D55cat3total)


#Category 4 "Criminal Code Traffic"
D11CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Criminal Code Traffic ")
D11cat4total <-sum(D11CAT4DATA$Count_)

D12CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Criminal Code Traffic ")
D12cat4total <-sum(D12CAT4DATA$Count_)

D13CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Criminal Code Traffic ")
D13cat4total <-sum(D13CAT4DATA$Count_)

D14CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Criminal Code Traffic ")
D14cat4total <-sum(D14CAT4DATA$Count_)

D22CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Criminal Code Traffic ")
D22cat4total <-sum(D22CAT4DATA$Count_)

D23CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Criminal Code Traffic ")
D23cat4total <-sum(D23CAT4DATA$Count_)

D31CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Criminal Code Traffic ")
D31cat4total <-sum(D31CAT4DATA$Count_)

D32CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Criminal Code Traffic ")
D32cat4total <-sum(D32CAT4DATA$Count_)

D33CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Criminal Code Traffic ")
D33cat4total <-sum(D33CAT4DATA$Count_)

D41CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Criminal Code Traffic ")
D41cat4total <-sum(D41CAT4DATA$Count_)

D42CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Criminal Code Traffic ")
D42cat4total <-sum(D42CAT4DATA$Count_)

D43CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Criminal Code Traffic ")
D43cat4total <-sum(D43CAT4DATA$Count_)

D51CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Criminal Code Traffic ")
D51cat4total <-sum(D51CAT4DATA$Count_)

D52CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Criminal Code Traffic ")
D52cat4total <-sum(D52CAT4DATA$Count_)

D53CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Criminal Code Traffic ")
D53cat4total <-sum(D53CAT4DATA$Count_)

D54D55CAT4DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Criminal Code Traffic ")
D54D55cat4total <-sum(D54D55CAT4DATA$Count_)

#Collecting all the Category 4 totals
Cat4totals <- c(D11cat4total,D12cat4total, D13cat4total,D14cat4total, D22cat4total, D23cat4total, D31cat4total, D32cat4total,D33cat4total,D41cat4total,D42cat4total,D43cat4total,D51cat4total,D52cat4total,D53cat4total,D54D55cat4total)

#Category 5 "Other Criminal Code Violations"
D11CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Other Criminal Code Violations")
D11cat5total <-sum(D11CAT5DATA$Count_)

D12CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Other Criminal Code Violations")
D12cat5total <-sum(D12CAT5DATA$Count_)

D13CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Other Criminal Code Violations")
D13cat5total <-sum(D13CAT5DATA$Count_)

D14CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Other Criminal Code Violations")
D14cat5total <-sum(D14CAT5DATA$Count_)

D22CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Other Criminal Code Violations")
D22cat5total <-sum(D22CAT5DATA$Count_)

D23CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Other Criminal Code Violations")
D23cat5total <-sum(D23CAT5DATA$Count_)

D31CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Other Criminal Code Violations")
D31cat5total <-sum(D31CAT5DATA$Count_)

D32CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Other Criminal Code Violations")
D32cat5total <-sum(D32CAT5DATA$Count_)

D33CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Other Criminal Code Violations")
D33cat5total <-sum(D33CAT5DATA$Count_)

D41CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Other Criminal Code Violations")
D41cat5total <-sum(D41CAT5DATA$Count_)

D42CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Other Criminal Code Violations")
D42cat5total <-sum(D42CAT5DATA$Count_)

D43CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Other Criminal Code Violations")
D43cat5total <-sum(D43CAT5DATA$Count_)

D51CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Other Criminal Code Violations")
D51cat5total <-sum(D51CAT5DATA$Count_)

D52CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Other Criminal Code Violations")
D52cat5total <-sum(D52CAT5DATA$Count_)

D53CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Other Criminal Code Violations")
D53cat5total <-sum(D53CAT5DATA$Count_)

D54D55CAT5DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Other Criminal Code Violations")
D54D55cat5total <-sum(D54D55CAT5DATA$Count_)

#Collecting all the Category 5 totals
Cat5totals <- c(D11cat5total,D12cat5total, D13cat5total,D14cat5total, D22cat5total, D23cat5total, D31cat5total, D32cat5total,D33cat5total,D41cat5total,D42cat5total,D43cat5total,D51cat5total,D52cat5total,D53cat5total,D54D55cat5total)

#Category 6 "Other Federal Statute Violations"
D11CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D11") %>%
  filter(Category == "Other Federal Statute Violations")
D11cat6total <-sum(D11CAT6DATA$Count_)

D12CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D12") %>%
  filter(Category == "Other Federal Statute Violations")
D12cat6total <-sum(D12CAT6DATA$Count_)

D13CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D13") %>%
  filter(Category == "Other Federal Statute Violations")
D13cat6total <-sum(D13CAT6DATA$Count_)

D14CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D14") %>%
  filter(Category == "Other Federal Statute Violations")
D14cat6total <-sum(D14CAT6DATA$Count_)

D22CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D22") %>%
  filter(Category == "Other Federal Statute Violations")
D22cat6total <-sum(D22CAT6DATA$Count_)

D23CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D23") %>%
  filter(Category == "Other Federal Statute Violations")
D23cat6total <-sum(D23CAT6DATA$Count_)

D31CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D31") %>%
  filter(Category == "Other Federal Statute Violations")
D31cat6total <-sum(D31CAT6DATA$Count_)

D32CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D32") %>%
  filter(Category == "Other Federal Statute Violations")
D32cat6total <-sum(D32CAT6DATA$Count_)

D33CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D33") %>%
  filter(Category == "Other Federal Statute Violations")
D33cat6total <-sum(D33CAT6DATA$Count_)

D41CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D41") %>%
  filter(Category == "Other Federal Statute Violations")
D41cat6total <-sum(D41CAT6DATA$Count_)

D42CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D42") %>%
  filter(Category == "Other Federal Statute Violations")
D42cat6total <-sum(D42CAT6DATA$Count_)

D43CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D43") %>%
  filter(Category == "Other Federal Statute Violations")
D43cat6total <-sum(D43CAT6DATA$Count_)

D51CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D51") %>%
  filter(Category == "Other Federal Statute Violations")
D51cat6total <-sum(D51CAT6DATA$Count_)

D52CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D52") %>%
  filter(Category == "Other Federal Statute Violations")
D52cat6total <-sum(D52CAT6DATA$Count_)

D53CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D53") %>%
  filter(Category == "Other Federal Statute Violations")
D53cat6total <-sum(D53CAT6DATA$Count_)

D54D55CAT6DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55") %>%
  filter(Category == "Other Federal Statute Violations")
D54D55cat6total <-sum(D54D55CAT6DATA$Count_)

#Collecting all the Category 5 totals
Cat6totals <- c(D11cat6total,D12cat6total, D13cat6total,D14cat6total, D22cat6total, D23cat6total, D31cat6total, D32cat6total,D33cat6total,D41cat6total,D42cat6total,D43cat6total,D51cat6total,D52cat6total,D53cat6total,D54D55cat6total)

#Creating dataframe with the total computed
Divisions <- c("D11","D12","D13","D14","D22","D23","D31","D32","D33","D41","D42","D43","D51","D52","D53","D54/D55")

df2 <- data.frame(Divisions, Cat1totals, Cat2totals, Cat3totals, Cat4totals, Cat5totals, Cat6totals,stringsAsFactors=FALSE)

#create table
df2 %>%
  select(Divisions, Cat1totals, Cat2totals, Cat3totals, Cat4totals, Cat5totals, Cat6totals) %>%
  kable(
    caption = "Divisional Data of Total Number of Reported Crimes by Category",
    col.names = c("Division","Crimes Against Property","Crimes Against the Person","Controlled Drugs and Substances Act","Criminal Code Traffic ","Other Criminal Code Violations","Other Federal Statute Violations"),
    booktabs = TRUE,
    linesep = "1")

# Computing Count Cleared rate for each divison 

#Gathering GeoDivision D11 Data
D11DATA <- cleaned_data %>%
  filter(GeoDivision == "D11")
D11counttotal <-sum(D11DATA$Count_)
D11countclearedtotal <-sum(D11DATA$CountCleared)

#Gathering GeoDivision D12 Data
D12DATA <- cleaned_data %>%
  filter(GeoDivision == "D12")
D12counttotal <-sum(D12DATA$Count_)
D12countclearedtotal <-sum(D12DATA$CountCleared)

#Gathering GeoDivision D13 Data
D13DATA <- cleaned_data %>%
  filter(GeoDivision == "D13")
D13counttotal <-sum(D13DATA$Count_)
D13countclearedtotal <-sum(D13DATA$CountCleared)

#Gathering GeoDivision D14 Data
D14DATA <- cleaned_data %>%
  filter(GeoDivision == "D14")
D14counttotal <-sum(D14DATA$Count_)
D14countclearedtotal <-sum(D14DATA$CountCleared)

#Gathering GeoDivision D22 Data
D22DATA <- cleaned_data %>%
  filter(GeoDivision == "D22")
D22counttotal <-sum(D22DATA$Count_)
D22countclearedtotal <-sum(D22DATA$CountCleared)

#Gathering GeoDivision D23 Data
D23DATA <- cleaned_data %>%
  filter(GeoDivision == "D23")
D23counttotal <-sum(D23DATA$Count_)
D23countclearedtotal <-sum(D23DATA$CountCleared)

#Gathering GeoDivision D31 Data
D31DATA <- cleaned_data %>%
  filter(GeoDivision == "D31")
D31counttotal <-sum(D31DATA$Count_)
D31countclearedtotal <-sum(D31DATA$CountCleared)

#Gathering GeoDivision D32 Data
D32DATA <- cleaned_data %>%
  filter(GeoDivision == "D32")
D32counttotal <-sum(D32DATA$Count_)
D32countclearedtotal <-sum(D32DATA$CountCleared)

#Gathering GeoDivision D33 Data
D33DATA <- cleaned_data %>%
  filter(GeoDivision == "D33")
D33counttotal <-sum(D33DATA$Count_)
D33countclearedtotal <-sum(D33DATA$CountCleared)

#Gathering GeoDivision D41 Data
D41DATA <- cleaned_data %>%
  filter(GeoDivision == "D41")
D41counttotal <-sum(D41DATA$Count_)
D41countclearedtotal <-sum(D41DATA$CountCleared)

#Gathering GeoDivision D42 Data
D42DATA <- cleaned_data %>%
  filter(GeoDivision == "D42")
D42counttotal <-sum(D42DATA$Count_)
D42countclearedtotal <-sum(D42DATA$CountCleared)

#Gathering GeoDivision D43 Data
D43DATA <- cleaned_data %>%
  filter(GeoDivision == "D43")
D43counttotal <-sum(D43DATA$Count_)
D43countclearedtotal <-sum(D43DATA$CountCleared)

#Gathering GeoDivision D51 Data
D51DATA <- cleaned_data %>%
  filter(GeoDivision == "D51")
D51counttotal <-sum(D51DATA$Count_)
D51countclearedtotal <-sum(D51DATA$CountCleared)

#Gathering GeoDivision D52 Data
D52DATA <- cleaned_data %>%
  filter(GeoDivision == "D52")
D52counttotal <-sum(D52DATA$Count_)
D52countclearedtotal <-sum(D52DATA$CountCleared)

#Gathering GeoDivision D53 Data
D53DATA <- cleaned_data %>%
  filter(GeoDivision == "D53")
D53counttotal <-sum(D53DATA$Count_)
D53countclearedtotal <-sum(D53DATA$CountCleared)

#Gathering GeoDivision D54/D55 Data
D54D55DATA <- cleaned_data %>%
  filter(GeoDivision == "D54/D55")
D54D55counttotal <-sum(D54D55DATA$Count_)
D54D55countclearedtotal <-sum(D54D55DATA$CountCleared)

#creating dataframe with totals
totalcounts <- c(D11counttotal,D12counttotal, D13counttotal,D14counttotal, D22counttotal,D23counttotal,D31counttotal,D32counttotal,D33counttotal,D41counttotal,D42counttotal,D43counttotal,D51counttotal,D52counttotal,D53counttotal,D54D55counttotal)

totalcountscleared <- c(D11countclearedtotal,D12countclearedtotal, D13countclearedtotal,D14countclearedtotal, D22countclearedtotal,D23countclearedtotal,D31countclearedtotal,D32countclearedtotal,D33countclearedtotal,D41countclearedtotal,D42countclearedtotal,D43countclearedtotal,D51countclearedtotal,D52countclearedtotal,D53countclearedtotal,D54D55countclearedtotal)

df1 <- data.frame(Divisions, totalcounts, totalcountscleared,stringsAsFactors=FALSE)

#creating RateCleared variable
df1 <- df1 %>%
  mutate(RateCleared = ((totalcountscleared/totalcounts)*100))

#creating graph
df1 %>% ggplot(mapping = aes(x= Divisions, y= RateCleared)) +
  labs(x= "Divisions", y= "Cleared Rate (%)", title = "Clearence Rates Across Divisions") +
  geom_point()