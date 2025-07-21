x = mouse_x;
y = mouse_y;
if (postwinmassacredelay > 0)
{
    postwinmassacredelay--;
}
if ((mouse_check_button_pressed(mb_left) && !postwin && image_index == 0) || (postwin != 0 && mouse_check_button(mb_left) && postwinmassacredelay == 0))
{
    if (audio_is_playing(snd_shoot))
    {
        audio_stop_sound(snd_shoot);
    }
    var _ss = audio_play_sound(snd_shoot, 1, false);
    audio_sound_pitch(_ss, 1 + random_range(-0.3, 0.3));
    image_index = 1;
    postwinmassacredelay = 6;
    alarm[0] = 5;
    audio_stop_sound(snd_yahaa);
    var found = false;
    with (obj_wantedchar)
    {
        if (place_meeting(x, y, obj_gun))
        {
            if (audio_is_playing(snd_scream))
            {
                audio_stop_sound(snd_scream);
            }
            if (audio_is_playing(snd_scream2))
            {
                audio_stop_sound(snd_scream2);
            }
            if (audio_is_playing(snd_screamdoh))
            {
                audio_stop_sound(snd_screamdoh);
            }
            var _sc = audio_play_sound(choose(snd_scream, snd_scream2, snd_screamdoh), 1, false);
            audio_sound_pitch(_sc, 1 + random_range(-0.3, 0.3));
            if (image_index == obj_shootercontroller.wantedcharacterindex)
            {
                found = true;
            }
            instance_create_depth(x, y, depth + 1, obj_blood);
            instance_destroy();
            break;
        }
    }
    if (found == false)
    {
        if (instance_exists(obj_shootercontroller))
        {
            obj_shootercontroller.live -= 1;
        }
    }
    else if (instance_exists(obj_shootercontroller))
    {
        postwin = true;
        obj_shootercontroller.win();
    }
}
