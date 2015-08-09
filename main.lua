-- Corona SDK Project
-- by Dennis Balaga

-- display.setStatusBar(display.HiddenStatusBar)

local composer = require("composer")
composer.recycleOnSceneChange = true

display.setStatusBar(display.HiddenStatusBar)

-- most commonly used screen coordinates
centerX = display.contentCenterX
centerY = display.contentCenterY
screenLeft = display.screenOriginX
screenWidth = display.contentWidth - screenLeft * 2
screenRight = screenLeft + screenWidth
screenTop = display.screenOriginY
screenHeight = display.contentHeight - screenTop * 2
screenBottom = screenTop + screenHeight
display.contentWidth = screenWidth
display.contentHeight = screenHeight

composer.gotoScene ( "menu",  { effect="crossFade" } )





