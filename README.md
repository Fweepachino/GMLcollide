# GMLcollide
A script for Game Maker Studio 2 that allows for simple collision with rectangle hitboxes using the given Bounding Box.

This is done by checking the users and the colliders given Bounding Boxes and seeing if there is a collision.
If a collision is found, it will use a scoring system to determine where the user and the collider met, and what direction to move the user in.
In the event of a collision with a corner, this scoring system will also determine whether the user should move vertically, diagonally, or both.

This system currently only works with simple rectangle Bounding Boxes, and it is reccomended that if you need to use collision detection on a non-rectangular 
shape (such as a diagonal or a circle) it would be advised to look elsewhere for now, as this code is not yet prepared to handle that.
