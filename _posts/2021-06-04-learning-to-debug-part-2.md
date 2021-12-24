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


