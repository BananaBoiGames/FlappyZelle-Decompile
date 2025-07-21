draw_set_font(fnt_comic);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (choosing == true)
{
    if (wantedcharacterindex >= 1)
    {
        draw_set_alpha(0.3);
        draw_sprite(spr_shoot, wantedcharacterindex - 1, (room_width / 2) - 90, room_height / 2);
    }
    if (wantedcharacterindex >= 2)
    {
        draw_set_alpha(0.1);
        draw_sprite(spr_shoot, wantedcharacterindex - 2, (room_width / 2) - 180, room_height / 2);
    }
    draw_set_alpha(1);
    draw_sprite(spr_shoot, wantedcharacterindex, room_width / 2, room_height / 2);
    if (wantedcharacterindex <= 11)
    {
        draw_set_alpha(0.3);
        draw_sprite(spr_shoot, wantedcharacterindex + 1, (room_width / 2) + 90, room_height / 2);
    }
    if (wantedcharacterindex <= 10)
    {
        draw_set_alpha(0.1);
        draw_sprite(spr_shoot, wantedcharacterindex + 2, (room_width / 2) + 180, room_height / 2);
    }
    draw_set_alpha(1);
    draw_text(room_width / 2, (room_height / 2) + 90, "use mouse wheel to select your victim.");
    draw_text(room_width / 2, (room_height / 2) + 108, "press enter to confirm.");
    if (wantedcharacterindex < 12 && mouse_wheel_up())
    {
        wantedcharacterindex += 1;
    }
    if (wantedcharacterindex > 0 && mouse_wheel_down())
    {
        wantedcharacterindex -= 1;
    }
    if (keyboard_check(vk_enter))
    {
        choosing = false;
    }
    exit;
}
if (ready > 0)
{
    ready--;
    if ((ready % 60) == 0)
    {
        rsize = 1;
    }
    rsize = lerp(rsize, 0, 0.1);
    draw_sprite(spr_wantedbg, wantedcharacterindex, room_width / 2, (room_height / 2) - 32);
    draw_sprite(spr_shoot, wantedcharacterindex, room_width / 2, (room_height / 2) - 32);
    draw_text_transformed(room_width / 2, (room_height / 2) + 100, floor((ready + 60) / 60), 2 + rsize, 2 + rsize, 0);
}
if (ready >= 0)
{
    live = 3;
}
if (ready == 0)
{
    startgame();
    ready = -1;
}
if (ready <= 0)
{
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width + 1, 32, false);
    draw_rectangle(0, room_height - 6, room_width + 1, room_height + 1, false);
    draw_rectangle(0, 0, 8, room_height + 1, false);
    draw_rectangle(room_width - 8, 0, room_width + 1, room_height + 1, false);
    draw_set_color(-1);
}
if (ready == -1 && wonthegame == false)
{
    for (var i = 0; i < live; i++)
    {
        draw_sprite(spr_lives, 0, 8 + (i * 16), 8);
    }
    draw_set_color(c_gray);
    draw_text(room_width - 100, 16, "WANTED:");
    draw_set_color(-1);
    draw_sprite_ext(spr_shoot, wantedcharacterindex, room_width - 32, 16, 0.8, 0.8, 0, -1, image_alpha);
    draw_set_font(fnt_comicbig);
    draw_text(room_width / 2, 16, ceil(timer / 60));
    draw_set_font(fnt_comic);
    if (timer > 0)
    {
        timer--;
    }
    if (live < 0)
    {
        timer = 0;
        live = -100;
        draw_text(room_width / 2, (room_height / 2) + (sin(current_time / 200) * 20), "Game Over Noob!! press R");
        gameover();
        if (instance_exists(obj_gun))
        {
            audio_play_sound(snd_lose, 1, false);
            global.deaths++;
            instance_destroy(obj_gun);
        }
    }
    else if (timer <= 0)
    {
        timer = -1;
    }
    if (timer == -1)
    {
        gameover();
        draw_text(room_width / 2, (room_height / 2) + (sin(current_time / 200) * 20), "Time's Up!! press R");
        if (instance_exists(obj_gun))
        {
            audio_play_sound(snd_lose, 1, false);
            global.deaths++;
            instance_destroy(obj_gun);
        }
    }
}
if (wonthegame == true)
{
    draw_text(room_width / 2, (room_height / 2) + (sin(current_time / 200) * 20), "You Win!!  It's Execution Night...");
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (!window_has_focus())
{
    draw_set_color(c_gray);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_color(-1);
}
draw_set_font(-1);
