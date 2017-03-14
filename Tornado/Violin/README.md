#Violin

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