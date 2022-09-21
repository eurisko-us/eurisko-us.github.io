---
title: "Linear and Logistic Regression, Part 3: Categorical Variables, Interaction Terms, and Nonlinear Transformations of Variables"
author: "Riley Paddock"
reviewers:
  - "Colby Roberts"
  - "George Meza"
tags:
  - Machine Learning
---

<i>Note: This post is part 3 of a 3-part series: <a class="body" target="_blank" href="https://eurisko.us/linear-and-logistic-regression-part-1-understanding-the-models/">part 1</a>, <a class="body" target="_blank" href="https://eurisko.us/linear-and-logistic-regression-part-2-fitting-the-models/">part 2</a>, <a class="body" target="_blank" href="https://eurisko.us/linear-and-logistic-regression-part-3-categorical-variables-interaction-terms-and-nonlinear-transformations-of-variables/">part 3</a>.</i>

This blog post will explore categorical variables, interaction terms, and non-linear transformations variables. All of these topics revolve around linear regression, which is a way of solving for the coefficients of a linear function that best fits a set of data points. If you want to understand how linear regressions work, look at <a class="body" href="https://eurisko.us/linear-and-logistic-regression-part-1-understanding-the-models/" target="_blank">Part 1</a> and <a class="body" href="https://eurisko.us/linear-and-logistic-regression-part-2-fitting-the-models/" target="_blank">Part 2</a>.

<h2>Using Linear and Logistic Regression with Categorical Variables</h2>

For this blog post, you have to understand the general idea of fitting a line to a data set. However, keep an open mind about what the collection of data can be. It is not always as simple as $(x,y)$ coordinates. For most of this post, we will use the example of solving for the rating of a sandwich that can have some number of slices beef, some number of tablespoons of peanut butter, and some condiments (mayo and jelly).

"Condiments" is a categorical variable because it takes non-numeric values. Each entry is a list of condiments that may include mayo, jelly, both, or neither. In other words, the condiments variable is "categorized" as mayo, jelly, both, or none. An example set of data points is shown below. Each row corresponds to a different sandwich.

<center>
<table style="width:80%">
  <tr>
    <td width="25%"><b><center>beef</center></b></td>
    <td width="25%"><b><center>pb</center></b></td>
        <td width="25%"><b><center>condiments</center></b></td>
        <td width="25%"><b><center>rating</center></b></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>[]</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>['mayo']</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>['jelly']</center></td>
    <td><center>$4$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>['mayo', 'jelly']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>[]</center></td>
    <td><center>$4$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>['mayo']</center></td>
    <td><center>$8$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>['jelly']</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>['mayo', 'jelly']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>[]</center></td>
    <td><center>$5$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>['mayo']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>['jelly']</center></td>
    <td><center>$9$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>['mayo', 'jelly']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>[]</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>['mayo']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>['jelly']</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>['mayo', 'jelly']</center></td>
    <td><center>$0$</center></td>
  </tr>
</table>
</center>
<br>

As you can see here, we have numeric values for beef and peanut butter because the number of slices of beef and tablespoons of peanut butter can vary. But we don't have a number to plug in the condiments variable. Sometimes there is mayo or jelly in the sandwich, or there isn't. That is why they aren't represented by a number but rather by name. 

The way you interpret these categorical variables is true or false, which can be represented numerically as a $1$ or a $0.$ So we merely break down this condiments variable into a mayo variable and a jelly variable, each of which is a $1$ if it appears on the sandwich or a $0$ if it doesn't.

<center>
<table style="width:80%">
  <tr>
    <td width="20%"><b><center>beef</center></b></td>
    <td width="20%"><b><center>pb</center></b></td>
        <td width="20%"><b><center>mayo</center></b></td>
    <td width="20%"><b><center>jelly</center></b></td>
        <td width="20%"><b><center>rating</center></b></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$4$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$4$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
    <td><center>$8$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$1$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$9$</center></td>
  </tr>
  <tr>
    <td><center>$0$</center></td>
    <td><center>$5$</center></td>
    <td><center>$1$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>$0$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
  </tr>
  <tr>
    <td><center>$5$</center></td>
    <td><center>$5$</center></td>
    <td><center>$1$</center></td>
    <td><center>$1$</center></td>
    <td><center>$0$</center></td>
  </tr>
</table>
</center>
<br>

Now, our data consists of all numeric values, and we can plug it into a regressor.

<h2>Interactions Between Variables</h2>

Interaction terms are additional terms added to regression models to account for when two variables together have an effect that is different from each of them in isolation.

An example of this when you are trying to fit a model that predicts a the rating of a sandwich with beef or peanut butter. Without interaction terms, our model would be

<center>
$\begin{align*}
y = \beta_0+\beta_1(\textrm{beef})+\beta_1(\textrm{pb})
\end{align*}$
</center>
<br>

where $\beta_1$ and $\beta_2$ are coefficients that our regression algorithm calculates.

Without interaction, the model will say "Well, beef is good, so I'll give that a positive rating, and peanut butter is good, so I'll give that a positive rating too." Then we get to a sandwich with beef and peanut butter, and because there is no interaction, it says "Wow, beef is good, and peanut butter is good so that sandwich will be the best sandwich ever." Which we both know is not valid.

When we have a sandwich with peanut butter and beef, we need an interaction term that will recognize that because both peanut butter and beef are present, it is a bad sandwich. The way we do this is by adding a term to our model: 

<center>
$\begin{align*}
y = \beta_0+\beta_1(\textrm{beef})+\beta_2(\textrm{pb})+\beta_3(\textrm{beef})(\textrm{pb})
\end{align*}$
</center>
<br>

When either beef or peanut butter is $0,$ the interaction term will be $0$ and will not influence the rating. However, if we have beef and peanut butter, the interaction term will be able to bring down the rating by a lot.


<h2>Fitting Non-Linear Data with a Linear Regression</h2>

An exciting property of linear regressions is that many non-linear models (such as polynomials) can be fit using linear regression. The trick is to use linear regression to solve for the coefficient of a <i>function</i> of $x$ like seen here:

<center>
$\begin{align*}
y =\beta_0 + \beta_1f_1(x_1) + \beta_2f_2(x_2)+ \ldots +\beta_nf_n(x_n) + \beta_kf_k(x_k)
\end{align*}$
</center>
<br>

These $f_n(x)$ can be any function of x such as $x^2,x^3, \ldots, x^n$ which is how we fit polynomials. We can even fit more complex functions like 

<center>
$\begin{align*}
y = \beta_1\sin(x) + \beta_2\ln(x) + \beta_3\sqrt{x}.
  \end{align*}$
</center>
<br>

The only constraint is that each term of the function must be of the form $\beta f(x)$. So, we could not regress $y =x^a$ because that would require fitting an exponent, not a coefficient. Linear regression can only solve for the coefficients of a model. 

The way we fit a regression of the form

<center>
$\begin{align*}
y =\beta_0+\beta_1f_1(x_1) + \beta_2f_2(x_2)+...+\beta_nf_n(x_n)
  \end{align*}$
</center>
<br>

is we transform the data using the functions in the model, like so:

<center>
$\begin{align*}
(x_1,x_2,\ldots,x_n,y) \rightarrow (f_1(x_1), f_2(x_2), \ldots , f_n(x_n), y)
  \end{align*}$
</center>
<br>

The model is a linear function of the transformed data points. So by fitting the altered data to the model, we are solving a linear regression. And when we plug the coefficients back into the model, we will get a function that is the best fit for the original data.

An important consequence of this is that we can fit a logistic regression using the linear regression algorithm. This is possible because the format of the logistic regression is

<center>
$\begin{align*}
y = \dfrac{M}{1+e^{\beta_1x_1+\beta_2x_2+...+\beta_nx_n}}
  \end{align*}$
</center>
<br>

which can be rearranged to 

<center>
$\begin{align*}
\beta_1x_1+\beta_2x_2+...+\beta_nx_n = \ln \left( \dfrac{M}{y} - 1 \right)
  \end{align*}$
</center>
<br>

which fits in our category of $\beta \cdot f(x).$
