if (place_meeting(x, y, obj_mouse) && mouse_check_button_pressed(mb_left))
{
    global.flappymusic = !global.flappymusic;
    if (global.flappymusic == true)
    {
        chosenmusic = mus_pou;
        audio_stop_all();
        audio_play_sound(chosenmusic, 1, false, 0.5);
    }
    else
    {
        chosenmusic = -1;
        audio_stop_all();
    }
}
image_index = !global.flappymusic;
if (chosenmusic == mus_pou && !audio_is_playing(mus_pou) && global.die == false)
{
    audio_play_sound(mus_pou, 1, true, 0.5);
}
