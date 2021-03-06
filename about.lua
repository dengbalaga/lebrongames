local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- local appID = "1616575795286276"
-- local GGFacebook = require( "GGFacebook" )

local function buttonHit(event)
	composer.gotoScene(event.target.goto, {effect="crossFade"})
	return true
end
-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
	local group = display.newGroup()
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

	local title = display.newText("About", 0, 0, "Helvetica", 48)
	title.x = centerX
	title.y = screenTop + 40
-- local group = display.newGroup()
	sceneGroup:insert(title)
	
	local backBtn = display.newText("Back", 0, 0, "Helvetica", 24 )
	backBtn.x = centerX -240
	backBtn.y = screenBottom - 20
	backBtn.goto = "menu"
	backBtn:addEventListener("tap", buttonHit)
-- local group = display.newGroup()
    sceneGroup:insert(backBtn)



end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene