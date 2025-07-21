if (!got)
{
    y = ystart + (sin(current_time / 100) * 2);
}
else
{
    y -= 1;
    hspeed = 0;
    image_alpha -= 0.001;
}
if (place_meeting(x, y, obj_flappyplayer) && got == false)
{
    audio_play_sound(snd_yahaa, 1, false);
    image_index = choose(1, 3, 4);
    if (image_index == 1)
    {
        global.points += 30;
    }
    if (image_index == 3)
    {
        if (instance_exists(obj_flappyplayer))
        {
            obj_flappyplayer.life += 2;
        }
    }
    if (image_index == 4)
    {
        if (instance_exists(obj_flappyplayer))
        {
            obj_flappyplayer.chill = 25;
        }
    }
    got = true;
}
if (bbox_bottom < 0)
{
    instance_destroy();
}
