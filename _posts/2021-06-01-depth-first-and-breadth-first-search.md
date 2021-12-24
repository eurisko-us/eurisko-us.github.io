---
title: "Depth-First and Breadth-First Search"
author: "Cayden Lau"
reviewers:
  - "Justin Hong"
tags:
  - Algorithms
---

To understand what depth-first and breadth-first search are, we must first know what graphs and directed graphs are. A <b>graph</b> is a set of objects (often called nodes) that are connected to each other. A pair of nodes is called an <b>edge</b>, and edges make up the "structure" of a graph. Put simply, a graph is a set of nodes and edges. A <b>directed graph</b> is a special instance of a graph. The difference is that in a regular (undirected) graph, the edges are bidirectional, meaning that they don't have a specific direction. However, in a directed graph, each edge has a specified direction. 

Graphs and directed graphs can be used to model many real-life phenomena. For example, a graph can model a social network since communication between social accounts goes both ways. On the other hand, a directed graph can model cities connected by railroad tracks since each railroad track has a specific direction.

<h2>Examples of Graphs</h2>

The following picture is an example of an undirected graph:

<center><img src="https://eurisko-us.github.io/images/blog/depth-first-and-breadth-first-search-1-undirected-graph.png" style="border: none; height: 20em;" alt="icon"></center>
<br>

Here, the labeled circles represent nodes and the lines between the nodes represent undirected edges. 

In the context of a social network, think of node 1 as yourself. The nodes 2, 7, and 8 would be your friends. The nodes 3 and 6 would be the friends of 2 and the nodes 9 and 12 would be the friends of 8. Since no other nodes are connected to 7, you are node 7's only friend. By the same logic, nodes 4 and 5 are friends of 3 while nodes 9 and 12 are friends of 8.

The following picture is an example of a directed graph:

<center><img src="https://eurisko-us.github.io/images/blog/depth-first-and-breadth-first-search-2-directed-graph.png" style="border: none; height: 20em;" alt="icon"></center>
<br>

Again, the nodes are labeled circles and the edges are the lines between the nodes. However, notice that these edges have an arrow designating the direction.

In the context of cities connected by railroad tracks, node A would be your home city. The directed edge $A \to B$ represents a railroad that goes from city A to city B (but does not go back to city A). From city A, we can only go to city B. From city B, we can only go to city C (since the edge connecting B and D is $D \to B$, not $B \to D$). City C can only go to city E. When we get to city E, we can either go to city D (which in turn will allow us to loop back to city A city B) or city F (from which we can go to city D).

<h2>Depth-First and Breadth-First Search</h2>

Now that we know what graphs and directed graphs are, we can introduce depth-first and breadth-first search. As implied by the name, these methods traverse the graph by prioritizing either depth or breadth.

<b>Depth-first search</b> prioritizes depth. Starting at some node in the graph, we travel along one of the edges that connects to this node. This edge takes us to a new node, and we repeat the process, traveling along one of the edges that connects to the new node. This takes us deeper and deeper into the graph. Once we reach a node for which there are no more edges that we can travel along, we backtrack and go back up the graph until there is a path that we haven't taken already. We then go deep down the path as far as possible, and then repeat the process until we've visited each and every node in the graph.

<b>Breadth-first search</b> prioritizes breadth. Instead of repeatedly traveling deep into the graph, breadth-first search has us traveling through each "layer" of the graph. If we think about a family tree diagram as an example, a "layer" would be a single generation of people. In the case of a graph, a "layer" would be a single generation of nodes, so to speak. In this context, breadth-first searching can be interpreted as traversing by "generation", whereas depth-first searching can be interpreted as traversing by direct "branches" of the family tree.





