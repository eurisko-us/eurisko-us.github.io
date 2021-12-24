---
title: "Simulating a Biological Neuron Using the Hodgkin-Huxley Model"
author: "Justin Hong"
reviewers:
  - "Cayden Lau"
tags:
  - Algorithms
  - Modeling
---

To understand the Hodgkin-Huxley model, we must first understand what a neuron is. A neuron is a type of cell that is most prominently found in nerves and the brain, and neurons the primary building blocks of the nervous system. Neurons are connected by synapses, which allow signals to be sent and received rapidly and precisely.

There are three major types of neurons:
<ul>
  <li>Sensory neurons make sense of the outside world (e.g. touch, pain, vision, hearing, and taste) by sending signals from sensory organs to the brain.</li>
  <li>Inter-neurons make up most of the neurons in our bodies and brain, and allow us to to think, see, and perceive things.</li>
  <li>Motor neurons are in charge of contracting muscles so we can move.</li>
</ul>

The most basic structure of a neuron consists of the main cell body (the plasma membrane, nucleus, etc.), dendrites, and an axon. Dendrites allow the neuron to receive signals, while the single axon is how the cell sends signals.

<center><img src="https://eurisko-us.github.io/images/blog/simulating-a-biological-neural-network-using-the-hodgkin-huxley-model-1-neuron-structure.jpg" style="border: none; height: 20em;" alt="icon"></center>
<br>

Neurons send signals via spikes in electrical activity called <b>action potentials</b>. Before we jump into modeling action potentials, let's learn a bit more about them.

Each neuron has a resting membrane potential around -70 mV (it is negative because the surroundings of the neuron have accumulated ions). As neurotransmitters bind to the receptors, the neuron is depolarized, moving the membrane potential closer to 0 mV. When the membrane potential reaches a certain threshold (around -55 mV for a neuron starting at -70 mV), sodium channels open, allowing many sodium ions into the cell. Rapid depolarization follows, and the membrane potential becomes positive. This influx of positive charge is what is known as the action potential.

When the action potential reaches its peak, sodium channels close, potassium channels open, and the cell loses membrane potential (repolarization). The drop in membrane potential causes the neuron to become hyperpolarized, and enter a state where it is very difficult to cause the neuron to depolarize again. Eventually the neuron reaches its resting membrane potential again, where it is no longer hyperpolarized.

<center><img src="https://eurisko-us.github.io/images/blog/simulating-a-biological-neural-network-using-the-hodgkin-huxley-model-2-action-potential.jpg" style="border: none; height: 20em;" alt="icon"></center>
<br>

<h2>The Hodgkin-Huxley Model</h2>

The Hodgkin-Huxley model won the Nobel Prize in 1963 for Physiology and Medicine, and the prize was awarded to Sir John Carew Eccles, Alan Lloyd Hodgkin, and Andrew Fielding Huxley. These men won the prize for their model of the action potentials of neurons using differential equations.

The model yields a graph of how electrical stimulus affects the action potential (change in voltage) of a neuron over time. Hodgkin and Huxley derived much of the model from experimentation, and those results combined with physics to yield usable differential equations.

From physics, we have that the current is proportional to the change in voltage via the capacitance

<center>
$\begin{align*}
I = C \dfrac{dV}{dt},
\end{align*}$
</center>
<br>

and from this we can obtain 

<center>
$\begin{align*}
\dfrac{dV}{dt} = \dfrac{I}{C}.
\end{align*}$
</center>
<br>

In neurons, the capacitance is roughly $1$.

Next the current must be split into parts: the stimulus ($s$), the flux across the sodium and potassium channels ($I_{Na}$, $I_{K}$ respectively), and the current leakage ($I_{L}$). We then turn the previous equation into 

<center>
$\begin{align*}
\dfrac{dV}{dt} = \dfrac{1}{C} \left[ s - I_{Na} - I_{K} - I_{L} \right].
\end{align*}$
</center>
<br>

In this model it's really just 

<center>
$\begin{align*}
\dfrac{dV}{dt} = s - I_{Na} - I_{K} - I_{L}.
\end{align*}$
</center>
<br>

since $C=1.$

One thing to keep in mind for all of these equations is that $V$ represents voltage <i>offset</i> from the resting potential (-70 mV), and not the actual voltage of the neuron. This is done to make graphing and showing the model more simple.


