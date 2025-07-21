function animation_running()
{
    if (instance_exists(obj_button) && obj_button.image_index == 1)
    {
        return true;
    }
    return false;
}

function animation_inside_view()
{
    if ((bbox_right + 1) > ((room_width / 2) - 360) && (bbox_left - 1) < (((room_width / 2) - 360) + 720) && (bbox_bottom + 1) > ((room_height / 2) - 202.5) && (bbox_top - 1) < (((room_height / 2) - 202.5) + 405))
    {
        return true;
    }
    return false;
}
