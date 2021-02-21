---
title: "9 Months Into our First Cohort: What We've Done and Where We're Headed"
author: "Justin Skycak"
tags:
  - Eurisko Program
---

<b>IN PROGRESS</b>

It's been 9 months since our first cohort (<a class="body" href="https://eurisko-us.github.io/colby-roberts" target="_blank">Colby</a>, <a class="body" href="https://eurisko-us.github.io/riley-paddock" target="_blank">Riley</a>, <a class="body" href="https://eurisko-us.github.io/george-meza" target="_blank">George</a>, <a class="body" href="https://eurisko-us.github.io/david-gieselman" target="_blank">David</a>, and <a class="body" href="https://eurisko-us.github.io/elijah-tarr" target="_blank">Elijah</a>) started. In those 9 months, we've covered more ground than I could have possibly imagined. This post is meant to summarize what we've done so far and what our plans are for the future.

<b>Note:</b> All the relevant problem sets, quizzes/tests, and class recordings are documented in the class pages for <a class="body" href="https://eurisko-us.github.io/computation-and-modeling-2020-summer" target="_blank">Computation & Modeling (Summer 2020)</a> and <a class="body" href="https://eurisko-us.github.io/machine-learning-2020-21" target="_blank">Machine Learning (2020-21)</a>. Throughout this post I've included links to some of the more noteworthy problems that the students have completed, but any non-linked problems can also be found on those class pages. The students also have GitHub repositories which can be found on their Eurisko pages (linked in the very first sentence of this post).

Lastly, before we dive into the meat of the post, here is a bit of important background information:

<ul>
<li>These students are currently high school juniors (16-17 years old).</li>
<li>Whenever I say "implemented" or "built", I mean from scratch. The students aren't allowed to use external libraries. They have to build everything themselves. We've been working primarily in Python (though recently, we've also introduced C++ and Haskell).</li>
<li>The students are all mathematically advanced and have learned through linear algebra and multivariable calculus. Most are in <a class="body" href="https://www.mathacademy.us/" target="_blank">Math Academy</a>, which means that by 11th grade, they've learned much of differential equations, discrete math, and abstract algebra as well.</li>
<li>Most of the students had very little programming experience prior to Eurisko. Something as simple as checking if a string was a palindrome was not trivial to them. They didn't know how to write classes and helper functions, how to work with dictionaries, or even how to systematically debug their code.</li>
</ul>

<h2>What We've Done</h2>

Here is a list of the main topics we've covered. 

<b>Algorithms and Data Structures.</b> The students have implemented linked lists, stacks, queues, sorting algorithms (selection sort, bubble sort, heapsort, mergesort, quicksort) and have used recursion in many different contexts. They've also implemented trees, undirected graphs, directed graphs, and weighted graphs, along with methods for computing depth-first / breadth-first traversals and distance / shortest path between two nodes (i.e. Dijkstra's algorithm). They've also implemented a simple version of backtracking to solve a <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-44-1" target="_blank">magic square</a> and a mini sudoku puzzle. (Elijah wrote about the magic square problem <a class="body" href="https://eurisko-us.github.io/solving-magic-squares-using-backtracking/" target="_blank">here</a>.)

<b>Optimization.</b> The students have implemented Newton's method, gradient descent (both single-variable and multivariable), and grid search. They've also implemented randomized hill climbers in the context of the 8-queens problem.

<b>Probability and Statistics.</b> The students have computed expectation and variance for many different types of distributions and have done some <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-41-1" target="_blank">basic Bayesian inference</a> (for example, if you have a set of numbers randomly selected from below some upper bound, the students can construct a confidence interval for the upper bound). The students also write up their problems in LaTeX (using <a class="body" href="https://www.overleaf.com/" target="_blank">Overleaf</a>).

<b>Matrix, DataFrame, and EulerEstimator.</b> The students have built their own Matrix class from scratch, which includes methods to compute RREF, inverse, determinant, etc. They also built a DataFrame class which they use to manipulate datasets, and they built an EulerEstimator class that they use to simulate systems of differential equations.

<b>Machine Learning.</b> The students have built linear/logistic regressors, a naive Bayes classifier, Gini decision trees, simple random forests, and they have just started building neural networks. These machine learning models all run on top of the Matrix, DataFrame, and Graph classes that the students had previously built. The students have also used these models for some <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-35-2" target="_blank">elementary prediction tasks</a> that have required the use of dummy variables and interaction terms. (George, Colby, and Riley wrote a 3-part series about linear and logistic regression: <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-1-understanding-the-models/" target="_blank">part 1</a>, <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-2-fitting-the-models/" target="_blank">part 2</a>, and <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-3-categorical-variables-interaction-terms-and-nonlinear-transformations-of-variables/" target="_blank">part 3</a>.)

<b>Differential Equations.</b> After building an EulerEstimator from scratch, the students used it to simulate several systems of differential equations: a predator-prey model (which David wrote about <a class="body" href="https://eurisko-us.github.io/predator-prey-modeling-with-euler-estimation/" target="_blank">here</a>), the SIR epidemiological model, the <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-52-2" target="_blank">Hodgkin-Huxley neuron</a> (which won the Nobel Prize in the 1960s), and a network of Hodgkin-Huxley neurons connected together.

<b>Object-Oriented Programming.</b> In addition to implementing numerous classes in the context of algorithms / data structures and machine learning, the students have been implementing the Space Empires board game along with intelligent agents that battle against each other. Space Empires is incredibly rich and complex and will be discussed extensively later in this post.

<b>Programming Languages.</b> The students have recently started learning C++, Haskell, Shell, and SQL. So far, the exercises they've completed have been simple Hackerrank-style problems, but we're gradually scaling that up as time goes on.

<b>Writing.</b> The students each wrote a blog post last semester (the posts are linked in the categories above). I've started submitting them on HackerNews, and Elijah's post made it to the front page last weekend (<a class="body" href="https://news.ycombinator.com/item?id=26126652" target="_blank">link</a>). Everyone else's posts will be submitted in the coming weekends.

<h2>Space Empires</h2>

<b>IN PROGRESS</b>

<h2>Where We're Headed</h2>

Here are our plans for the rest of the semester:

<ul>
<li><i>Machine Learning</i> - the students will continue implementing progressively more complex neural networks, more types of ensemble methods (including gradient boosting), and they will use their models for prediction tasks on larger real-world datasets.</li>

<li><i>Data Structures and Algorithms</i> - the students will implement any standard things we haven't done yet (e.g. hash tables and A* search), more heuristic algorithms (e.g. simulated annealing), genetic algorithms.</li>

<li><i>Programming Languages</i> - the students will build their own string and vector classes in C++ and continue learning more advanced C++ and Haskell. They will also take the algorithms and models they had previously written in Python, and rewrite them in C++ with the goal of speeding them up. Lastly, they'll write their own SQL parser in their DataFrame class.</li>

<li><i>Space Empires</i> - the students will continue building up the game level by level and will continue building custom strategies to compete at each level, eventually incorporating some of the more advanced algorithms and machine learning models that they have built. Once the Space Empires games are fully implemented, the students will put them on a server and have the agents communicate with the game using socket connections.</li>

<li><i>Writing</i> - the students will write another round of blog posts.</li>
</ul>

The working title for next year's class (12th grade) is "Intelligent Systems." In that class, the students will aim to

<ul>
<li>continue broadening their knowledge of machine learning (i.e. unsupervised learning and reinforcement learning),</li>
<li>continue re-implementing their models and algorithms in C++ to speed them up,</li>
<li>implement several small-scale games (such as tic-tac-toe, snake, and checkers) and train intelligent agents to play them,</li>
<li>continue improving their intelligent agents in the game of Space Empires, and create an app for playing Space Empires.</li>
</ul>







