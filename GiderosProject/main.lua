require "ads"
require "bit"
local appodeal = Ads.new("appodeal")

local NONE                = 0;
local INTERSTITIAL        = 1;
local SKIPPABLE_VIDEO     = 2;
local BANNER              = 4;
local BANNER_BOTTOM       = 8;
local BANNER_TOP          = 16;
local REWARDED_VIDEO      = 128;
local NON_SKIPPABLE_VIDEO = 256;

-- create the up and down sprites for the button
local init_up = Bitmap.new(Texture.new("buttons/init.png"))
local init_down = Bitmap.new(Texture.new("buttons/init_down.png"))

local interstitial_up = Bitmap.new(Texture.new("buttons/interstitial.png"))
local interstitial_down = Bitmap.new(Texture.new("buttons/interstitial_down.png"))

local skippable_up = Bitmap.new(Texture.new("buttons/skippable.png"))
local skippable_down = Bitmap.new(Texture.new("buttons/skippable_down.png"))

local intskip_up = Bitmap.new(Texture.new("buttons/intskip.png"))
local intskip_down = Bitmap.new(Texture.new("buttons/intskip_down.png"))

local rewarded_up = Bitmap.new(Texture.new("buttons/rewarded.png"))
local rewarded_down = Bitmap.new(Texture.new("buttons/rewarded_down.png"))

local banner_up = Bitmap.new(Texture.new("buttons/banner.png"))
local banner_down = Bitmap.new(Texture.new("buttons/banner_down.png"))

local hideanner_up = Bitmap.new(Texture.new("buttons/hidebanner.png"))
local hidebanner_down = Bitmap.new(Texture.new("buttons/hidebanner_down.png"))

-- create the buttons

local buttonInitialize = Button.new(init_up, init_down)
local buttonShowBanner = Button.new(banner_up, banner_down)
local buttonHideBanner = Button.new(hideanner_up, hidebanner_down)
local buttonShowInterstitial = Button.new(interstitial_up, interstitial_down)
local buttonShowSkippableVideo = Button.new(skippable_up, skippable_down)
local buttonShowInterstitialOrVideo = Button.new(intskip_up, intskip_down)
local buttonShowRewardedVideo = Button.new(rewarded_up, rewarded_down)

local buttonsXPosition = application:getContentWidth() / 2 - (init_up:getWidth() / 2)

buttonInitialize:setPosition(buttonsXPosition, 10)
buttonShowBanner:setPosition(buttonsXPosition, 60)
buttonShowInterstitial:setPosition(buttonsXPosition, 110)
buttonShowSkippableVideo:setPosition(buttonsXPosition, 160)
buttonShowInterstitialOrVideo:setPosition(buttonsXPosition, 210)
buttonShowRewardedVideo:setPosition(buttonsXPosition, 260)
buttonHideBanner:setPosition(buttonsXPosition, 310)

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
		smartBanners: enable or disable smart banners
		disableNetworks: all parameters after bannersAnimation will be recognized as disabled networks list
		]]--
		appodeal:setKey("fee50c333ff3825fd6ad6d38cff78154de3025546d47a84f", bit.bor(SKIPPABLE_VIDEO, INTERSTITIAL, BANNER, REWARDED_VIDEO), "f", "false")
		appodeal:loadAd(SKIPPABLE_VIDEO)
		appodeal:loadAd(REWARDED_VIDEO)
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
buttonShowSkippableVideo:addEventListener("click", 
	function() 
		appodeal:showAd(SKIPPABLE_VIDEO)
	end)
buttonShowRewardedVideo:addEventListener("click", 
	function() 
		appodeal:showAd(REWARDED_VIDEO)
	end)
buttonShowInterstitialOrVideo:addEventListener("click", 
	function() 
		appodeal:showAd(bit.bor(SKIPPABLE_VIDEO, INTERSTITIAL))
	end)
buttonHideBanner:addEventListener("click", 
	function() 
		appodeal:hideAd(BANNER)
	end)

application:setBackgroundColor(0xef3326)
stage:addChild(buttonInitialize)
stage:addChild(buttonShowBanner)
stage:addChild(buttonShowInterstitial)
stage:addChild(buttonShowSkippableVideo)
stage:addChild(buttonShowInterstitialOrVideo)
stage:addChild(buttonShowRewardedVideo)
stage:addChild(buttonHideBanner)