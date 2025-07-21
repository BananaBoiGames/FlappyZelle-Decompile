if (window_get_fullscreen() == false)
{
    window_set_size(room_width, room_height);
}
surface_resize(application_surface, room_width, room_height);
window_set_position((display_get_width() / 2) - (room_width / 2), (display_get_height() / 2) - (room_height / 2));
