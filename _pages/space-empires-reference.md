---
layout: archive
title: ""
permalink: /space-empires-reference/
author_profile: false
---

# [<center>Space Empires Reference</center>](#top)

<div style="width:100%; max-width:800px; margin:auto"> 

<br>
<i>The full rulebook is <a class="body" target="_blank" href="{{site.url}}/files/space-empires-rulebook.pdf">here</a>.It is incredibly long and complex, so I've come up with a high-level summary below.</i>

<br>
<hr>
<br>

There are 2 players on a 7-by-7 grid. Each player starts on their home Planet with 1 Colony and 4 Shipyards on that Planet, as well as a fleet of 3 Scouts and 3 Colonyships. The players also have 0 Construction Points (CPs) to begin with.

<br><br>
Scouts and Colonyships each have several attributes: CP cost (i.e. the number of CPs needed to build the ship), hull size, attack class, attack strength, defense strength, attack technology level, defense technology level, health level. Regardless of the number needed to hit, a roll of 1 will always score a hit.

<br><br>
On each turn, there 3 phases: economic, movement, and combat.

<br><br>
<b>Economic Phase</b>

<br><br>
During the economic phase, each player gets 20 Construction Points (CPs) from the Colony on their home Planet, as well as 5 CPs from any other colonies ("other colonies" will be defined in a later rule). However, each player must pay a maintenance cost (in CPs) for each ship. The maintenance cost of a ship is equal to the hull size of the ship, and if a player is unable to pay a maintenance cost, it must remove the ship.

<br><br>
A player can also build ships with any CPs it has remaining, but the ships must be built at a planet with one or more Shipyards, and the sum of the hull sizes of the ships built at a planet cannot exceed the number of Shipyards at that planet.

<br><br>
<b>Movement Phase</b>

<br><br>
The movement phase consists of 3 rounds of movement. During each round of movement, each player can move each ship by one square in any direction. If a Colonyship lands on a planet, then it can "colonize" the planet by turning into a Colony.
Combat phase

<br><br>
<b>Combat Phase</b>

<br><br>
During the combat phase, a combat occurs at each square containing ships from both players. Each combat proceeds in rounds until only one player's ships remain at that spot.

<br><br>
Each round of combat starts with "ship screening", in which a player with more ships is given the opportunity to remove its ships from the combat round (but the number of ships that are left in combat must be at least the number of ships that the opponent has in that square).

<br><br>
Then, a "combat order" is constructed, in which ships are sorted by their attack class. The first ship in the combat order can attack any other ship. A 10-sided die is rolled, and if the attacker's (attack strength + attack technology) minus the defender's (defense strength + defense technology) is greater than or equal to the die roll, then a hit is scored. Once a ship sustains a number of hits equal to its hull size, it is destroyed.

<br><br>
The above procedure is repeated for each ship in the combat order. Then, if there are still ships from both teams left over, another round of combat begins. Combat continues until only one team's ships occupy the square.

<br><br>
<b>Check Your Understanding</b>

<ol>
<li>If a player is unable to pay the maintenance cost for one of it ships, what must the player do?</li>
<li>Even if a player has a lot of CPs, that doesn't necessarily mean it can build a lot of ships on a single turn. Why not?</li>
<li>How many spaces, in total, can a player move a ship during a turn? (Remember that the movement phase consists of multiple rounds of movement)</li>
<li>If Player A has 5 ships and Player B has 3 ships in the same square, up to how many ships can Player A screen from combat?</li>
<li>Is it possible for any of the losing player's ships to survive a combat?</li>
</ol>



<br>
<hr>
<br>



There are a couple additional rules:

<ul>
<li>In order to build a ship, not only must you have enough CPs and shipyards, but you must also have the necessary shipsize technology.</li>
<li>The combat order is constructed according to ships' tactics level: ships with tactics 0 are destroyed immediately, and ships with higher tactics fire first. If two ships have the same tactics, then the defending ship fires first (the defending ship is the ship that was the first to occupy the grid space).</li>
<li>Previously, I said that the maintenance cost is equal to the hullsize. This is usually true, but there are some special types of ships (Decoy, Colonyship, Base) that don't have a maintenance cost.</li>
</ul>

<br><br>
<b>Ship Types/Attributes</b>

<br><br>
Different ships have different values for the following attributes:

<ul>
<li><code>cp_cost</code> - the number of CPs required to build the ship</li>
<li><code>hullsize</code> - the number of shipyards needed to build the ship (assuming shipyard technology level 1)</li>
<li><code>shipsize_needed</code> - the level of shipsize technology required to build the ship</li>
<li><code>tactics</code> - determines the combat order; ships with tactics 0 are destroyed immediately</li>
<li><code>attack</code> and <code>defense</code> - as usual</li>
<li><code>maintenance</code> - the number of CPs that must be paid during each Economic phase to retain the ship</li>
</ul>

<pre><code>
'unit_data': {
        'Battleship': {'cp_cost': 20, 'hullsize': 3, 'shipsize_needed': 5, 'tactics': 5, 'attack': 5, 'defense': 2, 'maintenance': 3},
        'Battlecruiser': {'cp_cost': 15, 'hullsize': 2, 'shipsize_needed': 4, 'tactics': 4, 'attack': 5, 'defense': 1, 'maintenance': 2},
        'Cruiser': {'cp_cost': 12, 'hullsize': 2, 'shipsize_needed': 3, 'tactics': 3, 'attack': 4, 'defense': 1, 'maintenance': 2},
        'Destroyer': {'cp_cost': 9, 'hullsize': 1, 'shipsize_needed': 2, 'tactics': 2, 'attack': 4, 'defense': 0, 'maintenance': 1},
        'Dreadnaught': {'cp_cost': 24, 'hullsize': 3, 'shipsize_needed': 6, 'tactics': 5, 'attack': 6, 'defense': 3, 'maintenance': 3},
        'Scout': {'cp_cost': 6, 'hullsize': 1, 'shipsize_needed': 1, 'tactics': 1, 'attack': 3, 'defense': 0, 'maintenance': 1},
        'Shipyard': {'cp_cost': 3, 'hullsize': 1, 'shipsize_needed': 1, 'tactics': 3, 'attack': 3, 'defense': 0,, 'maintenance': 0},
        'Decoy': {'cp_cost': 1, 'hullsize': 0, 'shipsize_needed': 1, 'tactics': 0, 'attack': 0, 'defense': 0, 'maintenance': 0},
        'Colonyship': {'cp_cost': 8, 'hullsize': 1, 'shipsize_needed': 1, 'tactics': 0, 'attack': 0, 'defense': 0, 'maintenance': 0},
        'Base': {'cp_cost': 12, 'hullsize': 3, 'shipsize_needed': 2, 'tactics': 5, 'attack': 7, 'defense': 2, 'maintenance': 0},
}
</code></pre>

<br><br>
<b>Technology</b>

<br><br>
Here are the specifics regarding technology:

<ul>
<li>attack, defense - determines the amount that gets added to a ship's attack or defense during battle</li>

<li>shipsize - determines what kinds of ships can be built (provided you have enough CP and shipyards)

<br>
<pre><code>
Level  | Upgrade Cost | Benefit
----------------------------------------------------------------------
  1   |       -      | Can build Scout, Colony Ship, Ship Yard, Decoy
  2   |      10      | Can build Destroyer, Base
  3   |      15      | Can build Cruiser
  4   |      20      | Can build Battlecruiser
  5   |      25      | Can build Battleship
  6   |      30      | Can build Dreadnaught
</code></pre>
</li>

<li>movement - determines how many spaces each ship can move during each movement phase

<br>
<pre><code>
Level | Upgrade Cost | Benefit
---------------------------------------------------------
  1   |       -      | Can move one space per movement
  2   |      20      | Can move 1 space in each of the
                       first 2 movements and 2 spaces in
                       the third movement
  3   |      30      | Can move 1 space in the first movement
                       and 2 spaces in each of the second and
                       third movements
  4   |      40      | Can move 2 spaces per movement
  5   |      40      | Can move 2 spaces in each of the first 2 
                       movements and 3 spaces in the third movement
  6   |      40      | Can move 2 spaces in the first movement and 3
                       spaces in each of the second and third movements
</code></pre>
</li>

<li>shipyard - determines how much "hull size" each shipyard can build

<br>
<pre><code>
Level | Upgrade Cost | Hull Size Building Capacity of Each Ship Yard
------------------------------------------------------------
   1  |      -       |     1
   2  |      20      |     1.5
   3  |      30      |     2
</code></pre>
</li>

</ul>

<br><br>
The information is summarized as follows:

<pre><code>
'technology_data': {
    'shipsize':
        {'upgrade_cost': [10, 15, 20, 25, 30],
            'starting_level': 1},
    'attack':
        {'upgrade_cost': [20, 30, 40],
            'starting_level': 0},
    'defense':
        {'upgrade_cost': [20, 30, 40],
            'starting_level': 0},
    'movement':
        {'upgrade_cost': [20, 30, 40, 40, 40],
            'starting_level': 1},
    'shipyard':
        {'upgrade_cost': [20, 30],
            'starting_level': 1}
}
</code></pre>

<br><br>
<b>Check Your Understanding</b>

<ul>
<li>If a player has 30 CP and 2 Shipyards at its home colony (with Shipyard tech level 1), how many Scouts can it buy?</li>
<li>Who would win in combat -- a Colonyship or a Scout?</li>
<li>A Battleship and a Battlecruiser are in combat. Which ship attacks first?</li>
<li>Two Scouts are in combat. How do you determine which Scout attacks first?</li>
<li>Suppose you have 1000 CP and 4 shipyards. If you upgrade Shipyard technology to the max, how many Scouts could you build?</li>
</ul>

</div>