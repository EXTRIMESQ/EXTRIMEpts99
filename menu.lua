-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

-- add the story board
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local menuChosen
-- include Corona's "widget" library
local widget = require "widget"
local navGene = require "scripts.modules.navGene"
--setup buttons
local NearMeBtn
local filters = require( "scripts.filters" )
-- 'onRelease' event listener for NearMeBtn


local function onNearMeBtnRelease()
	
        filters.nearby = true
	-- go to level1.lua scene
	storyboard.gotoScene( "scripts.listCategories", "fade", 500 )
        navGene.SetPrevScene("scripts.menu") 
	
	return true	-- indicates successful touch
end

-- Called when the scene's view does not exist:
function scene:createScene( event )
    print("CREATING MENU")
	local group = self.view
	
	-- create a widget button (which will loads level1.lua on release)
	NearMeBtn = widget.newButton{
		label="Near Me",
		labelColor = { default={255}, over={128} },
		default="assets/images/button.png",
		over="assets/images/button-over.png",
		width=154, height=40,
		onRelease = onNearMeBtnRelease	-- event listener function
	}
	NearMeBtn:setReferencePoint( display.CenterReferencePoint )
	NearMeBtn.x = display.contentWidth*0.5
	NearMeBtn.y = display.contentHeight - 125
	
	-- all display objects must be inserted into group
	--group:insert( background )
	--group:insert( titleLogo )
	group:insert( NearMeBtn )
end

-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	print("CREATING SMENU")
	-- INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
end

-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-- INSERT code here (e.g. stop timers, remove listenets, unload sounds, etc.)
	
end

-- If scene's view is removed, scene:destroyScene() will be called just prior to:
function scene:destroyScene( event )
	local group = self.view
	if NearMeBtn then
		NearMeBtn:removeSelf()	-- widgets must be manually removed
		NearMeBtn = nil
	end
end

-----------------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
-----------------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched whenever before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

-----------------------------------------------------------------------------------------

return scene
