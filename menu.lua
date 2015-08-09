local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here
local planet
local audioIsPlaying = true
local  buttonPlay
local sndMusic = audio.loadStream("Yo_My_Foes.mp3")
local sndMusic2 = audio.loadStream("Platterpuss.mp3")


local function buttonHit(event)
	composer.gotoScene(event.target.goto, {effect="crossFade"})
	return true
end

local function butHit(event)
-- 	local action = event.target.operation
 --	 	audio.play(sndMusic2)
 end

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )


     local sceneGroup = self.view
--	local group = display.newGroup()
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

--	local background = display.newImage("court.png")
--	background.x = centerX
--	background.y = centerY	
--	sceneGroup:insert(background)	


--	local title = display.newText("Main Menu", 0, 0, "Helvetica", 48)
--	title.x = centerX
--	title.y = screenTop + 40
--	sceneGroup:insert(title)
--	
--	local playBtn = display.newText("Play Game", 0, 0, "Helvetica", 30 )
--	playBtn.x = centerX
--	playBtn.y = centerY + 40
--	playBtn.goto = "play"
--	playBtn:addEventListener("tap", buttonHit)
--	sceneGroup:insert(playBtn)



--	local optionsBtn = display.newText("Options", 0, 0, "Helvetica", 30 )
--	optionsBtn.x = centerX
--	optionsBtn.y = centerY + 120
--	optionsBtn.goto = "options"
--	optionsBtn:addEventListener("tap", buttonHit)
 -- sceneGroup:insert(optionsBtn)
 
 
				local background = display.newImage("court.png")
				-- background.x = centerX
				-- background.y = centerY
				background.y = 130
				background.alpha = 1
 				sceneGroup:insert(background)
			--	background:addEventListener ("tap", shipSmash)
				
				planet = display.newImage("lebron.png")
				planet.x = centerX
				-- planet.y = centerY
				planet.y = display.contentHeight + 60
				planet.alpha = 1
				planet.xScale =2
				planet.yScale =2
 				sceneGroup:insert(planet)
			-- planet:addEventListener ("tap", shipSmash)
				
				-- transition.to( planet, { time=2000, y=100 } )
				transition.to( background, { time=2000, alpha=1, y=centerY, x=centerX } )
				
				local function showTitle()
					gameTitle = display.newImage("gametitle.png")
					gameTitle.alpha = 0
					gameTitle:scale (4, 4)
					transition.to (gameTitle, {time=500, alpha=1, xScale=1, yScale=1})
				--	spawnEnemy()
					-- startGame()
				end
				transition.to( planet, { time=2000, alpha=1, y=centerY, onComplete=showTitle } ) 
 

	local aboutBtn = display.newText("About", 0, 0, "Helvetica", 30 )
	aboutBtn.x = centerX
	aboutBtn.y = centerY + 80
	aboutBtn.goto = "about"
	aboutBtn:addEventListener("tap", buttonHit)
-- local group = display.newGroup()
    sceneGroup:insert(aboutBtn)

	local creditsBtn = display.newText("Credits", 0, 0, "Helvetica", 30 )
	creditsBtn.x = centerX
	creditsBtn.y = centerY + 120
	creditsBtn.goto = "creditsscene"
	creditsBtn:addEventListener("tap", buttonHit)
-- local group = display.newGroup()
    sceneGroup:insert(creditsBtn)

--load button
 

--buttonPlay = display.newImage("playNow.png")
--buttonPlay.x = centerX
--buttonPlay.y = 280
--buttonPlay.xScale = .5
--buttonPlay.yScale = .5
--buttonPlay.alpha = 1
--buttonPlay.goto = "options"
--buttonPlay:addEventListener("tap", buttonHit)
--sceneGroup:insert(buttonPlay)


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
    
    composer.removeHidden()
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