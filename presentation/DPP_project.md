Predicting Lottery Payouts
========================================================
author: Stephen Penrice
date: 2016-01-18

Introduction
========================================================

- New Jersey's Cash 5 is a lottery game where 5 distinct numbers are drawn
from the set of integers 1 to 43.
- Prizes are awarded to players who match 3 or more numbers.
- Prizes are *parimutuel*, meaning winners at a given level share a fixed pot of prize money.
- As a result, prize amounts are a function of the percentage of players who win.
- If players have discernable preferences, it should be possible to predict prize amounts.
- This presentation introduces a Shiny app that implements such a model for Cash 5's third prize level, the prize for matching 3 numbers.

A Simple Model
====================================================

By plotting prize amounts versus the sum of the numbers that the lottery selected, one can see that a relationship exists.

<img src="DPP_project-figure/unnamed-chunk-1-1.png" title="plot of chunk unnamed-chunk-1" alt="plot of chunk unnamed-chunk-1" width="600" height="500" />

The App Model
===================================

- The model implemented by the app is a linear regression on 46 features calculated from the set $S$ of numbers selected.
- The first 5 features are the numbers $n_1$, $n_2$, $n_3$, $n_4$, $n_5$ in $S$, where $n_1 \lt n_2 \lt n_3 \lt n_4 \lt n_5$.
- The remaining 41 features are dummy variables $F_1$, $F_2$, ...$F_{41}$ where $F_i = 1$ if $i \in S$ and $F_i = 0$ otherwise. 
- $F_{42}$ and $F_{43}$ are omitted in order to avoid collinearity.
- The model is calculated in the file global.R when the application is started.

References
========================================================

- Code for the Shiny app and for this presentation can be found on <a href = 'https://github.com/lotterdata/DPP_project'>github</a>.
- This app is an extension of a project I did at NYC Data Science Academy which is documented in this <a href = 'https://rpubs.com/lotterdata/133298'>blog post</a> and 
this <a href = 'https://www.youtube.com/watch?v=vNZRSYWOJBE'>video</a>.
