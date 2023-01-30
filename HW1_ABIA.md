
``` r
library(dplyr)
```

    ## 
    ## 载入程辑包：'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(magrittr)
library(ggplot2)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2
    ## ──

    ## ✔ tibble  3.1.8     ✔ purrr   1.0.1
    ## ✔ tidyr   1.3.0     ✔ stringr 1.5.0
    ## ✔ readr   2.1.3     ✔ forcats 0.5.2
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ tidyr::extract()   masks magrittr::extract()
    ## ✖ dplyr::filter()    masks stats::filter()
    ## ✖ dplyr::lag()       masks stats::lag()
    ## ✖ purrr::set_names() masks magrittr::set_names()

``` r
library(stringr)
```

Problem1

全部的平均delay（月份）

``` r
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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

全部的平均delay（日）

``` r
Q1 = ABIA %>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delaymean = mean(DepDelay))
```

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

``` r
Q1$DayofYear <- seq.int(nrow(Q1))
ggplot(Q1, aes(x = DayofYear, y = delaymean)) + 
 labs(x="Day of 2008",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day")+
 geom_col()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

``` r
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

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
ggplot(Q2, aes(x = DayofMonth, y = delaymean)) + 
  facet_wrap(~Month)+
  labs(x="Day of Month",y="Average Departure Delay Time by Minutes",title="Average Departure delay in Different Day/ Month")+

  geom_col()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

``` r
#frequency of dest
xa = xtabs(~Dest + Year, data=ABIA)

Freq = as.data.frame.matrix(xa)
data.frame(Dest = row.names(Freq),Freq,row.names = NULL,stringsAsFactors = FALSE)
```

    ##    Dest X2008
    ## 1   ABQ   435
    ## 2   ATL  2252
    ## 3   AUS 49637
    ## 4   BNA   792
    ## 5   BOS   368
    ## 6   BWI   730
    ## 7   CLE   380
    ## 8   CLT   659
    ## 9   CVG   653
    ## 10  DAL  5573
    ## 11  DEN  2673
    ## 12  DFW  5506
    ## 13  DSM     1
    ## 14  DTW     1
    ## 15  ELP  1349
    ## 16  EWR   949
    ## 17  FLL   481
    ## 18  HOU  2319
    ## 19  HRL   367
    ## 20  IAD   670
    ## 21  IAH  3691
    ## 22  IND   218
    ## 23  JAX   226
    ## 24  JFK  1358
    ## 25  LAS  1231
    ## 26  LAX  1733
    ## 27  LBB   692
    ## 28  LGB   245
    ## 29  MAF   470
    ## 30  MCI   459
    ## 31  MCO   632
    ## 32  MDW   712
    ## 33  MEM   834
    ## 34  MSP    55
    ## 35  MSY   444
    ## 36  OAK   236
    ## 37  OKC    88
    ## 38  ONT   305
    ## 39  ORD  2514
    ## 40  ORF     1
    ## 41  PHL   290
    ## 42  PHX  2783
    ## 43  RDU   231
    ## 44  SAN   719
    ## 45  SEA   149
    ## 46  SFO   610
    ## 47  SJC   968
    ## 48  SLC   548
    ## 49  SNA   245
    ## 50  STL    95
    ## 51  TPA   367
    ## 52  TUL    88
    ## 53  TUS   228

``` r
show(Freq)
```

    ##      2008
    ## ABQ   435
    ## ATL  2252
    ## AUS 49637
    ## BNA   792
    ## BOS   368
    ## BWI   730
    ## CLE   380
    ## CLT   659
    ## CVG   653
    ## DAL  5573
    ## DEN  2673
    ## DFW  5506
    ## DSM     1
    ## DTW     1
    ## ELP  1349
    ## EWR   949
    ## FLL   481
    ## HOU  2319
    ## HRL   367
    ## IAD   670
    ## IAH  3691
    ## IND   218
    ## JAX   226
    ## JFK  1358
    ## LAS  1231
    ## LAX  1733
    ## LBB   692
    ## LGB   245
    ## MAF   470
    ## MCI   459
    ## MCO   632
    ## MDW   712
    ## MEM   834
    ## MSP    55
    ## MSY   444
    ## OAK   236
    ## OKC    88
    ## ONT   305
    ## ORD  2514
    ## ORF     1
    ## PHL   290
    ## PHX  2783
    ## RDU   231
    ## SAN   719
    ## SEA   149
    ## SFO   610
    ## SJC   968
    ## SLC   548
    ## SNA   245
    ## STL    95
    ## TPA   367
    ## TUL    88
    ## TUS   228

``` r
freqmax = Freq%>%
  arrange(desc(`2008`))
show(freqmax)
```

    ##      2008
    ## AUS 49637
    ## DAL  5573
    ## DFW  5506
    ## IAH  3691
    ## PHX  2783
    ## DEN  2673
    ## ORD  2514
    ## HOU  2319
    ## ATL  2252
    ## LAX  1733
    ## JFK  1358
    ## ELP  1349
    ## LAS  1231
    ## SJC   968
    ## EWR   949
    ## MEM   834
    ## BNA   792
    ## BWI   730
    ## SAN   719
    ## MDW   712
    ## LBB   692
    ## IAD   670
    ## CLT   659
    ## CVG   653
    ## MCO   632
    ## SFO   610
    ## SLC   548
    ## FLL   481
    ## MAF   470
    ## MCI   459
    ## MSY   444
    ## ABQ   435
    ## CLE   380
    ## BOS   368
    ## HRL   367
    ## TPA   367
    ## ONT   305
    ## PHL   290
    ## LGB   245
    ## SNA   245
    ## OAK   236
    ## RDU   231
    ## TUS   228
    ## JAX   226
    ## IND   218
    ## SEA   149
    ## STL    95
    ## OKC    88
    ## TUL    88
    ## MSP    55
    ## DSM     1
    ## DTW     1
    ## ORF     1

``` r
#For AUS
Q3 = ABIA%>%
  filter(Dest == "AUS")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
```

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

``` r
Q3$DayofYear <- seq.int(nrow(Q1))
ggplot(Q3, aes(x = DayofYear, y = delaymean)) + 

 geom_line()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

``` r
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q4 = Q3%>%
  mutate(month = as.character(Month) )
ggplot(Q4, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_point()
```

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-2.png)<!-- -->

``` r
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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-3.png)<!-- -->

``` r
#For DAL
Q5 = ABIA%>%
  filter(Dest == "DAL")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
```

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

``` r
Q5$DayofYear <- seq.int(nrow(Q5))
ggplot(Q5, aes(x = DayofYear, y = delaymean)) + 

 geom_line()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

``` r
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q6 = Q5%>%
  mutate(month = as.character(Month) )
ggplot(Q6, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_line()
```

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-2.png)<!-- -->

``` r
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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-3.png)<!-- -->

``` r
#For DFW
Q_DFW1 = ABIA%>%
  filter(Dest == "DFW")%>%
  na.omit()%>%
  group_by(Month,DayofMonth) %>%
  summarise(delay1 = mean(ArrDelay),
            delay2 = mean(DepDelay)) %>%
  mutate(delaymean = delay1+delay2)
```

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

``` r
Q_DFW1$DayofYear <- seq.int(nrow(Q_DFW1))
ggplot(Q_DFW1, aes(x = DayofYear, y = delaymean)) + 

 geom_col()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-10-1.png)<!-- -->

``` r
cols = c("red", "orange", "yellow", "green", "blue","purple","grey","black","pink","dark green","dark red","dark blue")
Q_DFW2 = Q_DFW1%>%
  mutate(month = as.character(Month) )
ggplot(Q_DFW2, aes(x = DayofMonth, y = delaymean, color = month)) + 
  xlim(1,30)+
  scale_x_continuous(breaks = seq(1,31,1))+
  scale_color_manual(values = cols)+
  geom_point()
```

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-10-2.png)<!-- -->

``` r
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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-10-3.png)<!-- -->
