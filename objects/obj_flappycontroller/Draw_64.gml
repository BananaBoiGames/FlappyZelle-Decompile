if (global.begun == true && (global.die == false || instance_exists(obj_flappyenemy)))
{
    nextpipe--;
    if (nextpipe < 0)
    {
        nextpipe = 100;
        var _pipe = instance_create_depth(room_width + 32, irandom_range(64, room_height - 64), depth, obj_pipe);
        _pipe.hspeed = -pipespd;
        nextchillpill -= 1;
        if (nextchillpill == 0)
        {
            var _pill = instance_create_depth(_pipe.x, _pipe.y, depth, obj_chillpill);
            _pill.hspeed = -pipespd;
            nextchillpill = 75;
        }
        if (global.points > 999)
        {
            nextpipe = 4;
        }
    }
}
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_black);
draw_set_font(fnt_comicbig);
if (global.begun == false)
{
    draw_set_color(c_red);
    draw_text_transformed(room_width / 2, room_height / 2, "press space", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_text_transformed(room_width / 2, (room_height / 2) + 32, "mouse wheel: change character", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_set_color(-1);
    if (instance_exists(obj_flappyplayer))
    {
        if (mouse_wheel_up())
        {
            obj_flappyplayer.image_index += 1;
        }
        if (mouse_wheel_down())
        {
            obj_flappyplayer.image_index -= 1;
        }
        global.chosensprite = obj_flappyplayer.image_index;
    }
}
draw_set_color(-1);
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
if (!instance_exists(obj_flappyenemy) && global.die == false && global.win == 0)
{
    global.win = 1;
}
if (global.win == 1)
{
    audio_play_sound(snd_yahaa, 1, false);
    audio_play_sound(snd_win, 1, false);
    global.win = 2;
}
if (global.win == 2)
{
    draw_set_color(c_green);
    draw_text_transformed(room_width / 2, (room_height / 2) + 90 + (sin(current_time / 200) * 40), "You won against fake people... Noob", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_text_transformed(room_width / 2, (room_height / 2) + 90 + 32 + (sin(current_time / 200) * 40), "Die and press space to restart", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_set_color(-1);
    if (global.die == true)
    {
        if (keyboard_check_pressed(vk_space))
        {
            room_restart();
        }
    }
}
if (global.die == true && global.win == 0)
{
    draw_set_color(c_red);
    draw_text_transformed(room_width / 2, (room_height / 2) + 90, "You Suck", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_text_transformed(room_width / 2, (room_height / 2) + 90 + 32, "press space to restart", 1 + (sin(current_time / 100) * 0.2), 1 - (sin(current_time / 100) * 0.2), 0);
    draw_set_color(-1);
    if (keyboard_check_pressed(vk_space))
    {
        room_restart();
    }
}
draw_set_font(-1);
draw_set_color(-1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (global.points > global.highestscore)
{
    global.highestscore = global.points;
    ini_open("flappyclone");
    ini_write_real("flappy", "hiscore", global.highestscore);
    ini_close();
}
