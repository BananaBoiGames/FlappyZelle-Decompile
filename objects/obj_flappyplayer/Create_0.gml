image_index = global.chosensprite;
image_speed = 0;
mask_index = spr_flappyplayermask;
depth = -9999;
life = 0;
invincible = 0;
chill = 0;
ang = 0;
dieanim = false;

drawmeself = function()
{
    if (life > 0)
    {
        draw_set_color(c_yellow);
        draw_set_font(fnt_comicbig);
        draw_text(x - 16, y + 30, "+" + string(life));
        draw_set_font(-1);
        draw_set_color(-1);
    }
    if (chill > 0)
    {
        draw_sprite(spr_flappychillcloud, 0, x, y + 20);
        draw_set_color(c_black);
        draw_set_font(fnt_comicbig);
        draw_text(x - 16, y + 18, chill);
        draw_set_font(-1);
        draw_set_color(-1);
    }
    for (var i = 4; i > 0; i--)
    {
        gpu_set_fog(1, c_white, 1, 1);
        draw_sprite_ext(spr_shoot, image_index, x + i, y, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x - i, y, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x, y + i, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x, y - i, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x + i, y + i, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x - i, y - i, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x - i, y + i, 1, 1, ang, -1, 1);
        draw_sprite_ext(spr_shoot, image_index, x + i, y - i, 1, 1, ang, -1, 1);
        gpu_set_fog(false, c_white, 1, 1);
    }
    draw_sprite_ext(spr_shoot, image_index, x, y, 1, 1, ang, -1, 1);
};
