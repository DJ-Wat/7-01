-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

local ball = display.newImageRect( "./assets/ball.png", 50, 50 )
ball.id = "ball object"
ball.x = display.contentCenterX
ball.y = display.contentCenterY
 
local function onObjectTouch( self, event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
    end
    return true
end
 
ball.touch = onObjectTouch
ball:addEventListener( "touch", ball )

local button = display.newImageRect( "./assets/button.png", 50, 50 )
button.id = "button object"
button.x = display.contentCenterX
button.y = display.contentCenterY - 100
 
function button:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
 
            -- Reset touch focus
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
        end
    end
    return true
end
button:addEventListener( "touch", button )