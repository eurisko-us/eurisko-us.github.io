---
title: "Linear and Logistic Regression, Part 2: Fitting the Models"
author: "Colby Roberts"
reviewers:
  - "Elijah Tarr"
  - "Riley Paddock"
tags:
  - Machine Learning
---

<i>Note: This post is part 2 of a 3-part series: <a class="body" target="_blank" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-1-understanding-the-models/">part 1</a>, <a class="body" target="_blank" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-2-fitting-the-models/">part 2</a>, <a class="body" target="_blank" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-3-categorical-variables-interaction-terms-and-nonlinear-transformations-of-variables/">part 3</a>.</i>

This is a blog post exploring how to fit linear and logistic regressions. First, note that linear and logistic regressors have different shapes. The shape of linear regression is a line, while the shape of logistic regression is a sigmoid: 

<center><img src="https://eurisko-us.github.io/images/blog/linear-and-logistic-regression-part-2-fitting-the-models-1.png" style="border: none; height: 20em;" alt="icon"></center>
<br>

Also note that the same procedure can be used to fit a linear or logistic regressor, because the logistic equation can be rearranged to become a linear one.

<center>
<table style="width:80%">
  <tr>
    <td width="50%"><b><center>Linear Function</center></b></td>
    <td width="50%"><b><center>Logistic Function</center></b></td>
  </tr>
  <tr>
    <td><center>$\beta_0 + \beta_1  x_1 + \ldots + \beta_n  x_n=y$</center></td>
   <td><center>$\begin{align*}
\dfrac{1}{1+e^{\beta_0 + \beta_1  x_1 + \ldots + \beta_n  x_n}}&=y \\
  \beta_0 + \beta_1  x_1 + \ldots + \beta_n  x_n &= \ln\left(\dfrac{1}{y}-1\right)
     \end{align*}$</center></td>
  </tr>
</table>
</center>
<br>
        
Let $y^\prime = y$ for the case of a linear regression, and $y^\prime = \ln\left(\dfrac{1}{y}-1\right)$ for the case of a logistic regression. Then, we need to fit the regression to the following dataset:

<center>
$\begin{align*}
\left\{ \begin{matrix} (x_{11}, & x_{12}, & \ldots & x_{1n}, & y_1^\prime) \\ (x_{21}, & x_{22}, & \ldots & x_{2n}, & y_2^\prime) \\ \vdots & \vdots & \ddots & \vdots & \vdots \\ (x_{m1}, & x_{m2}, & \ldots & x_{mn}, & y_m^\prime) \end{matrix} \right\}
\end{align*}$
</center>
<br>

So, we need to solve the matrix equation

<center>
$\begin{align*}
\begin{pmatrix} 1 & x_{11} & x_{12} & \ldots & x_{1n} \\ 1 & x_{21} & x_{22} & \ldots & x_{2n} \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 1 & x_{m1} & x_{m2} & \ldots & x_{mn} \end{pmatrix} \begin{pmatrix} \beta_0 \\ \beta_1 \\ \vdots \\ \beta_m \end{pmatrix} &\approx \begin{pmatrix} y_1^\prime \\ y_2^\prime \\ \vdots \\ y_m^\prime \end{pmatrix}.
\end{align*}$
</center>
<br>

We can put this in equation form and perform operations to isolate $\vec{\beta}\mathbin{:}$

<center>
$\begin{align*}
    \mathbf{X} \vec{\beta} &\approx \vec{y}\\
    \mathbf{X} \vec{\beta} &\approx \vec{y} \\
    \mathbf{X}^T \mathbf{X} \vec{\beta} &\approx \mathbf{X}^T \vec{y} \\
    \vec{\beta} &\approx \left( \mathbf{X}^T \mathbf{X} \right)^{-1} \mathbf{X}^T \vec{y}
\end{align*}$
</center>
<br>

This way of finding $\vec{\beta}$ involves using the pseudoinverse, $\left( \mathbf{X}^T \mathbf{X} \right)^{-1} \mathbf{X}^T.$ A matrix is not invertible unless it is square and we cannot guarantee this for $\mathbf{X},$ so we must take the pseudoinverse. By multiplying a $\mathbf{X}$ by its transpose, we can ensure that the result is square, and therefore, we can compute the inverse. Using the pseudoinverse minimizes the sum of squared error between the desired output  $\vec{y}$ and the actual output  $\mathbf{X}\vec{\beta}.$
    
For example, let's fit a logistic regression to a medical data set

<center>
$\begin{align*}
[(0, 0, 0.1), (1, 0, 0.2), (0, 2, 0.5), (4,5,0.6)]
\end{align*}$
</center>
<br>

which takes the form

<center>
$\begin{align*}
(\textrm{amount medicine A}, \textrm{amount medicine B}, \textrm{survival probability}).
\end{align*}$
</center>
<br>
 
This data set is for a new medicine where the first column shows the amount of medicine A and the second medicine B. We have data on how well these medicines did when given to patients in differing amounts. 
    
We can fit a logistic regression as follows:

<center>
$\begin{align*}
\mathbf{X} = \begin{pmatrix} 1 & 0 & 0 \\ 1 & 1 & 0 \\ 1 & 0 & 2 \\ 1 & 4 & 5 \end{pmatrix} \ \ \& \ \ \vec{y} = \begin{pmatrix} \ln \left( \dfrac{1}{0.1} - 1 \right) \\ \ln \left( \dfrac{1}{0.2} - 1 \right) \\ \ln \left( \dfrac{1}{0.5} - 1 \right) \\ \ln \left( \dfrac{1}{0.6} - 1 \right) \end{pmatrix}
    = \begin{pmatrix} \ln \left( 9 \right) \\ \ln \left( 4 \right) \\ \ln \left( 1 \right) \\ \ln \left( \dfrac{2}{3} \right) \end{pmatrix}
\end{align*}$
</center>
<br>

<center>
$\begin{align*}
\vec{\beta} &\approx (\mathbf{X}^T \mathbf{X})^{-1} \mathbf{X}^T \vec{y} \\
        \vec{\beta} &\approx \left(\begin{pmatrix} 1 & 1 & 1 & 1\\ 0 & 1 & 0 & 4 \\ 0 & 0 & 2 & 5 \end{pmatrix} \begin{pmatrix} 1 & 0 & 0 \\ 1 & 1 & 0 \\ 1 & 0 & 2 \\ 1 & 4 & 5 \end{pmatrix}\right)^{-1} \begin{pmatrix} 1 & 1 & 1 & 1\\ 0 & 1 & 0 & 4 \\ 0 & 0 & 2 & 5 \end{pmatrix} \begin{pmatrix}\ln \left( 9 \right) \\ \ln \left( 4 \right) \\ \ln \left( 1 \right) \\ \ln \left( \dfrac{2}{3} \right)\end{pmatrix} \\
        \vec{\beta} &\approx \begin{pmatrix} 4 & 5 & 7 \\ 5 & 17 & 20 \\ 7 & 20 & 29 \end{pmatrix} ^{-1} \begin{pmatrix} 1 & 1 & 1 & 1\\ 0 & 1 & 0 & 4 \\ 0 & 0 & 2 & 5 \end{pmatrix} \begin{pmatrix}\ln \left( 9 \right) \\ \ln \left( 4 \right) \\ \ln \left( 1 \right) \\ \ln \left( \dfrac{2}{3} \right)\end{pmatrix} \\
        \vec{\beta} &\approx \begin{pmatrix} 1.567 \\ 0.278 \\ -0.640 \end{pmatrix}
\end{align*}$
</center>
<br>

Now we know the logistic $\beta$'s which are $\beta_0 = 1.567 \ \& \ \beta_1 = 0.278 \ \& \ \beta_2 = -0.640,$ so we plug in the variables $x_1, \ \& \ x_2$ into the equation: 

<center>
$\begin{align*}
     f(x_1,x_2) &=\dfrac{1}{1 + e ^ {\beta_0 + \beta_1  x_1 + \beta_2  x_2}} \\
     &=\dfrac{1}{1 + e ^ {1.567 + 0.278 x_1 -0.640 x_2}}
\end{align*}$
</center>
<br>

Because very little changes from the linear regressor to the logistic regressor, my Python code for the logistic regressor inherits from the linear regressor class and changes only 2 things: it transforms the $\vec{y}$ using $y' = \ln \left( \dfrac{1}{y}-1 \right)$ and puts the $\beta$'s in a sigmoid function rather than a linear function.
     
First, let's go through the code for the linear regressor. We start by importing a Matrix class and a Dataframe class that I had written to help process data. Then, we initialize the linear regressor:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">from</span> <span style="color: #0e84b5; font-weight: bold">matrix</span> <span style="color: #008800; font-weight: bold">import</span> Matrix
<span style="color: #008800; font-weight: bold">from</span> <span style="color: #0e84b5; font-weight: bold">dataframe</span> <span style="color: #008800; font-weight: bold">import</span> DataFrame
<span style="color: #008800; font-weight: bold">import</span> <span style="color: #0e84b5; font-weight: bold">math</span>

<span style="color: #008800; font-weight: bold">class</span> <span style="color: #BB0066; font-weight: bold">LinearRegressor</span>:
    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">__init__</span>(<span style="color: #007020">self</span>, dataframe, dependent_variable<span style="color: #333333">=</span><span style="background-color: #fff0f0">&#39;ratings&#39;</span>):
        <span style="color: #007020">self</span><span style="color: #333333">.</span>dependent_variable <span style="color: #333333">=</span> dependent_variable
        <span style="color: #007020">self</span><span style="color: #333333">.</span>independent_variables <span style="color: #333333">=</span> [column <span style="color: #008800; font-weight: bold">for</span> column <span style="color: #000000; font-weight: bold">in</span> dataframe<span style="color: #333333">.</span>columns <span style="color: #008800; font-weight: bold">if</span> column <span style="color: #333333">!=</span> dependent_variable]
        X_dataframe <span style="color: #333333">=</span> dataframe<span style="color: #333333">.</span>select<span style="color: #333333">.</span>columns(<span style="color: #007020">self</span><span style="color: #333333">.</span>independent_variables)
        y_dataframe <span style="color: #333333">=</span> dataframe<span style="color: #333333">.</span>select_columns([<span style="color: #007020">self</span><span style="color: #333333">.</span>dependent_variable])
        <span style="color: #007020">self</span><span style="color: #333333">.</span>X <span style="color: #333333">=</span> Matrix(X_dataframe<span style="color: #333333">.</span>to_array())
        <span style="color: #007020">self</span><span style="color: #333333">.</span>y <span style="color: #333333">=</span> Matrix(X_dataframe<span style="color: #333333">.</span>to_array())
        <span style="color: #007020">self</span><span style="color: #333333">.</span>coefficients <span style="color: #333333">=</span> {}
</pre></div>
</font>
<br>

The way we would solve to get the $\vec{\beta}$’s is as follows:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">solve_coefficients</span>(<span style="color: #007020">self</span>):
        beta <span style="color: #333333">=</span> (((<span style="color: #007020">self</span><span style="color: #333333">.</span>X<span style="color: #333333">.</span>transpose() <span style="color: #FF0000; background-color: #FFAAAA">@</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>X)<span style="color: #333333">.</span>inverse()) <span style="color: #FF0000; background-color: #FFAAAA">@</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>X<span style="color: #333333">.</span>transpose()) <span style="color: #FF0000; background-color: #FFAAAA">@</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>y
        <span style="color: #007020">self</span><span style="color: #333333">.</span>set_coefficients(beta)

    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">set_coefficients</span>(<span style="color: #007020">self</span>, beta):
        <span style="color: #008800; font-weight: bold">for</span> i, column_name <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">enumerate</span>(<span style="color: #007020">self</span><span style="color: #333333">.</span>dependent_variables):
            <span style="color: #007020">self</span><span style="color: #333333">.</span>coefficients[column_name] <span style="color: #333333">=</span> beta[i]
</pre></div>
</font>
<br>

In order to find the actual prediction that the regression with the $\beta$’s, we need to plug the $\beta$'s into the regression function. For the linear regressor, this is just a linear function $f(x_1,\ldots, x_n)=\beta_0 + \beta_1  x_1 + \ldots + \beta_n  x_n.$ 

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">predict</span>(<span style="color: #007020">self</span>, input_dict):
        <span style="color: #008800; font-weight: bold">return</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>regression_function(input_dict)

    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">regression_function</span>(<span style="color: #007020">self</span>, input_dict):
        <span style="color: #008800; font-weight: bold">return</span> <span style="color: #007020">sum</span>([input_dict[key] <span style="color: #333333">*</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>coefficients[key] <span style="color: #008800; font-weight: bold">for</span> key <span style="color: #000000; font-weight: bold">in</span> input_dict])
</pre></div>
  </font>
  <br>

For the logistic regression, it's the same process but we need to transform the $y$ values:
    
<font size="3em">
  <!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">class</span> <span style="color: #BB0066; font-weight: bold">LogisticRegressor</span>(LinearRegressor):
    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">__init__</span>(<span style="color: #007020">self</span>, dataframe, dependent_variable<span style="color: #333333">=</span><span style="background-color: #fff0f0">&#39;ratings&#39;</span>):
        <span style="color: #007020">super</span>()<span style="color: #333333">.</span>__init__(dataframe, dependent_variable<span style="color: #333333">=</span><span style="background-color: #fff0f0">&#39;ratings&#39;</span>)
        <span style="color: #007020">self</span><span style="color: #333333">.</span>y <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>y<span style="color: #333333">.</span>apply(<span style="color: #008800; font-weight: bold">lambda</span> y: math<span style="color: #333333">.</span>log(<span style="color: #0000DD; font-weight: bold">1</span><span style="color: #333333">/</span>y <span style="color: #333333">-</span> <span style="color: #0000DD; font-weight: bold">1</span>))
</pre></div>
  </font>
  <br>

And we use a different regression function:

<center>
$\begin{align*}
f(x_1,\ldots, x_n)=\dfrac{1}{1+e^{\beta_0 + \beta_1  x_1 + \ldots + \beta_n  x_n}}
\end{align*}$
</center>
<br>

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">regression_function</span>(<span style="color: #007020">self</span>, input_dict):
        linear_sum <span style="color: #333333">=</span> <span style="color: #007020">sum</span>([gathered_inputs[key] <span style="color: #333333">*</span> coefficients[key] <span style="color: #008800; font-weight: bold">for</span> key <span style="color: #000000; font-weight: bold">in</span> gathered_inputs])
        <span style="color: #008800; font-weight: bold">return</span> <span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #333333">/</span> (<span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #333333">+</span> math<span style="color: #333333">.</span>e <span style="color: #333333">**</span> linear_sum)
</pre></div>
</font>
<br>

<i>This post is part 2 of a 3-part series. <a class="body" target="_blank" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-3-categorical-variables-interaction-terms-and-nonlinear-transformations-of-variables/">Click here to continue to part 3.</a></i>
