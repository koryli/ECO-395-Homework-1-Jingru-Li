##Problem 1: ABIA 
We mainly focus on the question: What is the best time of year to fly to minimize delays, and does this change by destination? 
First, we calculate and plot the "Average Arrival delay in Different Month".
![image](https://user-images.githubusercontent.com/112587000/215670133-49fcb418-5d24-49c8-9f66-3775b0b04f64.png)
From the plot, we can see that the Arrival delay time of Augest, September and October is relatively lower than other month (lower than 50 minutes). 
Augest is the lowest.

Then what about the different day of 2008? Will there be some trend?
![image](https://user-images.githubusercontent.com/112587000/215670224-0e04d447-d083-4be0-a29d-b87c0a43475d.png)
![image](https://user-images.githubusercontent.com/112587000/215670241-241ffc7f-49c6-43dc-96b2-dec6925c3edc.png)
There is no visible relationship of the delay time with different day but it seems that it has a seasonality. Let's check it.
![image](https://user-images.githubusercontent.com/112587000/215670284-bd7e1393-3bac-4bee-824e-c8aac6409631.png)
We can see that Wednesday and Thursday have a relatively low average Arrival delay time.

##We can conclude that the best time of year to fly to minimize delays is Aguest, better to fly on Wednesday or Thursday.

##Check for different destination: First count for the most frequently appeared destination (besides AUS)

<int>
AUS	49637			
DAL	5573			
DFW	5506			
IAH	3691			
PHX	2783			
DEN	2673	
  
Then we choose the most frequent three destination(above 5000 times): AUS, DAL and DFW to check
  ![image](https://user-images.githubusercontent.com/112587000/215670500-3d5f1bdd-9743-49ee-a7c6-35f3bc85a6a1.png)
For AUS, October has the smallest average Arrival delay time. Different from the overall situation.
  ![image](https://user-images.githubusercontent.com/112587000/215670559-0a5b2f7c-a099-407b-b86f-ba3f7ceff1ce.png)
For AUS, roughly same as the overall situation.
  
  ![image](https://user-images.githubusercontent.com/112587000/215670668-65fe78df-b6cc-45fa-80f2-b4983c83d744.png)
For DAL, Augest has the lowest average Arrival delay time, same as the overall situation.
  ![image](https://user-images.githubusercontent.com/112587000/215670738-5d182ab8-b4c7-45ae-9dff-1bbb5c0128a1.png)
For DAL, Monday has the lowest average arrival delay time, different from the overall situation.
  ![image](https://user-images.githubusercontent.com/112587000/215670768-164b3a69-9889-4a4e-99bb-134415de2638.png)
For DFW, October has the smallest average Arrival delay time. Different from the overall situation.
  ![image](https://user-images.githubusercontent.com/112587000/215670830-e91269d2-5f8c-4a1d-9ea1-72fca015d2dd.png)
For DFW, Wednesday has the lowest average arrival delay time, roughly same as the overall situation.

##The best time of year/week changes by destination.

##Problem 2: Olympic 
  A)
  95% 
  183 
  B)
    event                 mean_h      sd_h
    <chr>                 <dbl>       <dbl>
Rowing Women's Coxed Fours	173.3175	10.865490	
Basketball Women's Basketball	183.0128	9.700255	
Rowing Women's Coxed Quadruple Sculls	171.9362	9.246396	
Rowing Women's Coxed Eights	178.1730	8.741931	
Swimming Women's 100 metres Butterfly	173.2083	8.134399	
Volleyball Women's Volleyball	179.5224	8.101521	
Gymnastics Women's Uneven Bars	155.0000	8.015942	
Shooting Women's Double Trap	168.6667	7.826238	
Cycling Women's Keirin	170.1667	7.756718	
Swimming Women's 400 metres Freestyle	174.1042	7.624818
     
For single women's event, "Swimming Women's 100 metres Butterfly" had the greatest variability 
in competitor's heights across the entire history of the Olympics, as measured by the standard deviation.

C)
      ![image](https://user-images.githubusercontent.com/112587000/215671178-c217997a-a977-4b73-bcc4-9f95de62b10e.png)
In the begin of 1900, the average age rose rapidly, and then decreased rapidly and roughly remain around 20. After 1980, it rose up again.
      ![image](https://user-images.githubusercontent.com/112587000/215671248-cbea4a9e-5256-4ebc-955b-6695ed0ecce9.png)

The trend looks similar for male swimmers relative to female swimmers after 1936. But female's average age is always lower than male.

##Problem 3: sclass 
      For trim = 350
      ![image](https://user-images.githubusercontent.com/112587000/215671321-08cd5f37-eb22-4f4b-b2a1-445699c08427.png)
![image](https://user-images.githubusercontent.com/112587000/215671354-419afc11-20e5-433d-a263-382f1f700592.png)
We can see that the bottom is k = 15.
![image](https://user-images.githubusercontent.com/112587000/215671392-05de969b-699d-44cd-adb8-dbcd890c13e4.png)
      
For Trim = 65 AGM
      ![image](https://user-images.githubusercontent.com/112587000/215671474-56a94358-f0c4-4da2-8a01-20b94c956390.png)
![image](https://user-images.githubusercontent.com/112587000/215671622-fc217bec-d9b7-4e1c-98b8-2f6a5121ba7d.png)
We can see that the bottom is k = 10.
      ![image](https://user-images.githubusercontent.com/112587000/215671691-ccf40748-067f-4fa4-a620-142e67e33daf.png)
The k of trim = 65 AMG is lower than trim = 350. I think it's because 350's sample size is larger than 65 AMG, so k can be a little larger.
      
      
