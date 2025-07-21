if (keyboard_check(ord("R")))
{
    ini_open("flappyclone");
    ini_write_real("shooter", "fails", global.deaths);
    ini_write_real("shooter", "wins", global.wins);
    ini_close();
    room_restart();
}
if (room == rm_title)
{
    instance_destroy();
    audio_stop_all();
}
