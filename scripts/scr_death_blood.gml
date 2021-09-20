///scr_death_blood
instance_create(x, y, obj_bloodpool)


//First blood splat
repeat(50) //50 -- -5,5
instance_create((x + (irandom_range(-5, 5))), (y + (irandom_range(-5, 5))), obj_blood) //1, 10

//Second blood splat
repeat(25) //25 -- -10, 10
instance_create((x + (irandom_range(-10, 10))), (y + (irandom_range(-10, 10))), obj_blood) //1, 10

//Third blood splat
repeat(15) //15 -- -15, 15
instance_create((x + (irandom_range(-15, 15))), (y + (irandom_range(-15, 15))), obj_blood) //1, 10

//Fourth blood splat
repeat(7) //7 -- -20, 20
instance_create((x + (irandom_range(-20, 20))), (y + (irandom_range(-20, 20))), obj_blood) //1, 10
