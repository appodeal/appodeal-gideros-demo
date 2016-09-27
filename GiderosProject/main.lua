require "ads"
require "bit"
local appodeal = Ads.new("appodeal")

local INTERSTITIAL  = 1
local VIDEO         = 2
local BANNER        = 4
local BANNER_BOTTOM = 8
local BANNER_TOP    = 16
local BANNER_CENTER = 32
local ALL           = 127
local ANY           = 127

-- create the up and down sprites for the button
local up1 = Bitmap.new(Texture.new("buttons/button_up1.png"))
local down1 = Bitmap.new(Texture.new("buttons/button_down1.png"))

local up2 = Bitmap.new(Texture.new("buttons/button_up2.png"))
local down2 = Bitmap.new(Texture.new("buttons/button_down2.png"))

local up3 = Bitmap.new(Texture.new("buttons/button_up3.png"))
local down3 = Bitmap.new(Texture.new("buttons/button_down3.png"))

local up4 = Bitmap.new(Texture.new("buttons/button_up4.png"))
local down4 = Bitmap.new(Texture.new("buttons/button_down4.png"))

local up5 = Bitmap.new(Texture.new("buttons/button_up5.png"))
local down5 = Bitmap.new(Texture.new("buttons/button_down5.png"))

local up6 = Bitmap.new(Texture.new("buttons/button_up6.png"))
local down6 = Bitmap.new(Texture.new("buttons/button_down6.png"))

-- create the button

local buttonInitialize = Button.new(up1, down1)
local buttonShowBanner = Button.new(up2, down2)
local buttonShowInterstitial = Button.new(up3, down3)
local buttonShowVideo = Button.new(up4, down4)
local buttonShowInterstitialOrVideo = Button.new(up5, down5)
local buttonHideBanner = Button.new(up6, down6)

local buttonsXPosition = application:getContentWidth() / 2 - (up1:getWidth() / 2)

buttonInitialize:setPosition(buttonsXPosition, 10)
buttonShowBanner:setPosition(buttonsXPosition, 80)
buttonShowInterstitial:setPosition(buttonsXPosition, 150)
buttonShowVideo:setPosition(buttonsXPosition, 220)
buttonShowInterstitialOrVideo:setPosition(buttonsXPosition, 290)
buttonHideBanner:setPosition(buttonsXPosition, 360)

-- callbacks

appodeal:addEventListener(Event.AD_RECEIVED, function(e)
  alertDialog = AlertDialog.new("Ads callback AD_RECEIVED", e.type, "Ok")
  alertDialog:show()
end)

appodeal:addEventListener(Event.AD_FAILED, function(e)

end)

appodeal:addEventListener(Event.AD_ACTION_END, function(e)

end)

appodeal:addEventListener(Event.AD_DISMISSED, function(e)

end)

appodeal:addEventListener(Event.AD_DISPLAYED, function(e)

end)


buttonInitialize:addEventListener("click", 
	function()
		--[[
		parameters: 
		application key: string from your application settings http://www.appodeal.com/apps
		adTypes: types which you want to use in your application. It's possible to specify two or more types with bit library
					bit.bor(SKIPPABLE_VIDEO, INTERSTITIAL)
		autoCache: specify "true" to start load ads immediately after a setKey call
		triggerPrecache: call AD_RECEIVED after precache loaded
		smartBanners: enable or disable smart banners
		banners728x90: enable or disable banners with size 728x90
		bannersAnimation: enable or disable banners animation
		disableNetworks: all parameters after bannersAnimation will be recognized as disabled networks list
		]]--
		appodeal:setKey("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", ALL, "false", "false", "false", "true", "false")
		appodeal:loadAd(VIDEO)
		appodeal:loadAd(INTERSTITIAL)
		appodeal:loadAd(BANNER)
		print("appodeal initialized")
	end)
buttonShowBanner:addEventListener("click", 
	function()
		appodeal:showAd(BANNER_BOTTOM)
	end)
buttonShowInterstitial:addEventListener("click", 
	function() 
		appodeal:showAd(INTERSTITIAL)
	end)
buttonShowVideo:addEventListener("click", 
	function() 
		appodeal:showAd(VIDEO)
	end)
buttonShowInterstitialOrVideo:addEventListener("click", 
	function() 
		appodeal:showAd(bit.bor(VIDEO, INTERSTITIAL))
	end)
buttonHideBanner:addEventListener("click", 
	function() 
		appodeal:hideAd(BANNER)
	end)

application:setBackgroundColor(0xef3326)
stage:addChild(buttonInitialize)
stage:addChild(buttonShowBanner)
stage:addChild(buttonShowInterstitial)
stage:addChild(buttonShowVideo)
stage:addChild(buttonShowInterstitialOrVideo)
stage:addChild(buttonHideBanner)