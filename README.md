# Introduction

The application will demonstrate the Central Limit Theorem from statistics for different type of statistics distributions.

The Central Limit Theorem states that sums and averages of measurements from a non normal population with finite mean and a standard deviation s have approximately normal distributions for large samples of
size n.

When the sample size is larger than 30, the distribution of the sample mean will be a normal distribution.

# Application description

The application will show how the sample mean distribution and the mean for the sample mean will change with the sample size and the number of samples. The most visible difference will be when is selected an exponential or Poisson distribution and modify the sample size from very low value, 2 or 4, to couple of hundreds.

# Usage

The application has 5 input parameters which also have a default value. To observe in practive the effect of the Central Limit Theorem different values have to be selected/typed for different parameters.

Here is a short description of the parameters:

- Number of Observvations - how many random observation will be generated. Default value is 1000.
- Probability Distribution - the type of the statistic distribution for the observation. The functions use the default values.
- Lambda value - the parameter is used only for Poisson distribution.
- Sample Size - it will specify the sample size which will be extracted from the population (observations).
- Number of Samples - how many samples will generated from the population.

After all the selections are completed push the submit button to generated the output based on the selection.

# Output interpretations

On the right side there will be displayed 4 plots and two values which have the next descriptions:

- Plot 1 - plot of the observations based on the distribution type and number of observations.
- Plot 2 - histogram of the observations.
- Plot 3 - standard sample mean histogram with the standard normal distribution curve 
            the shape of the histogram will depend on the sample size and number of samples.
            The larger is the sample size and the more samples are selected the histogram will be closer to standard normal distribution- Plot 4 - sample mean histogram with normal distribution curve. In addition the plot has the population mean and the mean of the sample mean.
            The larger is the sample size and the more samples are selected the histogram will be closer to normal distribution and the difference between the two means will be smaller.
- Population mean value - the mean for the number of observations and distribution type selected.
- Mean for sample mean - the mean calculated from the samples mean values. The value will be closer to population mean when the sample size and the number of samples will increase.







