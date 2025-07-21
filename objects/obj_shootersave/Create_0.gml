global.wins = 0;
global.deaths = 0;
if (window_get_fullscreen() == false)
{
    window_set_size(room_width * 2, room_height * 2);
}
surface_resize(application_surface, room_width, room_height);
window_set_position((display_get_width() / 2) - room_width, (display_get_height() / 2) - room_height);
ini_open("flappyclone");
global.deaths = ini_read_real("shooter", "fails", 0);
global.wins = ini_read_real("shooter", "wins", 0);
ini_close();
