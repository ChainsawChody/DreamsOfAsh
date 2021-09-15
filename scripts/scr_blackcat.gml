///scr_blackcat
var randnegx = (irandom_range(-150, -50));// or (irandom_range(50, 150))
var randnegy = (irandom_range(-150, -50));// or (irandom_range(50, 150))
var randposx = (irandom_range(150, 50));// or (irandom_range(50, 150))
var randposy = (irandom_range(150, 50));// or (irandom_range(50, 150))

//Choose positive/negative range
var randx = choose(randnegx, randposx);
var randy = choose(randnegy, randposy);

var spawnx = (obj_player.x + randx);// or (obj_player.x - irandom_range(randx, randy)));
var spawny = (obj_player.y + randy);// or (obj_player.y - irandom_range(randx, randy)));

//Create Pigman at random x, y
instance_create(spawnx, spawny, obj_blackcat);
