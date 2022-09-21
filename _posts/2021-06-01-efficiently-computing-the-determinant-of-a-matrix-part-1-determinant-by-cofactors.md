---
title: "Efficiently Computing the Determinant of a Matrix, Part 1: Determinant by Cofactors"
author: "Charlie Weinberger"
reviewers:
  - "Nathan Reynoso"
tags:
  - Algorithms
---

<i>Note: This post is part 1 of a 2-part series: <a class="body" target="_blank" href="https://eurisko.us/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-1-determinant-by-cofactors/">part 1</a>, <a class="body" target="_blank" href="https://eurisko.us/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-2-determinant-by-elementary-row-operations/">part 2</a>.</i>

The determinant is a number associated with a matrix that can be used to figure out many characteristics of that matrix. You can find the determinant of any square matrix.

For example, the determinant can be used to tell if a matrix is invertible, and it can be used to perform a change of variables in a higher-order integral. It can also tell us if a system of equations has a unique solution, and has multiple uses in calculus and linear algebra, including defining the characteristic polynomial of a matrix.

We denote the determinant of a matrix $A$ as $\vert A \vert$ or $\det(A).$

The determinant of a $1$ by $1$ matrix is the value in the matrix. In the following section, you will learn how to find the determinant of a $2$ by $2$ matrix. After that, you will learn $2$ different methods that you can use to find the determinant of any square matrix. One of those methods (using cofactors) will be very inefficient, whereas the other method (using elementary row operations) will be much more efficient.

<h2>Determinant of a 2 by 2 Matrix</h2>

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

<h2>Determinant by Cofactors: 3 by 3 Example</h2>

The cofactor method is a way to find the determinant of a matrix. This method can be used to find the determinant of any $n$ by $n$ matrix, although it is an inefficient method to use when $n$ is not small.

Here, I'll demonstrate how to use the cofactor method to find the determinant of the $3$ by $3$ matrix shown below.

<center>
$\begin{align*}
\begin{bmatrix}
0 & 2 & 4\\
7 & 24 & 1\\
2 & 6 & 8
\end{bmatrix}
\end{align*}$
</center>
<br>

The first step is to choose which row you want to expand. In general, you want to try to expand the row with the most zeros in it. You will see why in the next step. For this example, I'm going to expand the first row. 

The second step is to expand your chosen row. In this step, we use that fact that the determinant of a $3$ by $3$ matrix is equal to a linear combination of $2$ by $2$ matrices.

The coefficients of these $2$ by $2$ matrices are the elements of the row that we chose times each element's sign from the sign chart. The sign chart for a $3$ by $3$ matrix, shown below, dictates whether the sign of an element needs to be flipped in the linear combination.

<center>
$\begin{align*}
\begin{bmatrix}
+ & - & + \\
- & + & - \\
+ & - & +
\end{bmatrix}
\end{align*}$
</center>
<br>

For the 0, the sign does not matter because $0 = -0$. For the $2$ in the first row, we can see that the corresponding sign is a negative sign. That mean that the sign of $2$ needs to be flipped to be a $-2$. For the $4$ in the first row, we see that the corresponding sign is a positive sign. That means that the sign of $4$ does not need to change.

The $2$ by $2$ matrices in the linear combination will contain all of the elements in the $3$ by $3$ matrix that aren't in the same row or column of each of the $2$ by $2$ matrices' coefficients. To find all of these elements for each element in your chose row, go through each element in your chosen row and use your finger (or imagine doing so) to block out the row and column that contains the element. All elements of the $3$ by $3$ matrix that aren't covered by your fingers will be in that $2$ by $2$ matrix.

For the first $2$ by $2$ matrix, the corresponding coefficient is 0, so we can stop here. This is because any $2$ by $2$ matrix times $0$ will be the zero matrix, which we can disregard when doing addition. This is why it is important to choose to expand the row that has the most zeros.

For the second $2$ by $2$ matrix, the corresponding coefficient is $2$. We see that the $2$ that we are looking for is in the first row and the second column. Blocking out the first row and the second column with our fingers, we see that the $2$ by $2$ matrix will contain the elements $7$, $1$, $2$, and $8$. This gives us the matrix below.

<center>
$\begin{align*}
\begin{vmatrix}
7 & 1 \\
2 & 8
\end{vmatrix}
\end{align*}$
</center>
<br>

For the third element in the first row, we use the same strategy from the second element, where we use our fingers to block out all of the elements in the same row as the corresponding coefficient. That coefficient is now $4$, so we see that this $2$ by $2$ matrix will contain the elements $7$, $24$, $2$, and $6$. This gives us the matrix below.

<center>
$\begin{align*}
\begin{vmatrix}
7 & 24 \\
2 & 6
\end{vmatrix}
\end{align*}$
</center>
<br>

Plugging in the $2$ by $2$ matrices, their corresponding coefficients, and the coefficients' new signs, we have 

<center>
$\begin{align*}
\begin{vmatrix}
0 & 2 & 4 \\
7 & 24 & 1 \\
2 & 6 & 8
\end{vmatrix}
=
0
-
2 \times \begin{vmatrix}
7 & 1 \\
2 & 8
\end{vmatrix}
+
4 \times \begin{vmatrix}
7 & 24 \\
2 & 6
\end{vmatrix}
\end{align*}$
</center>
<br>

We can now solve each $2$ by $2$ matrix as usual, multiply those determinants by the coefficients, and add them up to find the determinant of the $3$ by $3$ matrix. 

Doing this with our example, we have

<center>
$\begin{align*}
\begin{vmatrix}
0 & 2 & 4 \\
7 & 24 & 1 \\
2 & 6 & 8
\end{vmatrix}
&=
0
-
2 \times \begin{vmatrix}
7 & 1 \\
2 & 8
\end{vmatrix}
+
4 \times \begin{vmatrix}
7 & 24 \\
2 & 6
\end{vmatrix} \\
&= -2 \times \left(7 \times 8 - 1 \times 2\right) + 4 \times \left(7 \times 6 - 24 \times 2\right) \\
&= -2 \times 54 + 4 \times -6 \\
&= -132.
\end{align*}$
</center>
<br>

This method works for any $n$ by $n$ matrix, where $n$ is a natural number. 

<h2>Determinant by Cofactors: 4 by 4 Example</h2>

Let's see how we would use the cofactor method to find the determinant of the following $4$ by $4$ matrix:

<center>
$\begin{align*}
\begin{vmatrix}
0 & 2 & 4 & 9 \\
7 & 24 & 1 & 14 \\
2 & 6 & 8 & 0 \\
7 & 2 & 8 & 13
\end{vmatrix}
\end{align*}$
</center>
<br>

Following the steps above, we choose the first row as the one to expand, because it is tied for the most zeros. Second, we expand the matrix. The coefficients will be $0, 2, 4,$ and $9,$ respectively. When we put the coefficients together with the signs of $+, -, +,$ and $-,$ respectively, we have the new coefficients $0, -2, 4,$ and $-9.$

For the coefficient $0,$ the corresponding matrix does not matter, because it is multiplied by $0.$

For the coefficient $-2,$ the corresponding $3$ by $3$ matrix is

<center>
$\begin{align*}
\begin{vmatrix}
7 & 1 & 14 \\
2 & 8 & 0 \\
7 & 8 & 13
\end{vmatrix}
\end{align*}$
</center>
<br>

For the coefficient $4,$ the corresponding $3$ by $3$ matrix is

<center>
$\begin{align*}
\begin{vmatrix}
7 & 24 & 14 \\
2 & 6 & 0 \\
7 & 2 & 13
\end{vmatrix}
\end{align*}$
</center>
<br>

For the coefficient $-9,$ the corresponding $3$ by $3$ matrix is

<center>
$\begin{align*}
\begin{vmatrix}
7 & 24 & 1  \\
2 & 6 & 8 \\
7 & 2 & 8
\end{vmatrix}
\end{align*}$
</center>
<br>

Therefore, adding the matrices and their coefficients together, we see that

<center>
$\begin{align*}
\begin{vmatrix}
0 & 2 & 4 & 9 \\
7 & 24 & 1 & 14 \\
2 & 6 & 8 & 0 \\
7 & 2 & 8 & 13
\end{vmatrix}
=
0 \cdot *
-
2 \cdot \begin{vmatrix}
7 & 1 & 14 \\
2 & 8 & 0 \\
7 & 8 & 13
\end{vmatrix}
+
4 \cdot \begin{vmatrix}
7 & 24 & 14 \\
2 & 6 & 0 \\
7 & 2 & 13
\end{vmatrix}
-
9 \cdot \begin{vmatrix}
7 & 24 & 1  \\
2 & 6 & 8 \\
7 & 2 & 8
\end{vmatrix}
\end{align*}$
</center>
<br>

We can use the same process from before to find the determinant of each $3$ by $3$ matrix, then add them together to find the determinant of the $4$ by $4$ matrix.

<h2>Implementing Determinant by Cofactors</h2>

Computing the determinant of a matrix using the cofactor method can take a long time. Instead of doing it all by hand, we can write a program that will do this for us. Below, I have a program that can compute the determinant of a matrix using the cofactor method. This program, technically called a method, is part of an object. In python, the language that I'm using, an object is a collection of data and methods that act of that data. When we set a variable equal to this object and include parameters, the variable becomes a class. When inside the object, we use "self" to refer to this variable. Self has different attributes that we have given it, and can use the methods in the class to manipulate those attributes and give us what we want.

The method below is from an object that I have created python. This object has one attribute, called "elements", which is the elements of our matrix. It is really a lists of lists, not an array. The method <code>calc_cofactor_method_determinant()</code> below takes self and finds the determinant of <code>self.elements</code> (the "elements" attribute) using the cofactor method. From now on, I may say "the matrix" to refer to <code>self.elements</code>.

To access an element of the matrix, we write <code>self.elements[i][j]</code>, where <code>i</code> is the index of the row that the element is in, and <code>j</code> is the index of the column that the element is in. The indices of lists start from $0$ and increase one at a time. That means the first row/column has index $0$, the second row/column has index $1$, and so on. So if we wanted to access the element in the first column and the first row, we would write <code>self.elements[0][0]</code>. If we canted to access the element in the third column and the second row of a matrix, we could write <code>self.elements[1][2]</code>.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">calc_cofactor_method_determinant</span>(<span style="color: #007020">self</span>):
    
    <span style="color: #008800; font-weight: bold">if</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>num_rows <span style="color: #333333">!=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>num_cols:
        <span style="color: #008800; font-weight: bold">raise</span> <span style="color: #FF0000; font-weight: bold">Exception</span>(<span style="background-color: #fff0f0">&quot;Cannot take cofactor_method_determinant of a non-square matrix&quot;</span>)
    
    <span style="color: #008800; font-weight: bold">elif</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>num_rows <span style="color: #333333">==</span> <span style="color: #0000DD; font-weight: bold">1</span>:
        <span style="color: #008800; font-weight: bold">return</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[<span style="color: #0000DD; font-weight: bold">0</span>][<span style="color: #0000DD; font-weight: bold">0</span>]
    
    <span style="color: #008800; font-weight: bold">elif</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>num_rows <span style="color: #333333">==</span> <span style="color: #0000DD; font-weight: bold">2</span>:
        a, b <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[<span style="color: #0000DD; font-weight: bold">0</span>][<span style="color: #0000DD; font-weight: bold">0</span>], <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[<span style="color: #0000DD; font-weight: bold">0</span>][<span style="color: #0000DD; font-weight: bold">1</span>]
        c, d <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[<span style="color: #0000DD; font-weight: bold">1</span>][<span style="color: #0000DD; font-weight: bold">0</span>], <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[<span style="color: #0000DD; font-weight: bold">1</span>][<span style="color: #0000DD; font-weight: bold">1</span>]
        <span style="color: #008800; font-weight: bold">return</span> a<span style="color: #333333">*</span>d <span style="color: #333333">-</span> b<span style="color: #333333">*</span>c
    
    <span style="color: #008800; font-weight: bold">else</span>:
        ans <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
        row_index <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
        <span style="color: #008800; font-weight: bold">for</span> col_index <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #007020">self</span><span style="color: #333333">.</span>num_cols):
            
            coefficient_sign <span style="color: #333333">=</span> (<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span> <span style="color: #333333">**</span> col_index)
            coefficient <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>elements[row_index][col_index]
            minor <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>calc_minor(row_index, col_index)
            
            ans <span style="color: #333333">+=</span> coefficient_sign <span style="color: #333333">*</span> coefficient <span style="color: #333333">*</span> minor<span style="color: #333333">.</span>cofactor_method_determinant()
        
        <span style="color: #008800; font-weight: bold">return</span> ans
</pre></div>
</font>
<br>

First, because we can only take the determinant of a square matrix, we need to make sure that the matrix is a square matrix. If <code>self.num_rows</code> (which counts the number of rows in our matrix) is not equal to <code>self.num_cols</code> (which counts the number of columns in our matrix), then we raise an exception.

Then, we check if the matrix is either a $1$ by $1$ matrix or a $2$ by $2$ matrix. We do this because we know the formulas for computing the determinant of these matrices. If the matrix is a $1$ by $1$ matrix, then we return the only element in the matrix. If the matrix is a $2$ by $2$ matrix, then we use the formula discussed in introduction: we set $a, b, c,$ and $d$ to their respective numbers in the matrix and return $ad - bc.$

If a matrix is not a $1$ by $1$ matrix or a $2$ by $2$ matrix, then the process is more complicated. We start to use the cofactor method here. As usual with the cofactor method, the first step is to choose which row we want to expand. For simplicity, I chose the first row. Next, we loop through the number of columns in the matrix. Before the recursion kicks in, we must compute the first minor, its coefficient, and the coefficient's sign. 

We compute the sign by raising $-1$ to the index of the current column. If <code>col_index</code> equals $0$, for example then the sign is $-1^{0} = 1$. When we multiply the coefficient by its sign, the coefficient keeps the same sign, as it should. To access the coefficient, we take the current element, which is at the row index $0$ and the current column index.

To compute the minor, we use the helper method called <code>calc_minor</code>. This method takes self, a row index, and a column index, and returns a modified version of self called minor that only has the elements that don't have the same row index or column index as the parameters of the method.

Because we are using recursion, we will take the determinant of that minor using the cofactor method. Then, we take the determinant of the minors of that minor. This continues until we have the determinants of all the minors for the first minor of the matrix. Then, we multiply each minor to its corresponding coefficient that that coefficient's sign, and add this sum to out answer. Then, <code>col_index</code> increases and we do the whole thing again for the second minor of the matrix. 

Eventually, we loop through all the minors of the matrix. We just return our answer and we are done! We have successfully computed the determinant of a matrix using the cofactor method and the help of a method.

<h2>Time Complexity</h2>

When we found the determinant of a $4 \times 4$ matrix, the first step was to expand it into 4 $3 \times 3$ matrices. When we found the determinant of a $3 \times 3$ matrix, the first step was to expand it into 3 $2 \times 2$ matrices. We can see a pattern here: when solving an $n \times n$ matrix, we expand it into $n$ $(n-1) \times (n-1)$ matrices.

Continuing the expansion, when solving an $n \times n$ matrix, we would have $\dfrac{n!}{2}$ $2 \times 2$ matrices.

There are three operations per $2 \times 2$ matrix: multiplying the first and fourth elements, multiplying the second and third elements, and subtracting the latter from the former. Given that we have $\dfrac{n!}{2}$ $2 \times 2$ matrices, for the $2 \times 2$ matrices in the expansion of an $n \times n$ matrix, we have $\dfrac{3}{2}n!$ operations.

Finally, we must multiply our number of operations for all $2 \times 2$ matrices by $2$, because every $2 \times 2$ matrix can have a coefficient, which is one extra operation. This brings our maximum number of operations for finding the determinant of an $n \times n$ matrix to $3 \cdot n!$ operations. This is very inefficient!

<i>This post is part 1 of a 2-part series. <a class="body" target="_blank" href="https://eurisko.us/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-2-determinant-by-elementary-row-operations/">Click here to continue to part 2.</a></i>
