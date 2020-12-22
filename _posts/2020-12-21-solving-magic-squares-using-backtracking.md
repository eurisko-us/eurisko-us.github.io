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

$$\dfrac{1}{n} \sum_{k=1}^{n^2} k $$

For example, a magic square with dimensions $3 \times 3$ would have magic constant $15,$ and dimensions $4 \times 4$ would have magic constant $34.$

To solve a magic square, we must fill in each element with a number in $\{1, 2, \ldots, n^2 \},$ and each number must appear exactly once. A $3 \times 3$ magic square could look like this:

$$\begin{bmatrix}
2 & 7 & 6 \\
9 & 5 & 1 \\
4 & 3 & 8
\end{bmatrix}$$

Or this:

\\

$$\begin{bmatrix}
8 & 3 & 4 \\
1 & 5 & 9 \\
6 & 7 & 2
\end{bmatrix}$$

It may seem like a $3 \times 3$ magic square can have multiple solutions. But looking closer allows us to see that the two matrices above are actually both the same configuration. The second matrix is just the first matrix rotated $180$ degrees. In general, rotating and flipping a magic square in any direction will still yield a valid magic square.

\section*{Solving a magic square using brute force}

How can we build a program to construct one of these magic squares?

Just like every problem, the simplest way to solve a magic square is to use brute force. It will be the most inefficient solution we can think of, but it will give us some grounding to see which areas we need to improve it in. To get some code down, we can write something like this:

\begin{lstlisting}
def gen_magic_square():
    for x1 in range(1, 10):
        for x2 in range(1, 10):
            for x3 in range(1, 10):
                for x4 in range(1, 10):
                    for x5 in range(1, 10):
                        for x6 in range(1, 10):
                            for x7 in range(1, 10):
                                for x8 in range(1, 10):
                                    for x9 in range(1, 10):
                                        square = [[x1, x2, x3], [
                                            x4, x5, x6], [x7, x8, x9]]
                                        if is_valid(square, 15):
                                            return square
\end{lstlisting}

The classic 9-nested-for-loop approach. It is quite inefficient, but it will do the job. Each $x_k$ variable represents a space in the square. There are 9 spaces, so we nest 9 loops, 1 for each space. Each loop will loop through all the possible numbers in that space, $1$ through $9.$ 

To write the is\_valid function, we need to check for duplicate values, which can easily be done with the use of a set. Then we have to check if each row, column, and diagonal adds up to a certain number, so we can just make a list of all those and check if they are equal to 15 at the end.

\begin{lstlisting}
def is_valid(square, n):
    vals = [entry for row in square for entry in row if entry != None]
    if len(set(vals)) < len(vals): # check for duplicates
        return False
        
    num_rows = len(square)
    arrs = square \ # rows
        + [list(arr) for arr in zip(*square)] \ # columns
        + [square[i][i] for i in range(len(square))] # main diagonal
        + [square[i][num_rows-i-1] for i in range(num_rows)] # anti-diagonal
    return all(sum(arr) == n for arr in arrs if None not in r)
\end{lstlisting}

Because I want this function to be able to run on squares larger than just 3x3, I pass in the constant as $n$. For a 3x3 square, we would set $n=15.$ For a 4x4 square, we would set $n=34.$

\section*{Brute force takes forever!}

Let's talk about timing. We have 9 nested for loops, and the is\_valid operation is in the deepest one. Since each loop is going to run 9 times to test each number 1-9 in each element of the square, it's going to run the is\_valid function $9^9$ times, which is absolutely insane.

Using Python's \emph{timeit} module, we can see how long the is\_valid function takes to run:

\begin{itemize}
    \item 1.6 usec to run if there are duplicate values
    \item 5.3 usec to run if there are no duplicate values
    \item 6.3 usec to run if the square is valid
\end{itemize}

With this brute force algorithm, we can expect that the vast majority of iterations are going to have duplicate values in them. So, I'll be generous and say that each time it runs, 1.6 usecs pass. That means the amount of time it takes is $9^9 \times 1.6 \textrm{ usecs} \sim 10.3 \textrm{ minutes}$.

What if we wanted a 4x4 magic square? Well, we can use the equation again: $16^{16} \times 1.6 \textrm{ usec} \sim \textbf{\emph{600 millennia}}$. It's very unlikely that the human race will even exist for that long; we might have destroyed the earth along with the computer that was running this algorithm by then. We need to write a more efficient algorithm.

\section*{Backtracking}

The problem with brute force is that it spends too much time looking through solutions that will never work. For example, the algorithm starts out with the square

$$
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 1
\end{bmatrix},
$$

and then advances to

$$
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 2
\end{bmatrix},
$$

and then

$$
\begin{bmatrix}
1 & 1 & 1\\
1 & 1 & 1 \\
1 & 1 & 3
\end{bmatrix}.
$$

There's absolutely no point in checking any square with the first 3 numbers as 1 because we're not allowed to have duplicates.

To avoid configurations like $1,1,1$ as the top row, we can use a technique called \textbf{backtracking}. Whenever we reach a configuration that won't work, we "backtrack" and skip over that configuration instead of wasting tons of time modifying it in ways that will never make it valid.

Using backtracking, we would skip over all configurations that have duplicates, and instead start out with

$$
\begin{bmatrix}
1 & 2 & 3\\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}.
$$

To implement backtracking, we'll start by skipping over configurations with duplicates. In each for loop, before entering the next loop, we will check if the number has been duplicated anywhere. We will only check the rest of the square if the number isn’t duplicated. Implementing this, we end up with the following code:

\begin{lstlisting}
def gen_magic_square()
    for x1 in range(1, 10):
        for x2 in range(1, 10):
            if x2 in [x1]:
                continue
            for x3 in range(1, 10):
                if x3 in [x1, x2]:
                    continue
                for x4 in range(1, 10):
                    if x4 in [x1, x2, x3]:
                        continue
                    for x5 in range(1, 10):
                        if x5 in [x1, x2, x3, x4]:
                            continue
                        for x6 in range(1, 10):
                            if x6 in [x1, x2, x3, x4, x5]:
                                continue
                            for x7 in range(1, 10):
                                if x7 in [x1, x2, x3, x4, x5, x6]:
                                    continue
                                for x8 in range(1, 10):
                                    if x8 in [x1, x2, x3, x4, x5, x6, x7]:
                                        continue
                                    for x9 in range(1, 10):
                                        if x9 in [x1, x2, x3, x4, x5, x6, x7, x8]:
                                            continue
                                        square = [[x1, x2, x3], [
                                            x4, x5, x6], [x7, x8, x9]]
                                        if is_valid(square, 15):
                                            return square
\end{lstlisting}

Once we run this code, we notice a massive improvement in performance! Within only a couple of seconds, our algorithm actually finds multiple squares.

With this new algorithm, we skip all squares which repeat numbers, which will always be invalid. So, we are looping through all permutations. We can expect to run the validation function about $P(10, 9) = 3628800$ times, which is much less than the $9^9$ times we had to check last time.

Now, this method speeds up our code, but by how much? Theoretically, it takes $P(10, 9) * 1.6 \text{usecs} \sim 5.8 \text{secs}$ to just run all the validations. (We introduced a bunch of 'if' statements in between each of the for loops, so it will take a bit longer in reality.) But the point is, our new algorithm works $10600\%$ faster than the old one!

\section*{Using a While Loop}

Still, we have another problem left, and that is the quality of the code. No one wants to have to look at a cascading abyss of for loops and if statements while writing their code, so let's see if we can combine all this into 1 while loop.

If you think about it, we can treat the square as a list of numbers instead of a list of rows. Instead of [[1, 2, 3], [4, 5, 6], [7, 8, 9]], we can store the array as [1, 2, 3, 4, 5, 6, 7, 8, 9]. Now, that means we will need a function to convert the flat list into a square:

\begin{lstlisting}
def arr_to_square(arr):
    side_length = int(len(arr) ** 0.5)
    return [arr[i:i+side_length] for i in range(0, len(arr), side_length)]
\end{lstlisting}

Now, let's think of how we can structure the while loop. We want the loop to keep going until both the value None is nowhere to be found in the list, and the square is valid. We can use the 'or' operator to run the loop if None is in the square, or the square isn't valid, like this:

\begin{lstlisting}
def gen_magic_square(size):
    n = get_magic_const(size)
    square = [None for i in range(size**2)]
    
    while None in square or not is_valid(arr_to_square(square), n):
        pass
    return arr_to_square(square)
\end{lstlisting}

You'll notice I use the function 'get\_magic\_const', which computes the magic constant, like this:

\begin{lstlisting}
def get_magic_const(side_length):
    return side_length*(side_length**2+1)/2
\end{lstlisting}

We will need a variable to store the index of the element we want to modify. So, let's set \emph{index} to 0 at the beginning. Now, we want to add 1 to the value at \emph{index} so we can keep searching through for the correct square. We start out with 9 None values in the list, so if the value is None, we should just set it to 1 instead of adding 1. However, setting the value to 0 if None before adding 1 will save us an extra line of code.

\begin{lstlisting}
current_index = 0
while None in square or not is_valid(arr_to_square(square), n):
    if square[current_index] == None:
        square[current_index] = 0
    square[current_index] += 1
    # ...
\end{lstlisting}

Next, we want to check if the index has any duplicates in the list. If it does, we should keep incrementing the current element, and we can do that by just continuing to the next iteration.

\begin{lstlisting}
if square.count(square[current_index]) > 1:
    continue
\end{lstlisting}

Another constraint we have is how large the element can be. Each magic square has to have 1 of each number from 1 to its length, so we check if the current element is within that range. If it is out of that range, we know we can't increase the number any further, because that will also be out of range, and we also know we can't go to the next index, because we still will have an out-of-range number. This is a good opportunity for backtracking, so we can just set the current element back to None and subtract 1 from the index, like this:

\begin{lstlisting}
if square[current_index] >= len(square)+1:
    square[current_index] = None
    current_index -= 1
    continue
\end{lstlisting}

Lastly, if the square does actually turn out to be valid, we should add 1 to the index.

\begin{lstlisting}
if is_valid(arr_to_square(square), n):
    current_index += 1
\end{lstlisting}

Now, we can combine all these sections of code into 1 grand function, like so:

\begin{lstlisting}
def gen_magic_square(size):
    n = get_magic_const(size)
    square = [None for i in range(size**2)]
    current_index = 0
    while None in square or not is_valid(arr_to_square(square), n):
        if square[current_index] == None:
            square[current_index] = 0
        square[current_index] += 1
        if square.count(square[current_index]) > 1:
            continue
        if square[current_index] >= len(square)+1:
            square[current_index] = None
            current_index -= 1
            continue
        if is_valid(arr_to_square(square), n):
            current_index += 1
    return arr_to_square(square)
\end{lstlisting}

At long last, we can run the function! It goes through about 5000 iterations before returning the square we want, which is about 1,000 times faster better than the 3,000,000 iterations when we were just skipping configurations with repeat numbers, and about 80,000 times faster than $9^9$ iterations needed for pure brute-force. We can even solve for $4 \times 4$ magic squares fairly quickly, in about 20 seconds. It isn't the absolute most efficient possible, but at least it finishes before the human race does!
