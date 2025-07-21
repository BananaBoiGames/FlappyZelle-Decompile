timer += 5;
if (instance_exists(par))
{
    if (image_alpha < 1)
    {
        image_alpha += 0.01;
    }
}
else
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
draw_set_alpha(image_alpha);
draw_sprite_tiled(sprite_index, image_index, -timer, timer * 2);
draw_set_alpha(1);
