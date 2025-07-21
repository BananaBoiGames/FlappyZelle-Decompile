if (global.begun == true)
{
    image_alpha = lerp(image_alpha, 1, 0.1);
    image_blend = -1;
    timer--;
    image_angle = -(vspeed * 5);
    if (instance_exists(obj_pipe))
    {
        if (y > (instance_nearest(x + 100 + random_range(-50, 50), y, obj_pipe).y + 10) && timer <= 0)
        {
            vspeed = -random_range(2, 4);
            if (y > (instance_nearest(x + 100 + random_range(-50, 50), y, obj_pipe).y + 80) && timer <= 0)
            {
                vspeed = -random_range(3, 7.5);
            }
            timer = 2;
        }
    }
    if (timer > 0)
    {
        timer--;
    }
    if (y <= 0)
    {
        vspeed = 0;
    }
    vspeed = clamp(vspeed, -6, 8);
    y = clamp(y, 0, room_height + 8);
    gravity = 0.2;
    if (place_meeting(x, y, obj_pipe))
    {
        instance_destroy();
    }
}
else
{
    image_blend = c_gray;
    image_alpha = 0.8;
}
