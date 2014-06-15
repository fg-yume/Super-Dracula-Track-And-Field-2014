if(stun > 0){
    return false;
}
if(joystick_exists(1)){
    if(joystick_xpos(1) >= .4){
        return true;
    }
    if(joystick_pov(1) >= 45 && joystick_pov(1) <= 135){
        return true;
    }
}
return keyboard_check(o_controller.r_key);
