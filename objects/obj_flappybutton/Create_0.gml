image_speed = 0;
audio_stop_all();
if (global.flappymusic)
{
    chosenmusic = mus_pou;
    audio_play_sound(chosenmusic, 1, true, 0.5);
}
else
{
    chosenmusic = -1;
}
