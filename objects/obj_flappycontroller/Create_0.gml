randomize();
nextpipe = 0;
pipespd = 5;
global.begun = false;
global.points = 0;
global.die = false;
global.win = false;
nextchillpill = 75;
repeat (50)
{
    instance_create_depth(irandom_range(40, 400), irandom_range(16, room_height - 32), depth, obj_flappyenemy);
}
