---
title: "The Ultimate High School Computer Science Sequence: 9 Months In"
author: "Justin Skycak"
reviewers:
  - "Jason Roberts"
tags:
  - Eurisko Program
---

<i>The Eurisko sequence started during the summer of 2019 with an initial cohort of 5 high school students, all aged 15-16 years old and entering their junior year (11th grade). The content of this sequence similar to what would be covered in upper-level undergraduate courses (e.g. data structures/algorithms ranging from linked lists & sorting algorithms to graphs & traversals), and some content may even be beyond (e.g. building a machine learning library in Python from the ground up). The students build everything from scratch: for example, instead of using external libraries like numpy or pandas, the students built their regressors and classifiers on top of matrix and dataframe classes that they wrote themselves.</i>

<hr>

Last June, <a class="body" href="https://eurisko-us.github.io/jason-roberts" target="_blank">Jason Roberts</a>, the founder of <a class="body" href="https://www.mathacademy.us/" target="_blank">Math Academy</a> and one of the original developers at Uber's real-time technology, most widely known for coining the term <a class="body" href="https://www.google.com/search?q=luck+surface+area" target="_blank">"luck surface area"</a>, asked me teach his son Colby some computer science. Colby was just finishing up his sophomore year in <a class="body" href="http://www.theappacademy.us/index.html" target="_blank">App Academy</a>, but Jason felt that the curriculum was not geared towards students who had a strong aptitude in the subject, and that Colby could and should be learning a lot more.

As I've come to expect with Jason, that initial idea grew quickly: he pulled in some of Colby's buddies who had the necessary mathematical background, and we put together a summer computer science group that met Mon / Wed / Fri with ~10 hours of problem sets each week. Long story short (which I'll elaborate on in a later post), the kids made progress faster than either of us could have possibly expected, and now App Academy is funding an official high school class in which a second cohort has joined the ranks.

It's been 9 months since our initial summer crew (<a class="body" href="https://eurisko-us.github.io/colby-roberts" target="_blank">Colby</a>, <a class="body" href="https://eurisko-us.github.io/riley-paddock" target="_blank">Riley</a>, <a class="body" href="https://eurisko-us.github.io/george-meza" target="_blank">George</a>, <a class="body" href="https://eurisko-us.github.io/david-gieselman" target="_blank">David</a>, and <a class="body" href="https://eurisko-us.github.io/elijah-tarr" target="_blank">Elijah</a>) first started meeting, and in those 9 months, the students have gone from initially not knowing how to write helper functions, to building a machine learning library (and numerous other things) from scratch. This post is meant to summarize what we've done so far and what our plans are for the future.

All the relevant problem sets, quizzes/tests, and class recordings are documented in the class pages for <a class="body" href="https://eurisko-us.github.io/computation-and-modeling-2020-summer" target="_blank">Computation & Modeling (Summer 2020)</a> and <a class="body" href="https://eurisko-us.github.io/machine-learning-2020-21" target="_blank">Machine Learning (2020-21)</a>. Throughout this post I've included links to some of the more noteworthy problems that the students have completed, but any non-linked problems can also be found on those class pages. The students also have GitHub repositories which can be found on their Eurisko pages (linked in the very first sentence of this post).

Lastly, before we dive in, here is a bit of important background information:

<ul>
<li>These students are currently high school juniors (16-17 years old).</li>
<li>Whenever I say "implemented" or "built", I mean from scratch. The students aren't allowed to use external libraries. They have to build everything themselves. We've been working primarily in Python (though recently, we've also introduced C++ and Haskell). The students collaborate a lot, but every student writes every problem up on their own. We eat what we kill.</li>
<li>The students are all mathematically advanced and have learned at least through linear algebra and multivariable calculus. Most are in Math Academy, which means that by 11th grade, they've also learned much of differential equations, discrete math, and abstract algebra.</li>
<li>Most of the students had very little programming experience prior to Eurisko. Something as simple as checking if a string was a palindrome was not trivial to them. They didn't know how to write classes and helper functions, how to work with dictionaries, or even how to systematically debug their code. They've come a long way in a short time!</li>
</ul>

<h2>Why We're Doing It</h2>

We want to teach students the art and craft of software development, while simultaneously giving equal weighting to the discipline of formal computer science and leveraging the advanced mathematics that the students have been learning through Math Academy. We also want the course to be very fun.

<ul>
  <li><i>The art and craft of software development.</i> We want the students to be good enough to do an internship at a tech company and be productive (as opposed to burdensome). This means they need to know how to write and debug code given high-level requirements, test their code effectively, and use source control like GitHub.</li>
  <li><i>Leveraging mathematics.</i> We're interested in teaching the students a lof of machine learning because frankly, it's super cool, and it builds on their strengths. We want to pull the powerful and interesting tools of mathematics into practical use-cases in the context of modeling and prediction (as opposed to just building CRUD apps).</li>
   <li><i>Formal computer science.</i> In addition to becoming competent software developers, we wanted to teach the students undergraduate-level computer science (data structures / algorithms, programming languages, etc) so that no matter how competitive or rigorous the undergraduate curriculum they encounter, they'll be overprepared and find it easygoing (as opposed to overwhelming/intimidating).</li>
</ul>

We chose Python as our primary programming language since it's one of the most productive multi-purpose languages, it's a great learning language, and these days it's the lingua franca of machine learning. But we also wanted to expose the students to the basics of multiple programming languages, so we picked C++ and Haskell as two other languages that would stretch the students in other ways. C++ forces them to think in terms of how the machine actually works, whereas Haskell represents a much more abstract idealized conception of computation. C++ and Haskell are also the kinds of languages that the students might run into early in an undergraduate computer science program, and if they're not prepared, they could easily find themselves frustrated and struggling. So we're taking preventative measures.

We're also having the students learn SQL, since it's an example of a different category of language: declarative, as opposed to imperative (Python, C++) or functional (Haskell). It also happens to be incredibly useful. In addition to learning SQL, the students will also build their own SQL parser, which will give them further insight into how programming languages are structured and what goes on behind the scenes when you run a program.

<h2>What We've Done</h2>

Here is a list of the main topics we've covered. We pulled the basics from MIT's <a class="body" href="https://mitpress.mit.edu/books/introduction-computation-and-programming-using-python-second-edition" target="_blank">Introduction to Computation and Programming Using Python</a>, and then added on a bunch of more advanced topics.

<b>Algorithms and Data Structures.</b> The students have implemented linked lists, stacks, queues, sorting algorithms (selection sort, bubble sort, heapsort, mergesort, quicksort) and have used recursion in many different contexts. They've also implemented trees, undirected graphs, directed graphs, and weighted graphs, along with methods for computing depth-first / breadth-first traversals and distance / shortest path between two nodes (i.e. Dijkstra's algorithm). They've also implemented a simple version of backtracking to solve a <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-44-1" target="_blank">magic square</a> and a mini sudoku puzzle. (Elijah wrote about the magic square problem <a class="body" href="https://eurisko-us.github.io/solving-magic-squares-using-backtracking/" target="_blank">here</a>.)

<b>Optimization.</b> The students have implemented Newton's method, gradient descent (both single-variable and multivariable), and grid search. They've also implemented randomized hill climbers in the context of the 8-queens problem.

<b>Probability and Statistics.</b> The students have worked with many different types of distributions and have done some <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-41-1" target="_blank">basic Bayesian inference</a> (for example, if you have a set of numbers randomly selected from below some upper bound, the students can construct a confidence interval for the upper bound). The students also write up their problems in LaTeX (using <a class="body" href="https://www.overleaf.com/" target="_blank">Overleaf</a>).

<b>Matrix, DataFrame, and EulerEstimator.</b> The students have built their own Matrix class from scratch, which includes methods to compute RREF, inverse, determinant, etc. They also built a DataFrame class which they use to manipulate datasets, and they built an EulerEstimator class that they use to simulate systems of differential equations.

<b>Machine Learning.</b> The students have built linear/logistic regressors, a naive Bayes classifier, Gini decision trees, simple random forests, and they have just started building neural networks. These machine learning models all run on top of the Matrix, DataFrame, and Graph classes that the students had previously built. The students have also used these models for some <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-35-2" target="_blank">elementary prediction tasks</a> that have required the use of dummy variables and interaction terms. (George, Colby, and Riley wrote a 3-part series about linear and logistic regression: <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-1-understanding-the-models/" target="_blank">part 1</a>, <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-2-fitting-the-models/" target="_blank">part 2</a>, and <a class="body" href="https://eurisko-us.github.io/linear-and-logistic-regression-part-3-categorical-variables-interaction-terms-and-nonlinear-transformations-of-variables/" target="_blank">part 3</a>.)

<b>Differential Equations.</b> After building an EulerEstimator from scratch, the students used it to simulate several systems of differential equations: a predator-prey model (which David wrote about <a class="body" href="https://eurisko-us.github.io/predator-prey-modeling-with-euler-estimation/" target="_blank">here</a>), the SIR epidemiological model, the <a class="body" href="https://eurisko-us.github.io/files/all_problems_iteration_1.html#Problem-52-2" target="_blank">Hodgkin-Huxley neuron</a> (which won the Nobel Prize in the 1960s), and a network of Hodgkin-Huxley neurons connected together.

<b>Object-Oriented Programming.</b> In addition to implementing numerous classes in the context of algorithms / data structures and machine learning, the students have been implementing the Space Empires board game along with intelligent agents that battle against each other. Space Empires is incredibly rich and complex and will be discussed extensively later in this post.

<b>Programming Languages.</b> The students have recently started learning C++, Haskell, Shell, and SQL. So far, the exercises they've completed have been simple HackerRank-style problems.

<b>Writing.</b> The students each wrote a blog post last semester (the posts are linked in the categories above). I've started submitting them on Hacker News, and Elijah's post made it to the front page last weekend (<a class="body" href="https://news.ycombinator.com/item?id=26126652" target="_blank">link</a>). Everyone else's posts will be submitted in the coming weekends.

<h2>Space Empires</h2>

The Space Empires game is incredibly complicated, which is in part why we chose it as the "big project" for the class. It's provided the students with extensive practice planning, writing, and debugging code that's spread over multiple directories and files. The <a class="body" href="http://www.gmtgames.com/spaceemp/SE-Rules-4B.pdf" target="_blank">rule book</a> is incredibly dense, but here is the gist of how the game works:

<ul>
<li>There are 2 players on a grid. Each player starts with a "home colony" and some initial ships, and their goal is to destroy the opponent's home colony by sending ships to attack it.</li>
<li>Players have a currency called Construction Points (CPs). Players receive CP income from their home colony on each turn, and they can use these CPs to buy more ships or "technology" for future ships. Technology supplements ships' stats -- for example, buying movement technology would allow ships to move more spaces at once, and buying attack or defense technology would increase the attack of defense strength of ships during combat. Players also have to pay maintenance costs on their ships each round (if they don't pay the maintenance cost for a ship, they lose the ship).</li>
<li>After both players move their ships, combat occurs at any grid square that contains ships from both players. Combat proceeds in rounds until only one player's ships remain at that spot.</li>
<li>During each round of combat, a "combat order" is constructed, in which ships are sorted by their attack class. The first ship in the combat order can attack any other ship. A 10-sided die is rolled, and if the attacker's (attack strength + attack technology) minus the defender's (defense strength + defense technology) is less than or equal to the die roll, then a hit is scored. Once a ship sustains a number of hits equal to its hull size, it is destroyed. This procedure is repeated for each ship in the combat order.</li>
<li>At the end of a round of combat, if there are still ships from both teams left over, another round of combat begins. Combat continues until only one team's ships occupy the square.</li>
</ul>

There are many other details. I won't mention them all here, but here are a few examples to get the point across:
<ul>
<li>Players can send colonyships to colonize other planets. Then, players can collect CPs and build ships at those colonies.</li>
<li>The number of ships that a player can build on any given turn is limited by the player's number of shipyards at each colony.</li>
<li>During combat, if two ships have the same tactics level, then the defending ship attacks first. (The defending ship is the ship that was the first to occupy the grid square).</li>
<li>Each round of combat starts with "ship screening", in which a player with more ships is given the opportunity to remove its ships from the combat round (but the number of ships that are left in combat must be at least the number of ships that the opponent has in that square).</li>
</ul>

In our initial approach to implementing the game, we tried to implement the main rules of the game along with a subset of the more interesting details. Along the way, we created a couple simple strategy players to test that our games gave the same results, and it seemed like things were going fine. But once the students built more complex custom strategies and tried to have the custom strategies battle against each other, we ran into tons of edge-cases and details that we hadn't otherwise considered, and everyone's game implementations were giving different results. After several weeks of attempting to reconcile the discrepancies in our games, we decided to peel back to a much simpler version of the game, reconcile any discrepancies on that simple version, and gradually work our way back up to the full implementation, continuing to reconcile discrepancies at each "level" along the way.

<b>Level 1.</b> We started off with the simplest game imaginable: each player has 3 scout units and that's it. There was no economic phase, no CP, no technology. Level 1 consisted of each player moving their 3 units and engaging in combat, and that's it. We created several strategy players, matched them up against each other, and engaged in pair coding sessions until all of the discrepancies in the outcomes were resolved.

<b>Level 2.</b> We extended level 1 by introducing a single economic phase at the very beginning of the game, having players start with 3 shipyards in addition to 3 scouts (these are the normal starting conditions of the game), and allowing players to buy technology and/or more scouts during the single economic phase. This way, players would get some CP income from their home colony and have to make a choice between spending it all on a couple basic scouts, or buying just one scout with upgraded technology. Again, we created several basic strategy players and resolved any discrepancies in the outcomes of matchups.

Level 2 was also where we started competing with custom strategies. It turned out that the best strategy was to buy as many scouts as possible, wait for the opponent to attack, and then send all of one's scouts on a direct path to attack the opponent's home base once the opponent's scouts had all been destroyed. We'll call this the "camper" strategy because its units "camp" at the home colony and wait for the opponent to attack first.

The camper strategy exploited the fact that, when two units of the same tactics level are involved in combat, the defending ship gets to attack first. By waiting for the opponent to travel to the camper's home colony, the camper was able to attack the opponent first. Additionally, because shipyards at a player's home colony can engage in combat, the camper not only attacked first, but also had twice as many ships in the initial combat. These advantages gave the camper a much higher probability of winning the initial combat and destroying the opponent's scouts, which in turn gave the camper a much higher probability of winning the second combat once it sent its scouts to the opponent's home base.

<b>Level 3.</b> We're currently implementing level 3. Level 3 extends level 2 by introducing repeated economic phases. This means that the players get CP income on every turn, and have the opportunity to buy technology and/or more scouts on each turn. The optimal strategy is likely similar to the camper strategy from level 2, but it's not entirely obvious what the best thing to do is while camping, and when the camper should pull the trigger and rush the opponent.

<ul>
  <li>If the opponent is going to attack the camper quickly, then it's in the camper's best interest to ignore technology and just buy as many scouts as possible. That way, it can outnumber the opponent.</li>
  <li>If the opponent is going to wait a while before attacking the camper, then it's in the camper's best interest to first buy technology and then buy scouts only after all technology has been upgraded to the maximum. The reasoning for this strategy depends on a couple nuances: 1) because of maintenance costs, a player cannot maintain infinitely many scouts, and 2) a ship inherits the technology from the player at the time of building. This way, the resulting army of scouts will be both maximally large and equipped with maximum technology.</li>
   <li>If the opponent is going to wait for the camper to attack first, then the camper may be able to exploit the opponent's way of detecting that the camper has attacked. For example, if the opponent attacks right after the camper does, then the camper can just send a single scout over to the opponent (as a sacrifice) and keep the rest of its scouts camped at the home base for the defender-attacks-first advantage. On the other hand, if the opponent refuses to attack until all of the camper's scouts are destroyed, then the camper can repeatedly build an army of scouts and send all but one of them to attack the opponent.</li>
</ul>

We're now at a stage where the optimal strategy is no longer obvious.

<h2>Where We're Headed</h2>

Here are our plans for the rest of the semester:

<ul>
<li><i>Machine Learning</i> - we will continue implementing progressively more complex neural networks, more types of ensemble methods (including gradient boosting), and we will use their models for prediction tasks on larger real-world datasets.</li>

<li><i>Data Structures and Algorithms</i> - we will implement any standard things we haven't done yet (e.g. hash tables and A* search), more heuristic algorithms (e.g. simulated annealing), and genetic algorithms.</li>

<li><i>Programming Languages</i> - we'll do a bit more Haskell, C++, and SQL before hitting the brakes (pursuing them further isn't going to be as valuable to the goals of the class as the space empires, machine learning, and algorithms problems). But we'll also write our own SQL parser within the DataFrame class, to gain further insight into how programming languages are structured and what goes on behind the scenes when you run a program.</li>

<li><i>Space Empires</i> - we will continue building up the game level by level and building custom strategies to compete at each level, eventually incorporating some of the more advanced algorithms and machine learning models that we have built. Once the Space Empires games are fully implemented, we will put them on a server and have the agents communicate with the game using socket connections.</li>

<li><i>Writing</i> - we will write another round of blog posts.</li>
</ul>

The working title for next year's class (12th grade) is "Intelligent Systems." In that class, we will

<ul>
<li>continue broadening our knowledge of machine learning (addressing unsupervised learning and reinforcement learning),</li>
<li>continue re-implementing our models and algorithms in C++ to speed them up,</li>
<li>implement several small-scale games (such as tic-tac-toe, snake, and checkers) and train intelligent agents to play them,</li>
<li>continue improving our intelligent agents in the game of Space Empires, and create an app for playing Space Empires (so that us lowly humans can compete against some AI agents on our phones).</li>
</ul>

<h2>How Well is it Working?</h2>

Again, the kids are making progress faster than either Jason or I could have possibly expected. But they're also having more fun than either Jason or I could have possibly expected, too. Class often runs over time due to interesting discussions surrounding Space Empires, and I have to regularly tell kids to leave class to go to their other classes. The kids are on Slack all the time, and I've heard them mention that "it's the only class that matters." It's their hardest class, by far -- even compared to their Math Academy classes (where they're studying upper-division college math), which is in turn far more advanced than their AP classes. But they're having a blast.






