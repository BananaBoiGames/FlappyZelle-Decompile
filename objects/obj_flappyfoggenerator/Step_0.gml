timer += 1;
if (!instance_exists(par))
{
    if (image_alpha > 0)
    {
        image_alpha -= 0.01;
    }
    if (image_alpha <= 0)
    {
        instance_destroy();
    }
}
if ((timer % 4) == 0)
{
    instance_create_depth(room_width, irandom_range(0, room_height - 32), depth, obj_flappyfog);
}
