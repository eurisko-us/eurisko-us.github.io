---
title: "Solving Magic Squares using Backtracking"
author: "Elijah Tarr"
reviewers:
  - "Colby Roberts"
  - "George Meza"
tags:
  - Optimization
---

A magic square can be thought of as a matrix with specific rows, columns, and diagonals adding up to the same number, called the magic constant. For an $n \times n$ magic square, the magic constant is

<center>
$\begin{align*}
\dfrac{1}{n} \sum_{k=1}^{n^2} k
\end{align*}$
</center>
<br>

For example, a magic square with dimensions $3 \times 3$ would have magic constant $15,$ and dimensions $4 \times 4$ would have magic constant $34.$

To solve a magic square, we must fill in each element with a number in $\{1, 2, \ldots, n^2 \},$ and each number must appear exactly once. A $3 \times 3$ magic square could look like this:

<center>
$\begin{align*}
\begin{bmatrix}
2 & 7 & 6 \\
9 & 5 & 1 \\
4 & 3 & 8
\end{bmatrix}
\end{align*}$
</center>
<br>

Or this:

<center>
$\begin{align*}
\begin{bmatrix}
8 & 3 & 4 \\
1 & 5 & 9 \\
6 & 7 & 2
\end{bmatrix}
\end{align*}$
</center>
<br>

It may seem like a $3 \times 3$ magic square can have multiple solutions. But looking closer allows us to see that the two matrices above are actually both the same configuration. The second matrix is just the first matrix rotated $180$ degrees. In general, rotating and flipping a magic square in any direction will still yield a valid magic square.

<h2>Solving a Magic Square Using Brute Force</h2>

How can we build a program to construct one of these magic squares?

Just like every problem, the simplest way to solve a magic square is to use brute force. It will be the most inefficient solution we can think of, but it will give us some grounding to see which areas we need to improve it in. To get some code down, we can write something like this:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">gen_magic_square</span>():
    <span style="color: #008800; font-weight: bold">for</span> x1 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
        <span style="color: #008800; font-weight: bold">for</span> x2 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
            <span style="color: #008800; font-weight: bold">for</span> x3 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                <span style="color: #008800; font-weight: bold">for</span> x4 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                    <span style="color: #008800; font-weight: bold">for</span> x5 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                        <span style="color: #008800; font-weight: bold">for</span> x6 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                            <span style="color: #008800; font-weight: bold">for</span> x7 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                <span style="color: #008800; font-weight: bold">for</span> x8 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                    <span style="color: #008800; font-weight: bold">for</span> x9 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                        square <span style="color: #333333">=</span> [[x1, x2, x3],
                                                  [x4, x5, x6],
                                                  [x7, x8, x9]]
                                        <span style="color: #008800; font-weight: bold">if</span> is_valid(square, <span style="color: #0000DD; font-weight: bold">15</span>):
                                            <span style="color: #008800; font-weight: bold">return</span> square
</pre></div>
</font>

The classic $9$-nested-for-loop approach. It is quite inefficient, but it will do the job. Each $x_k$ variable represents a space in the square. There are 9 spaces, so we nest $9$ loops, $1$ for each space. Each loop will loop through all the possible numbers in that space, $1$ through $9.$ 

To write the <code>is_valid</code> function, we need to check for duplicate values, which can easily be done with the use of a set. Then we have to check if each row, column, and diagonal adds up to a certain number, so we can just make a list of all those and check if they are equal to 15 at the end.

<font size="3em">
  <!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">is_valid</span>(square, n):
    vals <span style="color: #333333">=</span> [entry <span style="color: #008800; font-weight: bold">for</span> row <span style="color: #000000; font-weight: bold">in</span> square <span style="color: #008800; font-weight: bold">for</span> entry <span style="color: #000000; font-weight: bold">in</span> row <span style="color: #008800; font-weight: bold">if</span> entry <span style="color: #333333">!=</span> <span style="color: #007020">None</span>]
    <span style="color: #008800; font-weight: bold">if</span> <span style="color: #007020">len</span>(<span style="color: #007020">set</span>(vals)) <span style="color: #333333">&lt;</span> <span style="color: #007020">len</span>(vals): <span style="color: #888888"># check for duplicates</span>
        <span style="color: #008800; font-weight: bold">return</span> <span style="color: #007020">False</span>
        
    num_rows <span style="color: #333333">=</span> <span style="color: #007020">len</span>(square)
    arrs <span style="color: #333333">=</span> square \ <span style="color: #888888"># rows</span>
        <span style="color: #333333">+</span> [<span style="color: #007020">list</span>(arr) <span style="color: #008800; font-weight: bold">for</span> arr <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">zip</span>(<span style="color: #333333">*</span>square)] \ <span style="color: #888888"># columns</span>
        <span style="color: #333333">+</span> [square[i][i] <span style="color: #008800; font-weight: bold">for</span> i <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #007020">len</span>(square))] <span style="color: #888888"># main diagonal</span>
        <span style="color: #333333">+</span> [square[i][num_rows<span style="color: #333333">-</span>i<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span>] <span style="color: #008800; font-weight: bold">for</span> i <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(num_rows)] <span style="color: #888888"># anti-diagonal</span>
    <span style="color: #008800; font-weight: bold">return</span> <span style="color: #007020">all</span>(<span style="color: #007020">sum</span>(arr) <span style="color: #333333">==</span> n <span style="color: #008800; font-weight: bold">for</span> arr <span style="color: #000000; font-weight: bold">in</span> arrs <span style="color: #008800; font-weight: bold">if</span> <span style="color: #007020">None</span> <span style="color: #000000; font-weight: bold">not</span> <span style="color: #000000; font-weight: bold">in</span> r)
</pre></div>
</font>

Because I want this function to be able to run on squares larger than just $3 \times 3,$ I pass in the constant as $n$. For a $3 \times 3$ square, we would set $n=15.$ For a $4 \times 4$ square, we would set $n=34.$

<h2>Brute Force Takes Forever!</h2>

Let's talk about timing. We have $9$ nested for loops, and the <code>is_valid</code> operation is in the deepest one. Since each loop is going to run $9$ times to test each number $1-9$ in each element of the square, it's going to run the <code>is_valid</code> function $9^9$ times, which is absolutely insane.

Using Python's <code>timeit</code> module, we can see how long the <code>is_valid</code> function takes to run:

<ul>
  <li>$1.6 \, \mu\textrm{s}$ to run if there are duplicate values</li>
  <li>$5.3 \, \mu\textrm{s}$ to run if there are no duplicate values</li>
  <li>$6.3 \, \mu\textrm{s}$ to run if the square is valid</li>
</ul>

With this brute force algorithm, we can expect that the vast majority of iterations are going to have duplicate values in them. So, I'll be generous and say that each time it runs, $1.6 \, \mu\textrm{s}$ pass. That means the amount of time it takes is $9^9 \times 1.6 \textrm{ usecs} \sim 10.3 \textrm{ minutes}.$

What if we wanted a $4 \times 4$ magic square? Well, we can use the equation again: $16^{16} \times 1.6 \mu\textrm{s} \sim \textbf{600 millennia}.$ It's very unlikely that the human race will even exist for that long; we might have destroyed the earth along with the computer that was running this algorithm by then. We need to write a more efficient algorithm.

<h2>Backtracking</h2>

The problem with brute force is that it spends too much time looking through solutions that will never work. For example, the algorithm starts out with the square

<center>
$\begin{align*}
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 1
\end{bmatrix},
\end{align*}$
</center>
<br>

and then advances to

<center>
$\begin{align*}
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 2
\end{bmatrix},
\end{align*}$
</center>
<br>

and then

<center>
$\begin{align*}
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 3
\end{bmatrix}.
\end{align*}$
</center>
<br>

There's absolutely no point in checking any square with the first $3$ numbers as $1$ because we're not allowed to have duplicates.

To avoid configurations like $1,1,1$ as the top row, we can use a technique called <b>backtracking</b>. Whenever we reach a configuration that won't work, we "backtrack" and skip over that configuration instead of wasting tons of time modifying it in ways that will never make it valid.

Using backtracking, we would skip over all configurations that have duplicates, and instead start out with

<center>
$\begin{align*}
\begin{bmatrix}
1 & 2 & 3\\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}.
\end{align*}$
</center>
<br>

To implement backtracking, we'll start by skipping over configurations with duplicates. In each for loop, before entering the next loop, we will check if the number has been duplicated anywhere. We will only check the rest of the square if the number isn’t duplicated. Implementing this, we end up with the following code:

<font size="3em">
  <!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">gen_magic_square</span>()
    <span style="color: #008800; font-weight: bold">for</span> x1 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
        <span style="color: #008800; font-weight: bold">for</span> x2 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
            <span style="color: #008800; font-weight: bold">if</span> x2 <span style="color: #000000; font-weight: bold">in</span> [x1]:
                <span style="color: #008800; font-weight: bold">continue</span>
            <span style="color: #008800; font-weight: bold">for</span> x3 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                <span style="color: #008800; font-weight: bold">if</span> x3 <span style="color: #000000; font-weight: bold">in</span> [x1, x2]:
                    <span style="color: #008800; font-weight: bold">continue</span>
                <span style="color: #008800; font-weight: bold">for</span> x4 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                    <span style="color: #008800; font-weight: bold">if</span> x4 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3]:
                        <span style="color: #008800; font-weight: bold">continue</span>
                    <span style="color: #008800; font-weight: bold">for</span> x5 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                        <span style="color: #008800; font-weight: bold">if</span> x5 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3, x4]:
                            <span style="color: #008800; font-weight: bold">continue</span>
                        <span style="color: #008800; font-weight: bold">for</span> x6 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                            <span style="color: #008800; font-weight: bold">if</span> x6 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3, x4, x5]:
                                <span style="color: #008800; font-weight: bold">continue</span>
                            <span style="color: #008800; font-weight: bold">for</span> x7 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                <span style="color: #008800; font-weight: bold">if</span> x7 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3, x4, x5, x6]:
                                    <span style="color: #008800; font-weight: bold">continue</span>
                                <span style="color: #008800; font-weight: bold">for</span> x8 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                    <span style="color: #008800; font-weight: bold">if</span> x8 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3, x4, x5, x6, x7]:
                                        <span style="color: #008800; font-weight: bold">continue</span>
                                    <span style="color: #008800; font-weight: bold">for</span> x9 <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">10</span>):
                                        <span style="color: #008800; font-weight: bold">if</span> x9 <span style="color: #000000; font-weight: bold">in</span> [x1, x2, x3, x4, x5, x6, x7, x8]:
                                            <span style="color: #008800; font-weight: bold">continue</span>
                                        square <span style="color: #333333">=</span> [[x1, x2, x3], [
                                            x4, x5, x6], [x7, x8, x9]]
                                        <span style="color: #008800; font-weight: bold">if</span> is_valid(square, <span style="color: #0000DD; font-weight: bold">15</span>):
                                            <span style="color: #008800; font-weight: bold">return</span> square
</pre></div>
</font>

Once we run this code, we notice a massive improvement in performance! Within only a couple of seconds, our algorithm actually finds multiple squares.

With this new algorithm, we skip all squares which repeat numbers, which will always be invalid. So, we are looping through all permutations. We can expect to run the validation function about $P(10, 9) = 3,628,800$ times, which is much less than the $9^9$ times we had to check last time.

Now, this method speeds up our code, but by how much? Theoretically, it takes $P(10, 9) * 1.6 \mu\textrm{s} \sim 5.8 \mu\textrm{s}$ to just run all the validations. (We introduced a bunch of 'if' statements in between each of the for loops, so it will take a bit longer in reality.) But the point is, our new algorithm works $10,600\%$ faster than the old one!

<h2>Using a While Loop</h2>

Still, we have another problem left, and that is the quality of the code. No one wants to have to look at a cascading abyss of for loops and if statements while writing their code, so let's see if we can combine all this into a single while loop.

If you think about it, we can treat the square as a list of numbers instead of a list of rows. Instead of $[[1, 2, 3], [4, 5, 6], [7, 8, 9]],$ we can store the array as $[1, 2, 3, 4, 5, 6, 7, 8, 9].$ Now, that means we will need a function to convert the flat list into a square:

<font size="3em">
  <!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">arr_to_square</span>(arr):
    side_length <span style="color: #333333">=</span> <span style="color: #007020">int</span>(<span style="color: #007020">len</span>(arr) <span style="color: #333333">**</span> <span style="color: #6600EE; font-weight: bold">0.5</span>)
    <span style="color: #008800; font-weight: bold">return</span> [arr[i:i<span style="color: #333333">+</span>side_length] <span style="color: #008800; font-weight: bold">for</span> i <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #0000DD; font-weight: bold">0</span>, <span style="color: #007020">len</span>(arr), side_length)]
</pre></div>
</font>

Now, let's think of how we can structure the while loop. We want the loop to keep going until both the value None is nowhere to be found in the list, and the square is valid. We can use the 'or' operator to run the loop if None is in the square, or the square isn't valid, like this:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">gen_magic_square</span>(size):
    n <span style="color: #333333">=</span> get_magic_const(size)
    square <span style="color: #333333">=</span> [<span style="color: #007020">None</span> <span style="color: #008800; font-weight: bold">for</span> i <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(size<span style="color: #333333">**</span><span style="color: #0000DD; font-weight: bold">2</span>)]
    
    <span style="color: #008800; font-weight: bold">while</span> <span style="color: #007020">None</span> <span style="color: #000000; font-weight: bold">in</span> square <span style="color: #000000; font-weight: bold">or</span> <span style="color: #000000; font-weight: bold">not</span> is_valid(arr_to_square(square), n):
        <span style="color: #008800; font-weight: bold">pass</span>
    <span style="color: #008800; font-weight: bold">return</span> arr_to_square(square)
</pre></div>
</font>

You'll notice I use the function <code>get_magic_const</code>, which computes the magic constant, like this:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">get_magic_const</span>(side_length):
    <span style="color: #008800; font-weight: bold">return</span> side_length<span style="color: #333333">*</span>(side_length<span style="color: #333333">**</span><span style="color: #0000DD; font-weight: bold">2</span><span style="color: #333333">+</span><span style="color: #0000DD; font-weight: bold">1</span>)<span style="color: #333333">/</span><span style="color: #0000DD; font-weight: bold">2</span>
</pre></div>
</font>

We will need a variable to store the index of the element we want to modify. So, let's set <code>index</code> to $0$ at the beginning. Now, we want to add $1$ to the value at <code>index</code> so we can keep searching through for the correct square. We start out with $9$ <code>None</code> values in the list, so if the value is <code>None</code>, we should just set it to $1$ instead of adding $1.$ However, setting the value to $0$ if <code>None</code> before adding $1$ will save us an extra line of code.

<font size="3em">
  <!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">current_index <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
<span style="color: #008800; font-weight: bold">while</span> <span style="color: #007020">None</span> <span style="color: #000000; font-weight: bold">in</span> square <span style="color: #000000; font-weight: bold">or</span> <span style="color: #000000; font-weight: bold">not</span> is_valid(arr_to_square(square), n):
    <span style="color: #008800; font-weight: bold">if</span> square[current_index] <span style="color: #333333">==</span> <span style="color: #007020">None</span>:
        square[current_index] <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
    square[current_index] <span style="color: #333333">+=</span> <span style="color: #0000DD; font-weight: bold">1</span>
    <span style="color: #888888"># ...</span>
</pre></div>
</font>

Next, we want to check if the index has any duplicates in the list. If it does, we should keep incrementing the current element, and we can do that by just continuing to the next iteration.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">if</span> square<span style="color: #333333">.</span>count(square[current_index]) <span style="color: #333333">&gt;</span> <span style="color: #0000DD; font-weight: bold">1</span>:
    <span style="color: #008800; font-weight: bold">continue</span>
</pre></div>
</font>

Another constraint we have is how large the element can be. Each magic square has to have $1$ of each number from $1$ to its length, so we check if the current element is within that range. If it is out of that range, we know we can't increase the number any further, because that will also be out of range, and we also know we can't go to the next index, because we still will have an out-of-range number. This is a good opportunity for backtracking, so we can just set the current element back to None and subtract $1$ from the index, like this:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">if</span> square[current_index] <span style="color: #333333">&gt;=</span> <span style="color: #007020">len</span>(square)<span style="color: #333333">+</span><span style="color: #0000DD; font-weight: bold">1</span>:
    square[current_index] <span style="color: #333333">=</span> <span style="color: #007020">None</span>
    current_index <span style="color: #333333">-=</span> <span style="color: #0000DD; font-weight: bold">1</span>
    <span style="color: #008800; font-weight: bold">continue</span>
</pre></div>
</font>

Lastly, if the square does actually turn out to be valid, we should add $1$ to the <code>index</code>.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">if</span> is_valid(arr_to_square(square), n):
    current_index <span style="color: #333333">+=</span> <span style="color: #0000DD; font-weight: bold">1</span>
</pre></div>
</font>

Now, we can combine all these sections of code into a single grand function, like so:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">gen_magic_square</span>(size):
    n <span style="color: #333333">=</span> get_magic_const(size)
    square <span style="color: #333333">=</span> [<span style="color: #007020">None</span> <span style="color: #008800; font-weight: bold">for</span> i <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(size<span style="color: #333333">**</span><span style="color: #0000DD; font-weight: bold">2</span>)]
    current_index <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
    <span style="color: #008800; font-weight: bold">while</span> <span style="color: #007020">None</span> <span style="color: #000000; font-weight: bold">in</span> square <span style="color: #000000; font-weight: bold">or</span> <span style="color: #000000; font-weight: bold">not</span> is_valid(arr_to_square(square), n):
        <span style="color: #008800; font-weight: bold">if</span> square[current_index] <span style="color: #333333">==</span> <span style="color: #007020">None</span>:
            square[current_index] <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
        square[current_index] <span style="color: #333333">+=</span> <span style="color: #0000DD; font-weight: bold">1</span>
        <span style="color: #008800; font-weight: bold">if</span> square<span style="color: #333333">.</span>count(square[current_index]) <span style="color: #333333">&gt;</span> <span style="color: #0000DD; font-weight: bold">1</span>:
            <span style="color: #008800; font-weight: bold">continue</span>
        <span style="color: #008800; font-weight: bold">if</span> square[current_index] <span style="color: #333333">&gt;=</span> <span style="color: #007020">len</span>(square)<span style="color: #333333">+</span><span style="color: #0000DD; font-weight: bold">1</span>:
            square[current_index] <span style="color: #333333">=</span> <span style="color: #007020">None</span>
            current_index <span style="color: #333333">-=</span> <span style="color: #0000DD; font-weight: bold">1</span>
            <span style="color: #008800; font-weight: bold">continue</span>
        <span style="color: #008800; font-weight: bold">if</span> is_valid(arr_to_square(square), n):
            current_index <span style="color: #333333">+=</span> <span style="color: #0000DD; font-weight: bold">1</span>
    <span style="color: #008800; font-weight: bold">return</span> arr_to_square(square)
</pre></div>
</font>

At long last, we can run the function! It goes through about $5,000$ iterations before returning the square we want, which is about $1,000$ times faster better than the $3,000,000$ iterations when we were just skipping configurations with repeat numbers, and about $80,000$ times faster than $9^9$ iterations needed for pure brute-force. We can even solve for $4 \times 4$ magic squares fairly quickly, in about 4204 seconds. It isn't the absolute most efficient possible, but at least it finishes before the human race does!
