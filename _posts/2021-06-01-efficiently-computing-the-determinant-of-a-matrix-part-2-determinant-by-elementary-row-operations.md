---
title: "Efficiently Computing the Determinant of a Matrix, Part 2: Determinant by Elementary Row Operations"
author: "Nathan Reynoso"
reviewers:
  - "Charlie Weinberger"
tags:
  - Algorithms
---

<i>Note: This post is part 2 of a 2-part series: <a class="body" target="_blank" href="https://eurisko.us/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-1-determinant-by-cofactors/">part 1</a>, <a class="body" target="_blank" href="https://eurisko.us/2021-06-01-efficiently-computing-the-determinant-of-a-matrix-part-2-determinant-by-elementary-row-operations/">part 2</a>.</i>

Computing the determinant by hand is often annoying, and using the cofactor method takes more time the larger the matrix. The most efficient way to compute the determinant of a matrix is through using elementary row operations. Through this process, we reduce the matrix to echelon form and take the operations we did on the rows to compute the determinant.

Our first step is to take any given matrix to echelon form, but we have to keep track of the row operations we apply to be able to use them later when computing the determinant. Below, I have a randomly generated a $3\times 3$ matrix:

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

The frst thing we would do is switch our top and bottom rows ($R_1$ and $R_3$). Then, we would divide our top row by 2 to get our pivot row for column $1$. We'll need to keep a list of all numbers we divide any row by and the number of times we switch rows.

<center>
$\begin{align*}
\begin{bmatrix}
1&3&4\\
7&24&1\\
0&2&4
\end{bmatrix} , \text{row divisors:(2), row swaps:(1)}
\end{align*}$
</center>
<br>

Next we subtract $7\times R_{1}$ from $R_{2}$. After that we subtract $R_{2}$ from $R_{1}$.

<center>
$\begin{align*}
\begin{bmatrix}
1&3&4\\
0&3&20\\
0&2&4
\end{bmatrix}, \text{row divisors:(2), row swaps:(1)}
\end{align*}$
</center>
<br>

<center>
$\begin{align*}
\begin{bmatrix}
1&0&-16\\
0&3&-27\\
0&2&4
\end{bmatrix}, \text{row divisors:(2), row swaps:(1)}
\end{align*}$
</center>
<br>

Now we divide $R_{2}$ by 3, and subtract $2\times R_{2}$ from $R_{3}$. We can also divide $R_{3}$ by $22$ as well.

<center>
$\begin{align*}
\begin{bmatrix}
1&0&-16\\
0&1&-9\\
0&0&1
\end{bmatrix},\text{row divisors:(2,3,22), row swaps:(1)} 
\end{align*}$
</center>
<br>

At this point we can see the matrix does reduce to the identity, so we can stop here. Now with the row divisors and swaps we collected we can use them to calculate the determinant. To get it, we take the product of the divisors and multiply it by $-1$ to the power of the number of row swaps:

<center>
$\begin{align*}
(2\times 3\times 22)\times -1^{1} = -132
\end{align*}$
</center>
<br>

When computing the determinant using either the cofactor method or by using a calculator, we can see this is actually the determinant.

<h2>Implementation</h2>

Below is the actual code for computing the determinant via row operations that I implemented into my matrix class. The first thing it's doing is making a copy of the matrix, so that we don't mutate the original matrix. Then we make a variable called <code>factors</code> that will be what the method returns, and that's what we multiply our dividing numbers by.

After, we ensure the matrix is square, otherwise you can't compute the determinant. We then loop throw each row of the matrix, checking which row is the pivot row, and making sure the pivot row is where its supposed to be (in the position of the next column that needs a pivot). Once we have the pivot row in the correct position, we multiply the <code>factors</code> variable by the pivot number, and then reduce the column that number is in to $1$'s and $0$'s. Then we move on to the next row. After going through the whole matrix, we return the <code>factors</code> variable.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">calc_determinant</span>(<span style="color: #007020">self</span>):
    matrix <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>copy()
    factors <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">1</span>
    row_index <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>

    <span style="color: #008800; font-weight: bold">if</span> matrix<span style="color: #333333">.</span>num_cols <span style="color: #333333">!=</span> matrix<span style="color: #333333">.</span>num_rows:
       <span style="color: #008800; font-weight: bold">return</span> (<span style="background-color: #fff0f0">&quot;Non-square matrices have no determinant.&quot;</span>)

    <span style="color: #008800; font-weight: bold">for</span> col <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(matrix<span style="color: #333333">.</span>num_cols):
        pivot <span style="color: #333333">=</span> matrix<span style="color: #333333">.</span>get_pivot_row(col)

        <span style="color: #008800; font-weight: bold">if</span> pivot <span style="color: #333333">!=</span> <span style="color: #007020">None</span>:
            <span style="color: #008800; font-weight: bold">if</span> pivot <span style="color: #333333">!=</span> row_index:
                matrix <span style="color: #333333">=</span> matrix<span style="color: #333333">.</span>swap_rows(row_index, pivot)
                factors <span style="color: #333333">*=</span> <span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span>

            factors <span style="color: #333333">*=</span> matrix<span style="color: #333333">.</span>elements[pivot][col]
            matrix <span style="color: #333333">=</span> matrix<span style="color: #333333">.</span>normalize_row(row_index)
            matrix <span style="color: #333333">=</span> matrix<span style="color: #333333">.</span>clear_above(row_index)
            matrix <span style="color: #333333">=</span> matrix<span style="color: #333333">.</span>clear_below(row_index)
            row_index <span style="color: #333333">+=</span> <span style="color: #0000DD; font-weight: bold">1</span>

        <span style="color: #008800; font-weight: bold">else</span>:
            mult_constant <span style="color: #333333">*=</span> <span style="color: #0000DD; font-weight: bold">0</span>
            <span style="color: #008800; font-weight: bold">continue</span>

    <span style="color: #008800; font-weight: bold">return</span> factors
</pre></div>
</font>
<br>

<h2>Time Complexity</h2>

When using this method to compute the determinant, the computation is relatively fast compared to other methods. Lets assume we have a $n \times n$ matrix that can be taken to echelon form, then we can easily find the maximum amount of computations needed to find the determinant using this method. Assuming that all the entries are not $1$, then for each row, you would divide by a number at some point, so that's $n$ computations so far. For each row, you will also have to subtract it from all the other rows to make it the pivot row, which is $n-1$ more computations for $n$ rows, which is $n(n-1)$. This gives us $n+n(n-1) = n^2$ total computations.

This is much more efficient than computing the determinant via the cofactor method, which can take $n!$ operations.
