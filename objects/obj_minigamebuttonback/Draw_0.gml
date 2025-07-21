if ((room == Room3 && (global.begun == false || (instance_exists(obj_pause) && obj_pause.paused == true))) || room != Room3)
{
    if ((room == Room2 && instance_exists(obj_shootercontroller) && obj_shootercontroller.choosing == true) || room != Room2)
    {
        draw_self();
        if ((place_meeting(x, y, obj_mouse) || place_meeting(x, y, obj_mouse)) && mouse_check_button_pressed(mb_left))
        {
            room_goto(rm_title);
        }
    }
}
