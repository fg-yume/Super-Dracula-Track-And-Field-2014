if(stun > 0){
    return false;
}
if(joystick_exists(1)){
    if(joystick_check_button(1,1)){
        return true;
    }
}
return (keyboard_check(u_key) || keyboard_check(u_key2));
