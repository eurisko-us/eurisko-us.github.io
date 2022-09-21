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

<center><img src="https://eurisko.us/images/blog/depth-first-and-breadth-first-search-1-undirected-graph.png" style="border: none; height: 20em;" alt="icon"></center>
<br>

Here, the labeled circles represent nodes and the lines between the nodes represent undirected edges. 

In the context of a social network, think of node 1 as yourself. The nodes 2, 7, and 8 would be your friends. The nodes 3 and 6 would be the friends of 2 and the nodes 9 and 12 would be the friends of 8. Since no other nodes are connected to 7, you are node 7's only friend. By the same logic, nodes 4 and 5 are friends of 3 while nodes 9 and 12 are friends of 8.

The following picture is an example of a directed graph:

<center><img src="https://eurisko.us/images/blog/depth-first-and-breadth-first-search-2-directed-graph.png" style="border: none; height: 20em;" alt="icon"></center>
<br>

Again, the nodes are labeled circles and the edges are the lines between the nodes. However, notice that these edges have an arrow designating the direction.

In the context of cities connected by railroad tracks, node A would be your home city. The directed edge $A \to B$ represents a railroad that goes from city A to city B (but does not go back to city A). From city A, we can only go to city B. From city B, we can only go to city C (since the edge connecting B and D is $D \to B$, not $B \to D$). City C can only go to city E. When we get to city E, we can either go to city D (which in turn will allow us to loop back to city A city B) or city F (from which we can go to city D).

<h2>Depth-First and Breadth-First Search</h2>

Now that we know what graphs and directed graphs are, we can introduce depth-first and breadth-first search. As implied by the name, these methods traverse the graph by prioritizing either depth or breadth.

<b>Depth-first search</b> prioritizes depth. Starting at some node in the graph, we travel along one of the edges that connects to this node. This edge takes us to a new node, and we repeat the process, traveling along one of the edges that connects to the new node. This takes us deeper and deeper into the graph. Once we reach a node for which there are no more edges that we can travel along, we backtrack and go back up the graph until there is a path that we haven't taken already. We then go deep down the path as far as possible, and then repeat the process until we've visited each and every node in the graph.

<b>Breadth-first search</b> prioritizes breadth. Instead of repeatedly traveling deep into the graph, breadth-first search has us traveling through each "layer" of the graph. If we think about a family tree diagram as an example, a "layer" would be a single generation of people. In the case of a graph, a "layer" would be a single generation of nodes, so to speak. In this context, breadth-first searching can be interpreted as traversing by "generation", whereas depth-first searching can be interpreted as traversing by direct "branches" of the family tree.

<h2>Implementing a Graph Class</h2>

A graph class is a collection of nodes along with methods for operating on the nodes. Each node has an index and a list of "neighbors" (or "parents", in the case of a directed graph).

To initialize a graph, we can pass in a list of edges, where each edge is a tuple of node indices. From the edges list, we can determine all the possible indices of nodes, and then create a node that corresponds to each of those indices.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">class</span> <span style="color: #BB0066; font-weight: bold">Graph</span>:
    <span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">__init__</span>(<span style="color: #007020">self</span>, edges):
        <span style="color: #007020">self</span><span style="color: #333333">.</span>edges <span style="color: #333333">=</span> edges
        indices <span style="color: #333333">=</span> []

        <span style="color: #008800; font-weight: bold">for</span> edge <span style="color: #000000; font-weight: bold">in</span> edges:
            indices<span style="color: #333333">.</span>append(edge[<span style="color: #0000DD; font-weight: bold">0</span>])
            indices<span style="color: #333333">.</span>append(edge[<span style="color: #0000DD; font-weight: bold">1</span>])

        <span style="color: #007020">self</span><span style="color: #333333">.</span>nodes <span style="color: #333333">=</span> [Node(n) <span style="color: #008800; font-weight: bold">for</span> n <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">range</span>(<span style="color: #007020">max</span>(indices) <span style="color: #333333">+</span> <span style="color: #0000DD; font-weight: bold">1</span>)]
</pre></div>
</font>
<br>

Now that we have initialized our graph, we are now able to build it. Building a graph involves setting the neighbors of each node.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">build_from_edges</span>(<span style="color: #007020">self</span>):
    <span style="color: #008800; font-weight: bold">for</span> edge <span style="color: #000000; font-weight: bold">in</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>edges:
    	i <span style="color: #333333">=</span> edge[<span style="color: #0000DD; font-weight: bold">0</span>]
    	j <span style="color: #333333">=</span> edge[<span style="color: #0000DD; font-weight: bold">1</span>]
        <span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[i]<span style="color: #333333">.</span>neighbors<span style="color: #333333">.</span>append(<span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[j])
        <span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[j]<span style="color: #333333">.</span>neighbors<span style="color: #333333">.</span>append(<span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[i])
</pre></div>
</font>
<br>

<h2>Implementing Depth-First and Breadth-First Search</h2>

To implement a breadth-first search, we use a queue, a data structure that has elements inserted and removed according to the first-in first-out principle. Every time we visit a node, we want to add it to our queue if we haven't visited it already. Our queue keeps track of which nodes we still need to "deal with", so to speak. When we "deal with" a node, we add the node to our output array, add the node's unvisited neighbors to the queue, and then finally remove the node from the queue. We continue doing this until there are no more nodes left in the queue.

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">fetch_nodes_breadth_first</span>(<span style="color: #007020">self</span>, root_index):
    root_node <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[root_index]
    queue <span style="color: #333333">=</span> []
    queue<span style="color: #333333">.</span>append(root_node)

    visited <span style="color: #333333">=</span> {}
    visited[root_node<span style="color: #333333">.</span>index] <span style="color: #333333">=</span> <span style="color: #007020">True</span>

    result <span style="color: #333333">=</span> []
    result<span style="color: #333333">.</span>append(root_node)

    <span style="color: #008800; font-weight: bold">while</span> <span style="color: #007020">len</span>(queue) <span style="color: #333333">&gt;</span> <span style="color: #0000DD; font-weight: bold">0</span>:
    	node <span style="color: #333333">=</span> queue[<span style="color: #0000DD; font-weight: bold">0</span>]

        <span style="color: #008800; font-weight: bold">for</span> neighbor <span style="color: #000000; font-weight: bold">in</span> node<span style="color: #333333">.</span>neighbors:
            <span style="color: #008800; font-weight: bold">if</span> neighbor<span style="color: #333333">.</span>index <span style="color: #000000; font-weight: bold">not</span> <span style="color: #000000; font-weight: bold">in</span> visited:
                queue<span style="color: #333333">.</span>append(neighbor)
                result<span style="color: #333333">.</span>append(neighbor)
                visited[neighbor<span style="color: #333333">.</span>index] <span style="color: #333333">=</span> <span style="color: #007020">True</span>

        queue <span style="color: #333333">=</span> queue[<span style="color: #0000DD; font-weight: bold">1</span>:]

    <span style="color: #008800; font-weight: bold">return</span> result
</pre></div>
</font>
<br>

Depth-first search is similar to breadth-first search. The only difference is that instead of a queue, we use a stack, a data structure that has elements inserted and removed according to the first-in last-out principle. 

<font size="3em">
<!-- HTML generated using hilite.me --><div style="background: #ffffff; overflow:auto;width:auto;border:solid gray;border-width:.1em .1em .1em .8em;padding:.2em .6em;"><pre style="margin: 0; line-height: 125%"><span style="color: #008800; font-weight: bold">def</span> <span style="color: #0066BB; font-weight: bold">fetch_nodes_depth_first</span>(<span style="color: #007020">self</span>, root_index):
    root_node <span style="color: #333333">=</span> <span style="color: #007020">self</span><span style="color: #333333">.</span>nodes[root_index]
    stack <span style="color: #333333">=</span> []
    stack<span style="color: #333333">.</span>append(root_node)

    visited <span style="color: #333333">=</span> {}
    visited[root_node<span style="color: #333333">.</span>index] <span style="color: #333333">=</span> <span style="color: #007020">True</span>

    result <span style="color: #333333">=</span> []
    result<span style="color: #333333">.</span>append(root_node)

    <span style="color: #008800; font-weight: bold">while</span> <span style="color: #007020">len</span>(queue) <span style="color: #333333">&gt;</span> <span style="color: #0000DD; font-weight: bold">0</span>:
    	node <span style="color: #333333">=</span> stack[<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span>]

        <span style="color: #008800; font-weight: bold">for</span> neighbor <span style="color: #000000; font-weight: bold">in</span> node<span style="color: #333333">.</span>neighbors:
            <span style="color: #008800; font-weight: bold">if</span> neighbor<span style="color: #333333">.</span>index <span style="color: #000000; font-weight: bold">not</span> <span style="color: #000000; font-weight: bold">in</span> visited:
                stack<span style="color: #333333">.</span>append(neighbor)
                result<span style="color: #333333">.</span>append(neighbor)
                visited[neighbor<span style="color: #333333">.</span>index] <span style="color: #333333">=</span> <span style="color: #007020">True</span>

        stack <span style="color: #333333">=</span> stack[:<span style="color: #333333">-</span><span style="color: #0000DD; font-weight: bold">1</span>]

    <span style="color: #008800; font-weight: bold">return</span> result
</pre></div>
</font>
<br>

Keep in mind that there can be different outputs for each of the search methods. In the case of breadth first search, you can switch up the order of elements on the same layer. In the case of depth first search, you can choose different paths to start going down.
