#Prototype 1

### Artist's Statement 

The _concept_ of the game is to control weather phenomena for the purpose of destruction. The game is meant to poke fun at conspiracy theories and their doomsday perspective on the field of weather modifications. Weather modification is often used to create precipitation for crops and local water supply however conspiracy theories abound suggest that it is used for warfare. 

It is meant to be an action game with a lot of moving parts and constant chaos to keep the user on their toes. The weather phenomena in question will be a tornado and it will be guided across a simplistic prairie land like map of tornado alley in the United States where targets of value like vehicles and buildings can be destroyed for points. The points will displayed as dollars worth of damage to the landscape from the birds eye view of news helicopter covering the destructive path of the player’s twister. 

The game will use several forces such as gravity which will attract objects to the tornado and friction which will be imposed in greater or lower amounts on the objects attracted, depending on the health of the tornado. The player will try to keep the tornado within changing weather systems that will have positive or negative effects. 

Other forces will be used in the destruction of objects, whose parts will be flung about the map. The way the parts will break and the distances they will be flung will be determined by the forces.

### Design Research Questions

- Possible to make generative map that keeps on creating itself on-the-go ?

- Possible to model forces involved to a compelling degree ?

- Possible to model undulating weather patterns and jetstream(directional tunnel of wind at edge of cold and hot air pockets) activity ?

### Decisions

- Will use Box2D to model forces further

- Use chapter 4,5,6 of NOC to inform decisions.

- Make objects seem like they are moving up tornado and dissapear to score points. Would 2-3 revolutions around tornado to score.

### Questions

- Can i get illustrator to export list of vector point and vector handles coordinates so i can easily recreate the shapes in Processing.

- Should I make the aesthetic low poly coloured fill triangles for the sprites and terrain ?

- How to animate a jetstream and surrounding air temperature ? Cloud formations ?

- How to move tornado to edges of map when matrix is translated to the edge of the map. ?


#Final Prototype

### Artist's Statement

The underlying concept of the game is an exploration on and a slightly educational experience about the formation of tornados and their overall financial effect. The gravity of this effect is imposed and embodied through the newscast point of view which is a signifier of the reality of such events. It also makes use of modern lore on conspiracy theories to make the game slightly more entertaining and to give it a bit of a fringe culture edge. 

The game starts with a preamble from a shadowy figure about destruction being good for the economy as it generates business in repair operations and insurance expenditure. The player then gets to control a tornado which at some point is intended to make them question if this could actually really be done and might prompt them to go research the phenomena of weather control. At the moment there aren’t very many hints for the player to do this but there are plans for such implementation. 

This concept was worth exploring because of the use of force algorhythms, array lists and particle systems to make the game function properly. Basically, making use of several of the concepts studied during the semester. Learned video game concepts such translating images while keeping a stationary UPC to give it the impression of moving across terrain and distance and collision detection we’re also empowered by using them while cycling through arrays. This might at first seem like a simple operation but the different types of arrays and loops and different capabilities and terminology of these loops made this a challenging task.

The game was also a chance to include visual production that was produced outside of programming with Adobe Illustrator. Game objects, logos, menus, an instruction screen portrait and the map we’re all produced using vector art. The advantage of the vector art was unlimited scaling without worrying of loss of detail.

The game also holds potential to be furthered beyond the scope of a single semester by gaining a better understanding of physics engines. Unfortunately physics engines we’re beyond my grasp for the allotted time frame. Furthermore, a library called geomerative for processing allows a print out of the individual vector points and they’re handle locations which gives the shapes even greater flexibility and distortion for in game interaction with other objects.

Overall, this is a compelling project that blends many conceptual angles to produce one well developed experience that while being short lived, will also reveal more of itself the more it is played. 
