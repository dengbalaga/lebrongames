-- Corona SDK Project
-- by Dennis Balaga

-- display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
local scene = composer.newScene()

--   local forward references should go here


-- called when the scene's  view does not exist
function scene:createScene(event)
	local group = self.view
	
	-- create display objects and add them to  'group' here
	-- example use-case: restore group  from previously saved state
	
	local title = display.newText("Main Menu", 0, 0, "Helvetica", 48)
	title.x = centerX
	title.y = screenTop + 40
	
end


-- called immediately after scene has moved onscreen
function scene:enterScene( event )
	local group = self.view
	
	-- INSERT CODE here (e.g. timers, load audio, start listeners, etc)

end


-- called when scene is about to moved offscreen
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT CODE here (e.g. timers, load audio, start listeners, etc)

end 




