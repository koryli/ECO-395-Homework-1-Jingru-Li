---
output:
  pdf_document: default
  html_document: default
---

```{r}

library(dplyr)
library(magrittr)
library(ggplot2)
library(tidyverse)
library(stringr)
```

Problem1

全部的平均delay（月份）
```{r}
ABIA = read.csv("data/ABIA.csv")
M1 = ABIA%>%
  na.omit()%>%
  group_by(Month) %>%
  summarise(delaymean = mean(DepDelay))

ggplot(M1, aes(x = Month, y = delaymean)) + 
 scale_x_continuous(breaks = seq(1,12,1))+
 labs(x="Month of 2008",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Month")+
 geom_col()
```

全部的平均delay（日）
```{r}
Q1 = ABIA %>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delaymean = mean(DepDelay))
Q1$DayofYear <- seq.int(nrow(Q1))
ggplot(Q1, aes(x = DayofYear, y = delaymean)) + 
 labs(x="Day of 2008",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day")+
 geom_col()



```
```{r}

cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q2 = Q1%>%
  mutate(month = as.character(Month) )
ggplot(Q2, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  labs(x="Day of Month",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day/ Month")+
  geom_point()

```
```{r}
ggplot(Q2, aes(x = DayofMonth, y = delaymean)) + 
  facet_wrap(~Month)+
  labs(x="Day of Month",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day/ Month")+

  geom_col()
```
```{r}
#星期
week = ABIA%>%
  na.omit()%>%
  group_by(DayOfWeek)%>%
  summarise(delaymean = mean(DepDelay))

ggplot(week, aes(x = DayOfWeek, y = delaymean)) + 

 labs(x="Day of a Week",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day of Week")+
 scale_x_continuous(breaks = seq(1,7,1))+
 geom_col()
```




```{r}
#frequency of dest
xa = xtabs(~Dest + Year, data=ABIA)

Freq = as.data.frame.matrix(xa)
data.frame(Dest = row.names(Freq),Freq,row.names = NULL,stringsAsFactors = FALSE)
show(Freq)
freqmax = Freq%>%
  arrange(desc(`2008`))
show(freqmax)
```


```{r}
#For AUS
Q3 = ABIA%>%
  filter(Dest == "AUS")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
Q3$DayofYear <- seq.int(nrow(Q1))
ggplot(Q3, aes(x = DayofYear, y = delaymean)) + 

 geom_line()
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q4 = Q3%>%
  mutate(month = as.character(Month) )
ggplot(Q4, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_point()
M_AUS = ABIA%>%
  filter(Dest == "AUS")%>%
  na.omit()%>%
  group_by(Month) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
ggplot(M_AUS, aes(x = Month, y = delaymean)) + 
 scale_x_continuous(breaks = seq(1,12,1))+
 geom_col()
```
```{r}
#For DAL
Q5 = ABIA%>%
  filter(Dest == "DAL")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
Q5$DayofYear <- seq.int(nrow(Q5))
ggplot(Q5, aes(x = DayofYear, y = delaymean)) + 

 geom_line()
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q6 = Q5%>%
  mutate(month = as.character(Month) )
ggplot(Q6, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_line()
M_DAL = ABIA%>%
  filter(Dest == "DAL")%>%
  na.omit()%>%
  group_by(Month) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
ggplot(M_DAL, aes(x = Month, y = delaymean)) + 
 scale_x_continuous(breaks = seq(1,12,1))+
 geom_col()
```

```{r}
#For DFW
Q_DFW1 = ABIA%>%
  filter(Dest == "DFW")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
Q_DFW1$DayofYear <- seq.int(nrow(Q_DFW1))
ggplot(Q_DFW1, aes(x = DayofYear, y = delaymean)) + 

 geom_col()
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q_DFW2 = Q_DFW1%>%
  mutate(month = as.character(Month) )
ggplot(Q_DFW2, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_point()
M_DFW = ABIA%>%
  filter(Dest == "DFW")%>%
  na.omit()%>%
  group_by(Month) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
ggplot(M_DFW, aes(x = Month, y = delaymean)) + 
 scale_x_continuous(breaks = seq(1,12,1))+
 geom_col()
```

