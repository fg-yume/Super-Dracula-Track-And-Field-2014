if(stun > 0){
    return false;
}
if(joystick_exists(1)){
    if(joystick_ypos(1) >= .4){
        return true;
    }
    if(joystick_pov(1) >= 135 && joystick_pov(1) <= 225){
        return true;
    }
}
return keyboard_check(o_controller.d_key);
