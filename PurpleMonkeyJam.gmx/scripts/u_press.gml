if(stun > 0){
    return false;
}
if(joystick_exists(1) && !u_pressed){
    if(joystick_check_button(1,1)){
        return true;
    }
}
return (keyboard_check_pressed(o_controller.u_key) || keyboard_check_pressed(o_controller.u_key2));
