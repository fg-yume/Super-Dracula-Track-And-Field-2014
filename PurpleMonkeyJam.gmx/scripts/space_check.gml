if(stun > 0){
    return false;
}
if(joystick_exists(1)){
    if(joystick_check_button(1,2)){
        return true;
    }
}
return (keyboard_check(space_key) || keyboard_check(space_key2));
