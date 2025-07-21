draw_self();
direction += 0.3;
if (showoff > 0)
{
    showoff++;
    draw_sprite_ext(spr_middlefinger, 0, x - 16, y + 16, image_xscale / 2, image_yscale / 2, sin(current_time / 100) * 5, -1, 1);
}
if (instance_exists(obj_gun))
{
    if (obj_gun.postwin == true && distance_to_object(obj_gun) < 120)
    {
        direction = lerp(direction, point_direction(obj_gun.x, obj_gun.y, x, y), 0.1);
    }
}
