# jimmy_joy_research

My notes on the Jimmy Joy research on Glycemic Index 
at https://nl.jimmyjoy.com/pages/heeft-plenny-shake-een-lage-glycemische-index

## Abstract

Jimmy Joy conducted a research, claiming to prove the glycemic
index of Plenny Shake is low. This was demonstrated by showing a plot,
instead of calculating the value.

In this analysis, the glycemic index is shown to be 40%, which
is classified as a low glycemic index (see
classification at [Wikipedia](https://en.wikipedia.org/wiki/Glycemic_index#Grouping)). 

However, there are some questions
regarding the given data, the calculations underlying these data,
the outlier criterion and the experimental protocol.

Up until more information is shared, one may only carefully assume that
Jimmy Joy has a low glycemic index.

## Discussion

The individual AUC values vary, also in unexpected ways, 
for the 9 people participating
in the research. This makes one wonder if the research protocol has been
followed strictly enough, such as fasting 12 hours beforehand, and
not eating during the two hours after intake of the food.

Although the individual AUC values vary, also in unexpected ways, 
for the 9 people participating in the research, the JJ website
mentions that 2 people have been removed. The criteria for removing
these outliers, however, are not given.

## AUCs in time

![](aucs_in_time.png)

## AUCs in time per person

Taking a look at the AUCs in time, I wonder if the people did not fast for 12 hours,
for example, person `X2` has the highest AUC at the starting time. 
Also, there are other unexpected curves, such as X1 (same maximum), 
X3 (same maximum), and X6 (AUC increases after 2 hours in JJ treatment).

![](aucs_in_time_pp.png)

## References

 * [1]  Jenkins DJ, Wolever TM, Taylor RH, Barker H, Fielden H, Baldwin JM, et al. Glycemic index of foods: a physiological basis for carbohydrate exchange. Am J Clin Nutr. 1981 Mar 1;34(3):362–6.

