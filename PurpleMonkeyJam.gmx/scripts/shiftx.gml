//argument0 = move distance

//can only move in whole number increments
argument0 = round(argument0);

if( ( place_meeting(x,y+1,o_wall) || ( place_meeting(x,y+1,o_floor) && !place_meeting(x,y,o_floor) ) ) && ymomentum >= 0 ){
    onground = 1;
}
else{
    onground = 0;
}

//if speed is greater than 24, split the movement into multiple chunks
if(argument0 > sprite_width){
    shiftx(argument0-sprite_width,argument1);
    argument0 = sprite_width;
}
if(argument0 < -sprite_width){
    shiftx(argument0+sprite_width,argument1);
    argument0 = -sprite_width;
}

//move character horizontally and up slopes
if( argument0 != 0 ){
    //checks if character is currently intersecting a platform
    if( place_meeting(x,y,o_floor) ){
        fallthrough = 1;
    }
    else{
        fallthrough = 0;
    }
    
    //set to 1 if character moves up a slope
    move_up_slope = 0;
    
    //if new location is free, move there
    if( !place_meeting(x+argument0,y,o_wall) ){
        x += argument0;
    }
    //move up solid slopes
    else if( !place_meeting(x+argument0,y-abs(argument0*2)-2,o_wall) ){
        x += argument0;
        y -= abs(argument0*2)+2;
        move_up_slope = 1;
    }
    //move adjacent to wall
    else{
        while( !place_meeting(x+sign(argument0),y,o_wall) ){
            x += sign(argument0);
        }
        xmomentum = 0;
        /*if(frozen){
            stun = 10;
            knockback = 0;
            immune = 16;
            frozen = 0;
            FMODSoundPlay(shatter);
        }*/
    }
    
    move_snap(1,1);
    
    //move character up sloped platforms
    if( !fallthrough && place_meeting(x,y,o_floor) && !place_meeting(x+argument0,y-abs(argument0*2)-2,o_floor) ){
        y -= abs(argument0*2)+2;
        move_up_slope = 1;
    }
    
    //move character down if just above the ground (so he can walk down slopes
    if( (place_meeting(x,y+abs(argument0*2)+2,o_floor) && onground) || move_up_slope ){
        while( !place_meeting(x,y+1,o_floor) ){
            y += 1;
        }
    }
}
