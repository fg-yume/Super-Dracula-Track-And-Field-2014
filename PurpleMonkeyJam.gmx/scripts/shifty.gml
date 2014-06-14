//argument0 = move distance

//can only move in whole number increments
argument0 = round(argument0);

//if speed is greater than 24, split the movement into multiple chunks
if(argument0 > sprite_height){
    shifty(argument0-sprite_height,argument1);
    argument0 = sprite_height;
}
if(argument0 < -sprite_height){
    shifty(argument0+sprite_height,argument1);
    argument0 = -sprite_height;
}

//move character vertically up
if(argument0 < 0)
{
    //if new location is free, move there
    if( !place_meeting(x,y+argument0,o_wall) ){
        y += argument0;
    }
    //move adjacent to wall
    else{
        while( !place_meeting(x,y+sign(argument0),o_wall) ){
            y += sign(argument0);
        }
        ymomentum = 0;
    }
    
    move_snap(1,1);
}

//move character vertically down, stopping on platforms
if(argument0 > 0)
{
    //if new location is free, move there
    if( !place_meeting(x,y+argument0,o_floor) || ( place_meeting(x,y,o_floor) && !place_meeting(x,y+argument0,o_wall) ) ){
        y += argument0;
    }
    else{
        //if intersecting a floor, move down to the nearest solid wall
        if( place_meeting(x,y,o_floor) ){
            while( !place_meeting(x,y+sign(argument0),o_wall) ){
                y += sign(argument0);
            }
        }
        //move down to the nearest platform
        else{
            while( !place_meeting(x,y+sign(argument0),o_floor) ){
                y += sign(argument0);
            }    
        }
        
        ymomentum = 0;
    }
    
    move_snap(1,1);
}
