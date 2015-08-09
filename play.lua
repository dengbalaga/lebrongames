local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

local spawnEnemy
-- local shipSmash
local gameTitle
local scoreTxt
local scoreTxt2
local score = 0
local hitPlanet
local planet
local speedBump = 0
local scorestat = 0

-- preload audio

local sndKill = audio.loadSound ("boing-1.wav")
local sndBlast = audio.loadSound ("blast.mp3")
local sndLose = audio.loadSound ("wahwahwah.mp3")

local function buttonHit(event)
	composer.gotoScene(event.target.goto, {effect="crossFade"})
	return true
end

-- create play screen
		local function createPlayScreen()	
	
				
				planet = display.newImage("lebron.png")
				planet.x = centerX
				planet.y = centerY
				--planet.y = display.contentHeight + 60
				planet.alpha = 1
				planet.xScale =2
				planet.yScale =2
			-- planet:addEventListener ("tap", shipSmash)
				
				-- transition.to( planet, { time=2000, y=100 } )
				--transition.to( background, { time=2000, alpha=1, y=centerY, x=centerX } )
				

				startGame()

				--transition.to( planet, { time=2000, alpha=1, y=centerY, onComplete=showTitle } )
		end


function spawnEnemy()
	local enemypics = {"stephen.png","klay.png", "kerr.png"}
	local enemy = display.newImage(enemypics[math.random (#enemypics)])
	-- local enemy = display.newImage("beetleship.png")
	-- enemy.x = math.random(20, display.contentWidth-20)
	-- enemy.y = math.random(20, display.contentHeight-20)
	enemy:addEventListener ("tap", shipSmash)
	
	if math.random(2) ==1 then
		enemy.x = math.random (-100, -10)
	else
		enemy.x = math.random (display.contentWidth + 10, display.contentWidth + 100)
		 enemy.xScale = -1
	end
	enemy.y = math.random (display.contentHeight)
--	enemy.trans = transition.to (enemy, {x=centerX, y=centerY, time=2000, onComplete=hitPlanet })
	enemy.trans = transition.to ( enemy, { x=centerX, y=centerY, time=math.random(1500-speedBump, 3500-speedBump), onComplete=hitPlanet } )
	speedBump = speedBump + 50
end
		
function startGame()

		spawnEnemy()
		


		scoreTxt = display.newText( "Score: 0", 0, 0, "Helvetica", 22)
		scoreTxt.x = centerX
		scoreTxt.y = 20
		score = 0
	
	
	
		planet.numHits = 10
		planet.alpha = 1	
		speedBump = 0

end		

local function planetDamage()

	planet.numHits = planet.numHits - 2
	planet.alpha = planet.numHits / 10	
	if planet.numHits < 2 then
		planet.alpha = 0
		--timer.performWithDelay ( 1000, startGame )
		audio.play ( sndLose )

			-- gameover text
			-- local function showTitle()
			gameTitle_over = display.newImage("gametitle_gameover.png")
			gameTitle_over.alpha = 0
			gameTitle_over:scale (4, 4)
			transition.to (gameTitle_over, {time=500, x=240, y=180, alpha=1, xScale=1.5, yScale=1.5})
		   --  scorestat = 1
	else
	
		local function goAway(obj)
			planet.xScale = 2
			planet.yScale = 2
			planet.alpha = planet.numHits / 10
		end
		--transition.to (planet, {time=200, xScale=3, yScale=3, alpha=1, onComplete=goAway })
	end
end

function hitPlanet(obj)
	display.remove(obj)
	planetDamage()
	audio.play(sndBlast)
--	spawnEnemy()
	if planet.numHits > 1 then
		spawnEnemy()
	end
end

function shipSmash(event)
	local obj = event.target
	display.remove(obj)
	audio.play(sndKill)
	
	-- obj = display.newImage("splat.png")

	transition.cancel ( event.target.trans )
	score = score + 28
	scoreTxt.text = "Score: " .. score
	spawnEnemy()
	return true
end

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view
local group = display.newGroup()
    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.

--	local title = display.newText("Play", 0, 0, "Helvetica", 48)
--	title.x = centerX
--	title.y = screenTop + 40
--	sceneGroup:insert(title)
	
				local background = display.newImage("court.png")
				-- background.x = centerX
				-- background.y = centerY
				background.y = 130
				background.alpha = 1
			--	background:addEventListener ("tap", shipSmash)
				background.y=centerY
				background.x=centerX
    sceneGroup:insert(background)	
	
	local backBtn = display.newText("Back", 0, 0, "Helvetica", 24 )
	backBtn.x = centerX -240
	backBtn.y = screenBottom - 20
	backBtn.goto = "menu"
	backBtn:addEventListener("tap", buttonHit)
-- local group = display.newGroup()
    sceneGroup:insert(backBtn)



-- START
		createPlayScreen()
-- END


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