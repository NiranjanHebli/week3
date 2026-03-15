# Q1. Explain the base rate fallacy using a medical test example. Why does a 99% accurate test for a 1-in-10,000 disease still give mostly false positives?

The  base rate fallacy  happens when people focus on the test accuracy but ignore how rare the disease actually is.

## Medical test example

Suppose:

- Disease prevalence =  1 in 10,000  = 0.01%
- Test sensitivity =  99%  (detects disease if present)
- Test specificity =  99%  (correctly says healthy if absent)

Imagine testing  100,000 people :

### Step 1: People who actually have the disease

- 100,000 × 1/10,000 =  10 diseased people 

Test catches 99%:

 - 9.9 true positives 
 - 0.1 false negatives 

### Step 2: Healthy people

- 99,990 healthy people

With 1% false positive rate:

- 99,990 × 0.01 =  999.9 false positives 


## Result

Positive tests:

- True positives = about  10 
- False positives = about  1000 

So most positives are false.


## Why base rate matters

Even though the test is 99% accurate, the disease is extremely rare, so the huge number of healthy people produces many more false positives than true positives.

That means:

- Accuracy alone is misleading
- Prior prevalence (base rate) strongly affects interpretation


## Intuition

A rare disease means:

iny true signal + many healthy people = false positives dominate

This is why doctors often require  repeat testing or confirmatory tests  before diagnosis.


# Q2. Coding 

### File :- [simulate_ctl.ipynb](simulate_clt.ipynb)

# Q3.  Customer purchase amounts follow an exponential distribution. Why is mean purchase amount a misleading metric for investors? What would you show instead?


If customer purchase amounts follow an  Exponential distribution , the  mean can be misleading  because a small number of very large purchases pull it upward.

## Why the mean is misleading

1.  Strong right skew 
   Most customers spend small amounts, while a few spend very large amounts. Those rare large values inflate the average.

2.  Mean does not represent a typical customer 
   For exponential data, the average is often larger than what most customers actually spend.

For example:

-  Mean = ₹500
-  But most customers may spend below ₹200

So investors may incorrectly assume customers are spending more consistently than they really are.


## What to show instead

### Median purchase amount

The median better represents the typical customer because it is less affected by extreme purchases.

### Percentiles (P50, P75, P90, P95)

Show:

-  50th percentile
-  90th percentile
-  95th percentile

This reveals spending concentration and tail behavior.


### Distribution plot / histogram

A histogram immediately shows:

-  many low spenders
-  few high spenders

This communicates skew much better than one summary number.

### Customer segments

Show revenue split:

-  bottom 80% customers
-  top 20% customers

Often investors care whether revenue depends on a small high spending segment.


## Best investor summary

Instead of only mean:

`Median + percentiles + tail contribution + histogram`

This gives a realistic view of customer purchasing behavior.

