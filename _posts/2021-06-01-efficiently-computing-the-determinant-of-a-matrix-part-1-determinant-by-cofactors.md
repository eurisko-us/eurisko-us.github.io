---
title: "Efficiently Computing the Determinant of a Matrix, Part 1: Determinant By Cofactors"
author: "Charlie Weinberger"
reviewers:
  - "Nathan Reynoso"
tags:
  - Algorithms
---

<i>Note: This post is part 1 of a 2-part series: <a class="body" target="_blank" href="https://eurisko-us.github.io/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-1-determinant-by-cofactors/">part 1</a>, <a class="body" target="_blank" href="https://eurisko-us.github.io/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-2-determinant-by-elementary-row-operations/">part 2</a>.</i>

The determinant is a number associated with a matrix that can be used to figure out many characteristics of that matrix. You can find the determinant of any square matrix.

For example, the determinant can be used to tell if a matrix is invertible, and it can be used to perform a change of variables in a higher-order integral. It can also tell us if a system of equations has a unique solution, and has multiple uses in calculus and linear algebra, including defining the characteristic polynomial of a matrix.

We denote the determinant of a matrix A as $|A|$ or $\det(A).$

The determinant of a $1$ by $1$ matrix is the value in the matrix. In the following section, you will learn how to find the determinant of a $2$ by $2$ matrix. After that, you will learn $2$ different methods that you can use to find the determinant of any square matrix. One of those methods (using cofactors) will be very inefficient, whereas the other method (using elementary row operations) will be much more efficient.

<h2>Determinant of a $2$ by $2$ Matrix</h2>

The formula for finding the determinant of a $2$ by $2$ matrix is very simple. For a matrix

<center>
$\begin{align*}
A = \begin{bmatrix} 
a & b \\
c & d 
\end{bmatrix}
\end{align*}$
</center>
<br>

we have

<center>
$\begin{align*}
\text{det}(A) = ad - bc.
\end{align*}$
</center>
<br>

To show how simple finding the determinant of a $2$ by $2$ matrix can be, I'll provide an example. Let's say we have the matrix

<center>
$\begin{align*}
A = \begin{bmatrix}
1 & 2 \\
3 & 4
\end{bmatrix}.
\end{align*}$
</center>
<br>

Using the formula, the determinant of this matrix is

<center>
$\begin{align*}
\det(A) &= 1 \cdot 4 - 3 \cdot 2 \\
  &= 4 - 6 \\
  &= -2.
\end{align*}$
</center>
<br>

<h2>Determinant by Cofactors</h2>
