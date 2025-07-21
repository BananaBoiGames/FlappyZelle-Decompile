image_yscale = -1;
if (x < -64)
{
    instance_destroy();
}
if (passed == false && instance_exists(obj_flappyplayer) && obj_flappyplayer.x > x && global.die == 0)
{
    audio_play_sound(snd_flappypoint, 1, false);
    global.points += 1;
    passed = true;
    if (instance_exists(obj_flappybg))
    {
        with (obj_flappybg)
        {
            trigger = true;
        }
    }
    if (instance_exists(obj_flappyplayer))
    {
        with (obj_flappyplayer)
        {
            if (chill > 0)
            {
                chill -= 1;
            }
        }
    }
}
if (global.die == true && !instance_exists(obj_flappyenemy))
{
    hspeed = 0;
}
