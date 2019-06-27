---
title: "Flea Beetle Statistics"
output:
word_document: default
html_document: default
---
  
# ABSTRACT
  
{r setup, message=FALSE, warning=FALSE, echo=FALSE}
library(tidyverse)
library(gridExtra)
library(Sleuth3)

#These are joint measurements from two different species of flea beetle from Lbuischew's 1962 paper on discriminant analysis.

```{r, echo=FALSE}
data(ex1613)
```

# ANALYSIS

# Means by Species

{r boxplots, echo=FALSE, fig.align='center', fig.height=3}
gJ1box <- ggplot(data=ex1613, aes(x=Species, y=Jnt1)) +
  geom_boxplot(aes(color=Species), size=1.5) +
  labs(title="Joint 1, by Species") +
  theme_minimal()

gJ2box <- ggplot(data=ex1613, aes(x=Species, y=Jnt2)) +
  geom_boxplot(aes(color=Species), size=1.5) +
  labs(title="Joint 2, by Species") +
  theme_minimal()

grid.arrange(gJ1box, gJ2box, nrow=1, ncol=2)



```{r numerical-statistics, echo=FALSE}
ex1613 %>%
  group_by(., Species) %>%
  summarize(., j1.mean=mean(Jnt1), j1.sd=sd(Jnt1), j2.mean=mean(Jnt2), j2.sd=sd(Jnt2), n=n()) %>%   
  print.data.frame(.)
```

## Correlation by Species

```{r scatterplot, echo=FALSE, fig.align='center', fig.height=3}
ggplot(data=ex1613, aes(x=Jnt1, y=Jnt2, fill=Species)) +
  geom_point(aes(color=Species), size=2.0) +
  theme_minimal() +
  labs(title="Joint Measurements")
```


##Similar to the summary statistics above, use the **cor()** function to calculate the correlations between **Jnt1** and **Jnt2** for each species._

# REFERENCES

- Lubischew, A. A., On the Use of Discriminant Functions in Taxonomy, _Biometrics_, **18**: 455-477 (1962).

