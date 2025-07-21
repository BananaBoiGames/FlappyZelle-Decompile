drawmeself();
if (global.begun == true)
{
    gravity = 0.2;
}
if (global.die == false)
{
    ang = -(vspeed * 5);
    if (keyboard_check_pressed(vk_space))
    {
        var _j = audio_play_sound(choose(snd_flappyjump1, snd_flappyjump2), true, false);
        audio_sound_pitch(_j, 1 + random_range(-0.3, 0.3));
        audio_sound_gain(_j, audio_sound_get_gain(_j) + random_range(-0.7, 0), 0);
        if (global.begun == false)
        {
            global.begun = true;
        }
        if (vspeed > 0)
        {
            vspeed = 0;
        }
        vspeed += -4;
    }
    if (y <= 0)
    {
        vspeed = 0;
    }
    vspeed = clamp(vspeed, -6, 8);
    y = clamp(y, 0, room_height + 8);
    if (chill > 0)
    {
        if (instance_exists(obj_pipe) && instance_exists(instance_nearest(x + 150, y, obj_pipe)))
        {
            y = lerp(y, instance_nearest(x + 150, y, obj_pipe).y + 5, 0.05);
            y += sin(current_time / 400);
            vspeed = 0;
            gravity = 0;
            invincible = 60;
        }
    }
}
if ((place_meeting(x, y, obj_pipe) || y >= (room_height + 8)) && invincible <= 0)
{
    if (life <= 0)
    {
        if (dieanim == false)
        {
            dieanim = true;
            vspeed = -8;
            audio_stop_all();
            audio_play_sound(snd_lose, true, false);
            audio_play_sound(choose(snd_scream, snd_scream2), 1, false);
            instance_create_depth(x, y, depth + 1, obj_blood);
        }
        if (global.die == false)
        {
            global.die = true;
        }
    }
    else
    {
        invincible = 60;
        life -= 1;
        vspeed = -8;
        audio_play_sound(choose(snd_scream, snd_scream2), 1, false);
    }
}
if (invincible > 0)
{
    invincible--;
    if ((invincible % 4) == 0)
    {
        image_blend = c_gray;
    }
    else
    {
        image_blend = -1;
    }
}
else
{
    image_blend = -1;
}
if (dieanim == true)
{
    hspeed = -2;
    gravity = 0.5;
    ang += 40;
}
