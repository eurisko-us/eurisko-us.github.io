---
title: "Learning to Debug"
author: "William Wallius"
reviewers:
  - "Maia Dimas"
tags:
  - Debugging
---

At the beginning of the year, I knew nothing about Python. I learned different methods and syntaxes, but I had no idea what it meant, and if something went wrong, I was practically hopeless. My main source for help would be asking friends - which is a very good resource - though I grew reliant upon them, instead of using them as a tool for help. Looking back now, I realize that understanding what you're coding - not just how Python works - but also the problem you are trying to solve, is very important. If you don't know how the code is supposed to work, you can't debug the issues.

<h2>Write Clear, Concise Code</h2>

When I look back at old problem files, it can be hard to understand my thought process in the code, even though it works. When coding, it is extremely important that the code makes sense and is readable, not just for you but also for others to understand. This is crucial when debugging, so that you can easily find and discrepancies in your logic, especially if your code is not returning errors. A core part of having clear code is a systematic variable naming convention. If you are debugging by printing your variables, having good names makes it easy to know what they should be equal to, so you can clearly pick out anything wrong. 

An example of unclear coding is as follows:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">funct</span>(var, var2):
    number <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">0</span>
    number <span style="color: #333333">+=</span> var
    number <span style="color: #333333">=</span> numbers <span style="color: #333333">+</span> var2
    <span style="color: #008800; font-weight: bold">return</span> number
</pre></div>
</font>
<br>

Though this code would run and return the sum of the two inputs, it can be hard to tell exactly what it's doing. There are multiple ways that this code could be cleaned up:

<ul>
  <li>On line 1, the two input variables (<code>var</code>, <code>var2</code>) could be defined as <code>num_1</code> and <code>num_2</code> (or similar), to show that these are numbers.</li>
  <li>Function naming is also very important. The name of the function can tell you what it does very easily without even having to look at the code. In this example, <code>funct</code> explains nothing about the function itself. Instead, <code>calc_sum</code> would be a better name for the function, as it is clear that you are taking the sum of the two inputs.</li>
  <li>In the function's body, there are multiple confusions and inconsistencies. The method used to calculate the sum is fine: initialize a variable, add each input, return the variable. However, the execution can be confusing. Initializing the variable as 0 in line 2 is fine, but unnecessary. Lines 3 and 4 use two different methods of variable addition and reassignment, which can be confusing to switch between (line 3's method is typically better, as it is more concise). These lines could also be condensed into a single line.</li>
  <li>One issue in the code is knowing if you need a variable at all. In this case, <code>number</li> could be done without, since you can just return the sum without assigning it to an intermediate the variable.</li>
</ul>

Using the changes listed above, here is a better version of the code:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">calc_sum</span>(num_1, num_2):
    <span style="color: #008800; font-weight: bold">return</span> num_1 <span style="color: #333333">+</span> num_2
</pre></div>
</font>
<br>

It's much easier to read, and consequently, much easier to debug.
