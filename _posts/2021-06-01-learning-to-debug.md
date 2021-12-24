---
title: "Learning to Debug"
author: "William Wallius"
reviewers:
  - "Maia Dimas"
tags:
  - Debugging
---

<i>Note to reader: this post was written before students had access to VS Code and its associated debugging capabilities. Consequently, some valuable debugging tools like breakpoints are not covered in the post.</i>

At the beginning of the year, I knew nothing about Python. I learned different methods and syntaxes, but I had no idea what it meant, and if something went wrong, I was practically hopeless. My main source for help would be asking friends - which is a very good resource - though I grew reliant upon them, instead of using them as a tool for help. Looking back now, I realize that understanding what you're coding - not just how Python works - but also the problem you are trying to solve, is very important. If you don't know how the code is supposed to work, you can't debug the issues.

<h2>Write Clear, Concise Code</h2>

When I look back at old problem files, it can be hard to understand my thought process in the code, even though it works. When coding, it is extremely important that the code makes sense and is readable, not just for you but also for others to understand. This is crucial when debugging, so that you can easily find and discrepancies in your logic, especially if your code is not returning errors. A core part of having clear code is a systematic variable naming convention. If you are debugging by printing your variables, having good names makes it easy to know what they should be equal to, so you can clearly pick out anything wrong. 

An example of unclear coding is as follows:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">funct</span>(var, var2):
    number <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
    number <span style="color: #333333">+=</span> var
    number <span style="color: #333333">=</span> number <span style="color: #333333">+</span> var2
    <span style="color: #008800; font-weight: bold">return</span> number
</pre></div>
</font>
<br>

Though this code would run and return the sum of the two inputs, it can be hard to tell exactly what it's doing. There are multiple ways that this code could be cleaned up:

<ul>
  <li>On line 1, the two input variables (<code>var</code>, <code>var2</code>) could be defined as <code>num_1</code> and <code>num_2</code> (or similar), to show that these are numbers.</li>
  <li>Function naming is also very important. The name of the function can tell you what it does very easily without even having to look at the code. In this example, <code>funct</code> explains nothing about the function itself. Instead, <code>calc_sum</code> would be a better name for the function, as it is clear that you are taking the sum of the two inputs.</li>
  <li>In the function's body, there are multiple confusions and inconsistencies. The method used to calculate the sum is fine: initialize a variable, add each input, return the variable. However, the execution can be confusing. Initializing the variable as 0 in line 2 is fine, but unnecessary. Lines 3 and 4 use two different methods of variable addition and reassignment, which can be confusing to switch between (line 3's method is typically better, as it is more concise). These lines could also be condensed into a single line.</li>
  <li>One issue in the code is knowing if you need a variable at all. In this case, <code>number</code> could be done without, since you can just return the sum without assigning it to an intermediate the variable.</li>
</ul>

Using the changes listed above, here is a better version of the code:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">calc_sum</span>(num_1, num_2):
    <span style="color: #008800; font-weight: bold">return</span> num_1 <span style="color: #333333">+</span> num_2
</pre></div>
</font>
<br>

It's much easier to read, and consequently, much easier to debug.

<h2>Don't Do Too Much on Any Single Line</h2>

There are often many different solutions to the same problem. Concise solutions are generally better, but not if they make the code messy. For example, list and dictionary comprehensions eliminate the need for a multi-line "for" loop but can become cluttered very easily. Comprehensions can be especially complex when they are nested, where multiple lists/dictionaries are being created within one big one. This can make the code very confusing to understand, especially if the reader has no context of the problem.

An example of condensed code becoming confusing is as follows: 

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">get_mod_binary</span>(n, low_range, high_range):
    <span style="color: #008800; font-weight: bold">return</span> [convert_to_binary(num<span style="color: #333333">%</span>n) <span style="color: #008800; font-weight: bold">for</span> num <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(low_range, high_range) <span style="color: #008800; font-weight: bold">if</span> num<span style="color: #333333">%</span>n<span style="color: #333333">==</span><span style="color: #0000DD; font-weight: bold">0</span>]
        
<span style="color: #008800; font-weight: bold">print</span>(get_mod_binary(<span style="color: #0000DD; font-weight: bold">5</span>, <span style="color: #0000DD; font-weight: bold">1</span>, <span style="color: #0000DD; font-weight: bold">50</span>))
<span style="color: #888888">#[11001, 110010, 1001011, 1100100, 1111101, 10010110, 10101111, 11001000, 11100001]</span>
</pre></div>
</font>
<br>

The above function's purpose is to take in a number and a range, find all numbers divisible by $n$ in the provided range, and convert the product of $n$ and the divisible numbers to a binary number. The function is confusing to read visually, but to help with the readability, we can break up the list comprehension to show the flow of the problem more clearly:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">get_mod_binary</span>(n, low_range, high_range):
    binary_list <span style="color: #333333">=</span> []
    <span style="color: #008800; font-weight: bold">for</span> num <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(low_range, high_range):
        <span style="color: #008800; font-weight: bold">if</span> num<span style="color: #333333">%</span>n<span style="color: #333333">==</span><span style="color: #0000DD; font-weight: bold">0</span>:
            product <span style="color: #333333">=</span> num<span style="color: #333333">*</span>n
            binary_list<span style="color: #333333">.</span>append(convert_to_binary(product))
    <span style="color: #008800; font-weight: bold">return</span> binary_list
</pre></div>
</font>
<br>

Though the function has more lines, anyone reading your code can understand it better. Another upside to not having overly-condensed code is the ease of the debugging process: it's much easier to print intermediate steps in spaced-out code than in a compact list comprehension.

<h2>Use the Right Data Structure</h2>

Choosing the right structure to store and manipulate your data is very important. Not having the right data structure can make your code very confusing and difficult to work with. 

One example of this is in my SQL parser in my custom DataFrame class. Originally, I stored each word as an item in a list, but this made it very difficult to work with, as it was hard to differentiate between the operations and the inputs to the operations. To solve this issue, I stored the data within a dictionary. This way, I could have the key be the operation and the value be the input to the operation. This allowed me to be able to carry out those operations easier than before, as I changed the data structure.
