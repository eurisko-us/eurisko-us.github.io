---
title: "Learning to Debug, Part 2"
author: "Maia Dimas"
reviewers:
  - "William Wallius"
tags:
  - Debugging
---

<i>Note to reader: this post was written before students had access to VS Code and its associated debugging capabilities. Consequently, some valuable debugging tools like breakpoints are not covered in the post.</i>

Debugging can seem like a difficult challenge, but once you understand how to see what's under the hood, it becomes much simpler. Many of your problems may not actually be problems at all, but simple placement or division errors. Hopefully these 5 tips will help solve all your problems -- they have for me!

<h2>Tip 1: Look at the Error</h2>

If something is wrong, the error will give you the line, file, and sometimes even tell you how it went wrong. This is the most helpful for silly errors as the console will tell you if something is not defined, the wrong type, dividing by 0, etc. Once you know the error, it'll either be an easy fix or a big problem.

For definition/attribute errors, check the variable names and look around where they are defined. You might have misspelled the name by accident or defined the variable after you called it or the function it's in. Other than that, check the lines around the error and make sure your parentheses, brackets, curly brackets, quotes, and apostrophes are closed.

<h3>Example 1.1: Misspelled, Missing and Misplaced Items</h3>

Consider the code below. This is the proper version that will output 6 with no errors.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">[<span style="color: #0000DD; font-weight: bold">1</span>] one <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">1</span>
[<span style="color: #0000DD; font-weight: bold">2</span>] five <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">5</span>
[<span style="color: #0000DD; font-weight: bold">3</span>] <span style="color: #007020">sum</span> <span style="color: #333333">=</span> one <span style="color: #333333">+</span> five
</pre></div>
</font>
<br>

Now, consider the following three snippets. The first snippet has a misspelling.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">[<span style="color: #0000DD; font-weight: bold">1</span>] one <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">1</span>
[<span style="color: #0000DD; font-weight: bold">2</span>] fove <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">5</span>
[<span style="color: #0000DD; font-weight: bold">3</span>] <span style="color: #007020">sum</span> <span style="color: #333333">=</span> one <span style="color: #333333">+</span> five
</pre></div>
</font>
<br>

The second snippet has a missing item.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">[<span style="color: #0000DD; font-weight: bold">1</span>] one <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">1</span>
[<span style="color: #0000DD; font-weight: bold">2</span>] 
[<span style="color: #0000DD; font-weight: bold">3</span>] <span style="color: #007020">sum</span> <span style="color: #333333">=</span> one <span style="color: #333333">+</span> five
</pre></div>
</font>
<br>

The third snippet has a misplaced item.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">[<span style="color: #0000DD; font-weight: bold">1</span>] one <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">1</span>
[<span style="color: #0000DD; font-weight: bold">2</span>] 
[<span style="color: #0000DD; font-weight: bold">3</span>] <span style="color: #007020">sum</span> <span style="color: #333333">=</span> one <span style="color: #333333">+</span> five
[<span style="color: #0000DD; font-weight: bold">4</span>] five <span style="color: #333333">=</span> <span style="color: #0000DD; font-weight: bold">5</span>
</pre></div>
</font>
<br>

All of these have the same error code:

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%">File <span style="background-color: #fff0f0">&quot;file_name.py&quot;</span>, line <span style="color: #0000DD; font-weight: bold">3</span>, <span style="color: #000000; font-weight: bold">in</span> <span style="color: #333333">&lt;</span>module<span style="color: #333333">&gt;</span>
<span style="color: #007020">sum</span> <span style="color: #333333">=</span> one <span style="color: #333333">+</span> five
<span style="color: #FF0000; font-weight: bold">NameError</span>: name <span style="background-color: #fff0f0">&#39;five&#39;</span> <span style="color: #000000; font-weight: bold">is</span> <span style="color: #000000; font-weight: bold">not</span> defined
</pre></div>
</font>
<br>

Anything having to do with a name will be a Name Error. Attribute errors (these have to do with classes) also have the above causes.  

<h3>Example 1.2: Wrong Types</h3>

Type errors are very simple: they occur when you try to put two things together that don't go together. The two kinds I see most often are as follows.

<ul>
  <li>Any code of the form <code>'string' + number</code> will have an error code <code>TypeError: can only concatenate str (not "int") to str</code>. With strings, the $+$ will put two strings together. But if the second variable is an integer and not a string, the console will print that it cannot concatenate str with integers. If it was a different kind of variable, the console would say what the variable type is in the quotation marks.</li>
  <li>Any code of the form <code>None + number</code> will have an error code <code>TypeError: unsupported operand type(s) for +: 'NoneType' and 'int'</code>. This is saying that there is no way for these two types to combine using the $+$ sign, and then displaying the two types you are trying to use. The types will come up in order of which came first in the code. For these two errors, you just have to find a way so that this doesn't happen. Maybe making an if statement or changing the type first.</li>
</ul>

<h3>Example 1.3: Zero Division</h3>

This is really self explanatory. Anytime you wind up dividing by zero, the console will spit out <code>ZeroDivisionError: division by zero</code>.

<h3>Example 1.4: Syntax Error</h3>

Syntax Errors are your missing ending or starting quotations, parenthesis, brackets, curly brackets, etc, or just when something is typed wrong and is making the computer confused on what you're trying to tell it to do. The error code usually says where the syntax is going wrong, so you can just head to that area and fix the syntax. If you don't understand the error code, go to tip 4.

<h2>Tip 2: Look Under the Hood</h2>

There are times where no error is thrown, but you still aren't getting the right output from your code. During times like this it is best to print out your variables. Printing out your variables can also help show if you are in an infinite while loop, as those will just go forever.

In general, I start by following the returned variable (abbreviated RV) from its initialization to its return to see exactly what happens to it. If the RV is based off of one or more intermediate variables, check first to see if the RV was ever correct in the first place. If not, just keep on backtracking until you get to a variable that IS computed correctly.

Tip 3 might be helpful here depending on how long your code is. Closely monitor and double check every way that variable is changed until the RV is finally correct. Now to double check that everything is working properly, try to run your function with a different set of data. You should know what the correct answer should be and the steps between before you try.

<h3>Example 2.1: Infinite While Loops</h3>

A "while loop" is a kind of loop that will keep on restarting as long as its condition is true. Infinite while loops are created when the condition is never false (when it hits the end of each run through), if there is no "break" command, or if the "break" command is never triggered.

You can check if your loop is infinite by printing out the values of any variables involved in the condition. If things start going too fast for you to read, you can import the <code>time</code> library and use <code>time.sleep(number of seconds)</code> to make the code pause before continuing. 

If the condition variables go past the stopping condition, check what values they take at the end of the looped code. You may need to make it a break condition instead (just the "break" command inside an if statement). If the condition variable is cycling, check what it is each time you change it. You may have a logical problem in your code. 

<h2>Tip 3: Separate into Chunks</h2>

As your coding gets more advanced, the code you write generally gets longer. Longer code is more difficult to debug, so if there is any code that you don't actually need, delete it. This reduces how much code you have to look through when something goes wrong. Of course, don't simplify to the point that you can't read your code, but try to remove as many unnecessary things as possible.

Second, generalize and create helper functions and child classes when possible. In general, try to break up your code so that in the long run there is less code to go through each time something breaks.

<ul>
  <li><i>Helper functions</i> are functions that carry out sub-tasks involved in your main function. I personally like to create helper functions for things that will be run over and over or things that are long and complex. For example, in almost all of my various graph classes, <code>set_breadth_first_distance and_previous</code> is a long, semi-complex bit of code that is run multiple times and is just part of what the main function accomplishes. We call this in <code>calc_distance</code> and <code>calc_shortest_path</code>.</li>
  <li>A <i>child class</i> gains access to all of the parent class's methods. This means that you can state one or more core methods inside of one class and then create child classes off of it. Each child class now has access to these core methods without having to restate them. Here is how you state a child class: <code>class ChildClassName (ParentClassName): ...</code></li>
</ul>












