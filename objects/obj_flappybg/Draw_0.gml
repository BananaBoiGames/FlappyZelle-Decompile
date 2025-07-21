if (image_alpha < 1)
{
    image_alpha -= 0.01;
}
if (image_alpha <= 0)
{
    instance_destroy();
}
draw_set_alpha(image_alpha + rainalp);
for (var i = 0; i < ds_list_size(bgspd); i++)
{
    draw_sprite_tiled(sprite_index, abs(i - 7), x - (timer * ds_list_find_value(bgspd, i)), y);
}
draw_sprite_tiled(sprite_index, 0, x - (timer * 5), y);
draw_set_alpha(1);
var _interval = 25;
if (global.points > (_interval - 1) && (global.points % _interval) == 0 && global.begun == true && cancel == false && trigger == true && instance_number(obj_flappybg) == 1)
{
    audio_play_sound(snd_flappysuperpoint, 1, false);
    var _fbg = instance_create_depth(x, y, depth + 1, obj_flappybg);
    _fbg.sprite_index = nextbg;
    if (global.points == 200)
    {
        _fbg.sprite_index = spr_flappybgSPOILER1;
    }
    if (global.points == 400)
    {
        _fbg.sprite_index = spr_flappybgSPOILER2;
    }
    if (global.points == 600)
    {
        _fbg.sprite_index = spr_flappybgSPOILER3;
    }
    if (global.points == 800)
    {
        _fbg.sprite_index = spr_flappybgSPOILER4;
    }
    if (global.points > 900)
    {
        _fbg.sprite_index = spr_flappybgSPOILER5;
    }
    _fbg.timer = timer;
    image_alpha = 0.9;
    var _set = spr_flappybg;
    switch (nextbg)
    {
        case spr_flappybg:
            _set = spr_flappybg2;
            break;
        case spr_flappybg2:
            _set = spr_flappybg3;
            break;
        case spr_flappybg3:
            _set = spr_flappybg4;
            break;
        case spr_flappybg4:
            _set = spr_flappybghell;
            break;
        case spr_flappybghell:
            _set = spr_flappybg5;
            break;
        case spr_flappybg5:
            _set = spr_flappybg6;
            break;
        case spr_flappybg6:
            _set = spr_flappybg;
            break;
    }
    if (_fbg.sprite_index != spr_flappybghell)
    {
        var randomrain = irandom_range(0, 7);
        if (randomrain == 1 || randomrain == 2)
        {
            repeat (randomrain)
            {
                var _rain = instance_create_layer(0, 0, "Instances", obj_flappyrain);
                _rain.par = _fbg;
                _fbg.rainalp = -0.5;
                _rain.timer = randomrain * 100;
            }
        }
        var randomfog = irandom_range(0, 7);
        if ((randomfog == 1 || randomfog == 2) && !instance_exists(obj_flappyfoggenerator))
        {
            repeat (randomfog)
            {
                var _fog = instance_create_layer(0, -1000, "Instances", obj_flappyfoggenerator);
                _fog.par = _fbg;
            }
        }
    }
    _fbg.nextbg = _set;
    if (global.points > 900)
    {
        _fbg.nextbg = spr_flappybgSPOILER5;
    }
    cancel = true;
    trigger = false;
}
if ((global.die == false || instance_exists(obj_flappyenemy)) && global.begun == true)
{
    timer++;
}
trigger = false;
