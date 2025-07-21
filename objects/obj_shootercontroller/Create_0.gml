randomize();
instance_create_depth(x, y, depth - 100, obj_gun);
wantedcharacterindex = 0;
randomlistofcharacters = ds_list_create();
for (var i = 0; i < sprite_get_number(spr_shoot); i++)
{
    ds_list_add(randomlistofcharacters, i);
}
ds_list_shuffle(randomlistofcharacters);
repeat (10)
{
    ds_list_delete(randomlistofcharacters, 0);
}
for (var j = 0; j < ds_list_size(randomlistofcharacters); j++)
{
    if (ds_list_find_value(randomlistofcharacters, j) == wantedcharacterindex)
    {
        ds_list_delete(randomlistofcharacters, j);
    }
}
choosing = true;
live = 3;
ready = 300;
rsize = 0;
timer = 1800;

startgame = function()
{
    audio_play_sound(snd_shooter, 1, 1);
    repeat (80)
    {
        ds_list_shuffle(randomlistofcharacters);
        var _inst = instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height), depth, obj_wantedchar);
        _inst.image_index = ds_list_find_value(randomlistofcharacters, 0);
        if (_inst.image_index == wantedcharacterindex)
        {
            _inst.image_index = wantedcharacterindex + choose(1, -1);
        }
    }
    var _instfind = instance_create_depth(irandom_range(0, room_width), irandom_range(0, room_height), depth, obj_wantedchar);
    _instfind.image_index = wantedcharacterindex;
};

gameover = function()
{
    if (instance_exists(obj_wantedchar))
    {
        var me = id;
        with (obj_wantedchar)
        {
            if (image_index != me.wantedcharacterindex)
            {
                instance_destroy();
            }
            else
            {
                showoff = true;
            }
        }
    }
    audio_stop_all();
};

win = function()
{
    wonthegame = true;
    audio_stop_all();
    audio_play_sound(snd_win, 1, false);
    audio_play_sound(snd_yahaa, 1, false);
    global.wins++;
};

wonthegame = false;
audio_stop_all();
