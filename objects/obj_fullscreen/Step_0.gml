if (place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left))
{
    window_set_fullscreen(!window_get_fullscreen());
}
image_index = window_get_fullscreen();
