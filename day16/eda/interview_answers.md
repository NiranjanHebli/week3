## Q1 Conceptual

A violin plot is preferred over a box plot when you want to understand not only summary statistics but also the full distribution shape of the data. A box plot shows median, quartiles, and outliers, while a violin plot also displays density, making it easier to detect whether data is symmetric, skewed, or contains multiple peaks.

The additional information shown by a violin plot is the probability density of values across the range, which helps reveal hidden patterns such as bimodal or multimodal distributions that a box plot may miss. For example, two groups may have the same median and quartiles in a box plot, but a violin plot can show that one group has two separate clusters of values.

## Q2 Coding

### [plot_numerical_eda.ipynb](./plot_numerical_eda.ipynb)

## Q3 Conceptual 

## (a) 3D Pie Chart with 12 Segments for Market Share

A 3D pie chart with many segments makes comparison difficult because angles and 3D perspective distort perceived sizes. With 12 categories, small differences become hard to interpret clearly.
Better alternative: use a bar chart, because bar lengths are easier to compare accurately across many categories.


## (b) Line Chart for Survey Scores Across 5 Unordered Categories

A line chart implies continuity and order between categories, which is misleading when categories have no natural sequence. Connecting unrelated categories may suggest a trend that does not actually exist.
Better alternative: use a bar chart or dot plot to compare category scores without implying continuity.


## (c) Scatter Plot with 500k Points and No Transparency

A scatter plot with 500,000 points causes severe overplotting, where many points overlap and hide density patterns. Important clusters and relationships become unreadable.
Better alternative: use a hexbin plot, 2D density plot, or scatter plot with transparency (alpha) to reveal concentration areas clearly.
