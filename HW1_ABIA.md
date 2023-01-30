
    ## 
    ## 载入程辑包：'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ tibble  3.1.8     ✔ purrr   1.0.1
    ## ✔ tidyr   1.3.0     ✔ stringr 1.5.0
    ## ✔ readr   2.1.3     ✔ forcats 0.5.2
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ tidyr::extract()   masks magrittr::extract()
    ## ✖ dplyr::filter()    masks stats::filter()
    ## ✖ dplyr::lag()       masks stats::lag()
    ## ✖ purrr::set_names() masks magrittr::set_names()

Problem1

全部的平均delay（日）

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-2-1.png)<!-- -->

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->
![](HW1_ABIA_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
![](HW1_ABIA_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

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

    ##      2008
    ## AUS 49637
    ## DAL  5573
    ## DFW  5506
    ## IAH  3691
    ## PHX  2783
    ## DEN  2673

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-7-2.png)<!-- -->![](HW1_ABIA_files/figure-gfm/unnamed-chunk-7-3.png)<!-- -->

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

 geom_col()
```

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-1.png)<!-- -->

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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-2.png)<!-- -->

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

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-8-3.png)<!-- -->

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-1.png)<!-- -->

    ## Scale for x is already present.
    ## Adding another scale for x, which will replace the existing scale.

![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-2.png)<!-- -->![](HW1_ABIA_files/figure-gfm/unnamed-chunk-9-3.png)<!-- -->
