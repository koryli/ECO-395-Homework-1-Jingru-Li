
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
    ## 载入需要的程辑包：maditr
    ## 
    ## 
    ## To aggregate data: take(mtcars, mean_mpg = mean(mpg), by = am)
    ## 
    ## 
    ## 
    ## 载入程辑包：'maditr'
    ## 
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     transpose
    ## 
    ## 
    ## The following object is masked from 'package:readr':
    ## 
    ##     cols
    ## 
    ## 
    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, coalesce, first, last
    ## 
    ## 
    ## 
    ## Use 'expss_output_viewer()' to display tables in the RStudio Viewer.
    ##  To return to the console output, use 'expss_output_default()'.
    ## 
    ## 
    ## 
    ## 载入程辑包：'expss'
    ## 
    ## 
    ## The following objects are masked from 'package:stringr':
    ## 
    ##     fixed, regex
    ## 
    ## 
    ## The following objects are masked from 'package:purrr':
    ## 
    ##     keep, modify, modify_if, when
    ## 
    ## 
    ## The following objects are masked from 'package:tidyr':
    ## 
    ##     contains, nest
    ## 
    ## 
    ## The following object is masked from 'package:ggplot2':
    ## 
    ##     vars
    ## 
    ## 
    ## The following objects are masked from 'package:magrittr':
    ## 
    ##     and, equals, not, or
    ## 
    ## 
    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     compute, contains, na_if, recode, vars
    ## 
    ## 
    ## 
    ## 载入程辑包：'data.table'
    ## 
    ## 
    ## The following objects are masked from 'package:expss':
    ## 
    ##     copy, like
    ## 
    ## 
    ## The following objects are masked from 'package:maditr':
    ## 
    ##     copy, dcast, melt
    ## 
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     transpose
    ## 
    ## 
    ## The following objects are masked from 'package:dplyr':
    ## 
    ##     between, first, last
    ## 
    ## 
    ## 
    ## 载入程辑包：'rsample'
    ## 
    ## 
    ## The following object is masked from 'package:expss':
    ## 
    ##     contains
    ## 
    ## 
    ## 载入需要的程辑包：lattice
    ## 
    ## 
    ## 载入程辑包：'caret'
    ## 
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     lift
    ## 
    ## 
    ## 
    ## 载入程辑包：'foreach'
    ## 
    ## 
    ## The following object is masked from 'package:expss':
    ## 
    ##     when
    ## 
    ## 
    ## The following objects are masked from 'package:purrr':
    ## 
    ##     accumulate, when

\##Problem 1: ABIA We mainly focus on the question: What is the best
time of year to fly to minimize delays, and does this change by
destination? First, we calculate and plot the “Average Arrival delay in
Different Month”.
![](HW1_files/figure-gfm/unnamed-chunk-3-1.png)<!-- --> From the plot,
we can see that the Arrival delay time of Aguest, September and October
is relatively lower than other month (lower than 50 minutes). Aguest is
the lowest.

Then what about the different day of 2008? Will there be some trend?

    ## `summarise()` has grouped output by 'Month'. You can override using the
    ## `.groups` argument.

![](HW1_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->
![](HW1_files/figure-gfm/unnamed-chunk-5-1.png)<!-- --> There is no
visible relationship of the delay time with different day but it seems
that it has a seasonality. Let’s check it.
![](HW1_files/figure-gfm/unnamed-chunk-6-1.png)<!-- --> We can see that
Wednesday and Thursday have a relatively low average Arrival delay time.

\##We can conclude that the best time of year to fly to minimize delays
is Aguest, better to fly on Wednesday or Thursday.

\##Check for different destination: First count for the most frequently
appeared destination (besides AUS)

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

Then we choose the most frequent three destination(above 5000 times):
AUS, DAL and DFW to check

![](HW1_files/figure-gfm/unnamed-chunk-8-1.png)<!-- --> For AUS, October
has the smallest average Arrival delay time. Different from the overall
situation. ![](HW1_files/figure-gfm/unnamed-chunk-9-1.png)<!-- --> For
AUS, roughly same as the overall situation.

![](HW1_files/figure-gfm/unnamed-chunk-10-1.png)<!-- --> For DAL, Aguest
has the lowest average Arrival delay time, same as the overall
situation. ![](HW1_files/figure-gfm/unnamed-chunk-11-1.png)<!-- --> For
DAL, Monday has the lowest average arrival delay time, different from
the overall situation.

![](HW1_files/figure-gfm/unnamed-chunk-12-1.png)<!-- --> For DFW,
October has the smallest average Arrival delay time. Different from the
overall situation.
![](HW1_files/figure-gfm/unnamed-chunk-13-1.png)<!-- --> For DFW,
Wednesday has the lowest average arrival delay time, roughly same as the
overall situation.

\##The best time of year/week changes by destination.

\##Problem 2: Olympic A)

    ## 95% 
    ## 183

2)  

<!-- -->

    ## # A tibble: 10 × 3
    ##    event                                 mean_h  sd_h
    ##    <chr>                                  <dbl> <dbl>
    ##  1 Rowing Women's Coxed Fours              173. 10.9 
    ##  2 Basketball Women's Basketball           183.  9.70
    ##  3 Rowing Women's Coxed Quadruple Sculls   172.  9.25
    ##  4 Rowing Women's Coxed Eights             178.  8.74
    ##  5 Swimming Women's 100 metres Butterfly   173.  8.13
    ##  6 Volleyball Women's Volleyball           180.  8.10
    ##  7 Gymnastics Women's Uneven Bars          155   8.02
    ##  8 Shooting Women's Double Trap            169.  7.83
    ##  9 Cycling Women's Keirin                  170.  7.76
    ## 10 Swimming Women's 400 metres Freestyle   174.  7.62

For single women’s event, “Swimming Women’s 100 metres Butterfly” had
the greatest variability in competitor’s heights across the entire
history of the Olympics, as measured by the standard deviation.

3)  ![](HW1_files/figure-gfm/unnamed-chunk-16-1.png)<!-- --> The trend

<!-- -->

    ## `summarise()` has grouped output by 'year'. You can override using the
    ## `.groups` argument.

![](HW1_files/figure-gfm/unnamed-chunk-17-1.png)<!-- --> The

Problem 3: sclass For trim = 350

    ##        id            trim             subTrim           condition        
    ##  Min.   :  282   Length:416         Length:416         Length:416        
    ##  1st Qu.:14290   Class :character   Class :character   Class :character  
    ##  Median :26658   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :26520                                                           
    ##  3rd Qu.:39599                                                           
    ##  Max.   :52220                                                           
    ##   isOneOwner           mileage            year         color          
    ##  Length:416         Min.   :     6   Min.   :1994   Length:416        
    ##  Class :character   1st Qu.: 19264   1st Qu.:2006   Class :character  
    ##  Mode  :character   Median : 29998   Median :2012   Mode  :character  
    ##                     Mean   : 42926   Mean   :2010                     
    ##                     3rd Qu.: 63479   3rd Qu.:2012                     
    ##                     Max.   :173000   Max.   :2013                     
    ##  displacement           fuel              state              region         
    ##  Length:416         Length:416         Length:416         Length:416        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  soundSystem         wheelType          wheelSize          featureCount   
    ##  Length:416         Length:416         Length:416         Min.   :  0.00  
    ##  Class :character   Class :character   Class :character   1st Qu.: 31.75  
    ##  Mode  :character   Mode  :character   Mode  :character   Median : 54.00  
    ##                                                           Mean   : 49.22  
    ##                                                           3rd Qu.: 70.00  
    ##                                                           Max.   :112.00  
    ##      price       
    ##  Min.   :  6600  
    ##  1st Qu.: 19401  
    ##  Median : 52900  
    ##  Mean   : 46854  
    ##  3rd Qu.: 61991  
    ##  Max.   :106010

![](HW1_files/figure-gfm/unnamed-chunk-18-1.png)<!-- -->

    ## Warning: executing %dopar% sequentially: no parallel backend registered

![](HW1_files/figure-gfm/unnamed-chunk-18-2.png)<!-- --> We can see that
the bottom is k = 15.

    ## Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ## ℹ Please use `linewidth` instead.

![](HW1_files/figure-gfm/unnamed-chunk-19-1.png)<!-- --> For Trim = 65
AGM

    ##        id            trim             subTrim           condition        
    ##  Min.   : 1060   Length:292         Length:292         Length:292        
    ##  1st Qu.:13977   Class :character   Class :character   Class :character  
    ##  Median :26557   Mode  :character   Mode  :character   Mode  :character  
    ##  Mean   :26444                                                           
    ##  3rd Qu.:38687                                                           
    ##  Max.   :52326                                                           
    ##   isOneOwner           mileage            year         color          
    ##  Length:292         Min.   :     1   Min.   :2006   Length:292        
    ##  Class :character   1st Qu.:    20   1st Qu.:2007   Class :character  
    ##  Mode  :character   Median : 28803   Median :2010   Mode  :character  
    ##                     Mean   : 33700   Mean   :2010                     
    ##                     3rd Qu.: 58496   3rd Qu.:2015                     
    ##                     Max.   :146975   Max.   :2015                     
    ##  displacement           fuel              state              region         
    ##  Length:292         Length:292         Length:292         Length:292        
    ##  Class :character   Class :character   Class :character   Class :character  
    ##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
    ##                                                                             
    ##                                                                             
    ##                                                                             
    ##  soundSystem         wheelType          wheelSize          featureCount   
    ##  Length:292         Length:292         Length:292         Min.   :  0.00  
    ##  Class :character   Class :character   Class :character   1st Qu.: 17.00  
    ##  Mode  :character   Mode  :character   Mode  :character   Median : 58.00  
    ##                                                           Mean   : 48.09  
    ##                                                           3rd Qu.: 72.00  
    ##                                                           Max.   :112.00  
    ##      price       
    ##  Min.   : 18990  
    ##  1st Qu.: 48711  
    ##  Median : 79995  
    ##  Mean   :117121  
    ##  3rd Qu.:225975  
    ##  Max.   :247075

![](HW1_files/figure-gfm/unnamed-chunk-20-1.png)<!-- -->

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 250 exceeds number 233 of patterns

    ## Warning in knnregTrain(train = structure(c(50142, 80256, 80374, 32115, 18, : k
    ## = 300 exceeds number 233 of patterns

![](HW1_files/figure-gfm/unnamed-chunk-20-2.png)<!-- --> We can see that
the bottom is k = 10.

![](HW1_files/figure-gfm/unnamed-chunk-21-1.png)<!-- -->
