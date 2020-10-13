# jimmy_joy_research

My notes on the Jimmy Joy research on Glycemic Index 
at https://nl.jimmyjoy.com/pages/heeft-plenny-shake-een-lage-glycemische-index

## Abstract

Jimmy Joy conducted a research, claiming to prove the glycemic
index of Plenny Shake is low.

A closer look at the data, however, proves the glycemic index is 57%, which
is classified as a medium glycemic index. Also, there are some questions
regarding the given data, the calculations underlying these data,
the outlier criterion and the experimental protocol.

Up until more information is shared, one can best assume that
Jimmy Joy has a medium (not low) glycemic index.

## Introduction

"Results are given as means ± SEM.
The area under the 2-h glucose curve
was expressed as a percentage
of the appropriate mean GTT value.
This value was defined as the "glycemic index" [1]

## Method

 * Sum the glucose values
 * Average
 * Calculate the GI	

## Conclusion

To glycemic index of JJ is proven to be 57%, which is a medium (not a low)
glycemic index, according to the classification on [Wikipedia](https://en.wikipedia.org/wiki/Glycemic_index#Grouping)

Individual AUC values vary, also in unexpected ways, for the 9 people participating
in the research. This makes one wonder if the research protocol has been
followed strictly enough, such as fasting 12 hours beforehand, and
not eating during the two hours after intake of the food.

although the individual AUC values vary, also in unexpected ways, 
for the 9 people participating in the research, the JJ website
mentions that 2 people have been removed. The criteria for removing
these outliers, however, are not given.

## Discussion

I wonder if one needs to take the average AUC after 2 hours.
I assume that the data supplied **is** the glucose concentration,
albeit averaged (hence 'area under curve') for a time. Unclear is
from which time to which the glucose concentration is averaged out.

Hence, I have requested the raw data.

## AUCs in time

![](aucs_in_time.png)

## AUCs in time per person

Taking a look at the AUCs in time, I wonder if the people did not fast for 12 hours,
for example, person `X2` has the highest AUC at the starting time. 
Also, there are other unexpected curves, such as X1 (same maximum), 
X3 (same maximum), and X6 (AUC increases after 2 hours in JJ treatment).

![](aucs_in_time_pp.png)

## Glycemic indices through time

Although by definition, only the value at 120 minute is important...

![](gi_in_time.png)

## Email

### 2020-10-12

```
[...]

Als academic las ik [...] met grote interesse het artikel dat aantoont dat JJ een lage glycemische index heeft op
[...] https://nl.jimmyjoy.com/pages/heeft-plenny-shake-een-lage-glycemische-index .

Ik zou graag de resultaten van dit onderzoek willen reproduceren (een belangrijke voorwaarde van correct wetenschappelijk onderzoek). Hiervoor zou ik graag de rauwe data willen, namelijk de glucoseconcentraties van de personen in de tijd. Het evt. script om de AUC en grafieken te produceren zou behulpzaam zijn. Natuurlijk, als deze gegevens ergens anders online staan, dan is een URL voldoende.

[...]
```

## References

 * [1]  Jenkins DJ, Wolever TM, Taylor RH, Barker H, Fielden H, Baldwin JM, et al. Glycemic index of foods: a physiological basis for carbohydrate exchange. Am J Clin Nutr. 1981 Mar 1;34(3):362–6.

