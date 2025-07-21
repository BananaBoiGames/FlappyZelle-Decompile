if (paused == true)
{
    draw_set_font(fnt_comicbig);
    if (pausesurf != -1)
    {
        if (surface_exists(pausesurf))
        {
            draw_surface(pausesurf, 0, 0);
        }
    }
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_color(-1);
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(room_width / 2, room_height / 2, "PAUSED");
    draw_set_color(-1);
    draw_set_font(fnt_comicbig);
    for (var i = 2; i > 1; i--)
    {
        draw_text(100 - i, 32, "HI: " + string(global.highestscore));
        draw_text(100 + i, 32, "HI: " + string(global.highestscore));
        draw_text(100, 32 - i, "HI: " + string(global.highestscore));
        draw_text(100, 32 + i, "HI: " + string(global.highestscore));
        draw_text(room_width / 2, 32 + i, global.points);
        draw_text(room_width / 2, 32 - i, global.points);
        draw_text((room_width / 2) + i, 32, global.points);
        draw_text((room_width / 2) - i, 32, global.points);
    }
    draw_set_color(c_black);
    draw_text(100, 32, "HI: " + string(global.highestscore));
    draw_text(room_width / 2, 32, global.points);
    draw_set_color(-1);
    draw_set_font(-1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(-1);
}
if (!window_has_focus())
{
    if (paused == false)
    {
        paused = true;
        pausesurf = surface_create(room_width, room_height);
        surface_set_target(pausesurf);
        draw_surface(application_surface, 0, 0);
        if (instance_exists(obj_flappyenemy))
        {
            with (obj_flappyenemy)
            {
                image_alpha = 0.1;
            }
        }
        if (instance_exists(obj_flappyplayer))
        {
            with (obj_flappyplayer)
            {
                drawmeself();
            }
        }
        surface_reset_target();
    }
}
else if (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_enter))
{
    paused = !paused;
    if (paused)
    {
        pausesurf = surface_create(room_width, room_height);
        surface_set_target(pausesurf);
        draw_surface(application_surface, 0, 0);
        if (instance_exists(obj_flappyenemy))
        {
            with (obj_flappyenemy)
            {
                image_alpha = 0.1;
            }
        }
        if (instance_exists(obj_flappyplayer))
        {
            with (obj_flappyplayer)
            {
                drawmeself();
            }
        }
        surface_reset_target();
    }
}
if (paused)
{
    instance_deactivate_all(true);
    instance_activate_object(obj_mouse);
    instance_activate_object(obj_flappybutton);
    if (instance_exists(obj_flappybutton))
    {
        obj_flappybutton.depth = -900;
    }
}
else
{
    instance_activate_all();
    surface_free(pausesurf);
    pausesurf = -1;
}
