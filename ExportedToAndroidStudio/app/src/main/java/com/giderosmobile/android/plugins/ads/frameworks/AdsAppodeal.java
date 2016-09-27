package com.giderosmobile.android.plugins.ads.frameworks;

import java.lang.ref.WeakReference;

import android.app.Activity;
import android.util.SparseArray;
import android.view.KeyEvent;

import com.appodeal.ads.Appodeal;
import com.appodeal.ads.BannerCallbacks;
import com.appodeal.ads.InterstitialCallbacks;
import com.appodeal.ads.RewardedVideoCallbacks;
import com.appodeal.ads.SkippableVideoCallbacks;
import com.appodeal.ads.NonSkippableVideoCallbacks;
import com.giderosmobile.android.plugins.ads.*;

public class AdsAppodeal implements AdsInterface {
	
	private WeakReference<Activity> sActivity;
	private String appKey;
	private String adNetwork = null;
	private int adType = 0;
	private boolean autoCache = false;
	private boolean setTrigger = false;
	private boolean smartBanners = true;
	private boolean bigBanners = false;
	private boolean bannerAnimation = true;
	private int bannerHeight = 0;
	private AdsManager mngr;
	static AdsAppodeal me;
	
	public void onCreate(WeakReference<Activity> activity)
	{
		me = this;
		sActivity = activity;
		mngr = new AdsManager();
	}
	
	//on destroy event
	public void onDestroy()
	{	
		mngr.destroy();
	}
	
	public void onStart(){}

	public void onStop(){}
	
	public void onPause(){}
		
	public void onResume(){}
	
	public boolean onKeyUp(int keyCode, KeyEvent event) {
		return false;
	}
	
	public void setKey(final Object parameters){
		final int APP_KEY = 0;
		final int AD_TYPES = 1;
		final int AUTO_CACHE = 2;
		final int TRIGGER_PRECACHE = 3;
		final int SMART_BANNERS = 4;
		final int BANNERS_728x90 = 5;
		final int BANNER_ANIMATION = 6;
		final int DISABLE_NETWORKS = 7;
		SparseArray<String> param = (SparseArray<String>)parameters;
		appKey = param.get(APP_KEY);
		if (param.size() > 1) {
			adType = Integer.valueOf(param.get(AD_TYPES));
		}
		autoCache = getParameter(param, AUTO_CACHE, autoCache);
		setTrigger = getParameter(param, TRIGGER_PRECACHE, setTrigger);
		smartBanners = getParameter(param, SMART_BANNERS, smartBanners);
		bigBanners = getParameter(param, BANNERS_728x90, bigBanners);
		bannerAnimation = getParameter(param, BANNER_ANIMATION, bannerAnimation);
		
		Appodeal.setAutoCache(adType, autoCache);
		Appodeal.setOnLoadedTriggerBoth(adType, setTrigger);
		Appodeal.setSmartBanners(smartBanners);
		Appodeal.set728x90Banners(bigBanners);
		Appodeal.setBannerAnimation(bannerAnimation);
		
		for(int i = DISABLE_NETWORKS; i < param.size(); i++){
			adNetwork = param.get(i);
			Appodeal.disableNetwork(sActivity.get(), adNetwork);
		}
		Appodeal.confirm(Appodeal.SKIPPABLE_VIDEO);
		Appodeal.initialize(sActivity.get(), appKey, adType);
		Appodeal.setInterstitialCallbacks(new InterstitialCallbacks() {
			@Override
			public void onInterstitialShown() {Ads.adDisplayed(this, "interstitial");}
			
			@Override
			public void onInterstitialLoaded(boolean arg0) {Ads.adReceived(this, "interstitial");}
			
			@Override
			public void onInterstitialFailedToLoad() {Ads.adFailed(this, "interstitial", "Failed to receive");}
			
			@Override
			public void onInterstitialClosed() {Ads.adDismissed(this, "interstitial");}
			
			@Override
			public void onInterstitialClicked() {Ads.adActionBegin(this, "interstitial");}
		});
		Appodeal.setSkippableVideoCallbacks(new SkippableVideoCallbacks() {
			@Override
			public void onSkippableVideoShown() {Ads.adDisplayed(this, "skippablevideo");}
			
			@Override
			public void onSkippableVideoLoaded() {Ads.adReceived(this, "skippablevideo");}
			
			@Override
			public void onSkippableVideoFailedToLoad() {Ads.adFailed(this, "skippablevideo", "Failed to receive");}
			
			@Override
			public void onSkippableVideoClosed(boolean finished) {Ads.adDismissed(this, "skippablevideo");}
			
			@Override
			public void onSkippableVideoFinished() {Ads.adActionEnd(this, "skippablevideo");}
		});
		Appodeal.setNonSkippableVideoCallbacks(new NonSkippableVideoCallbacks() {
			@Override
			public void onNonSkippableVideoShown() {Ads.adDisplayed(this, "nonskippable");}

			@Override
			public void onNonSkippableVideoLoaded() {Ads.adReceived(this, "nonskippable");}

			@Override
			public void onNonSkippableVideoFailedToLoad() {Ads.adFailed(this, "nonskippable", "Failed to receive");}

			@Override
			public void onNonSkippableVideoClosed(boolean finished) {Ads.adDismissed(this, "nonskippable");}

			@Override
			public void onNonSkippableVideoFinished() {Ads.adActionEnd(this, "nonskippable");}
		});
		Appodeal.setBannerCallbacks(new BannerCallbacks() {
			
			@Override
			public void onBannerShown() {Ads.adDisplayed(this, "banner");}
			
			@Override
			public void onBannerLoaded(int height, boolean precache) {
				Ads.adReceived(this, "banner");
				bannerHeight = height;
			}
			
			@Override
			public void onBannerFailedToLoad() {Ads.adFailed(this, "banner", "Failed to receive");}
			
			@Override
			public void onBannerClicked() {Ads.adActionBegin(this, "banner");}
		});
		Appodeal.setRewardedVideoCallbacks(new RewardedVideoCallbacks() {
			@Override
			public void onRewardedVideoShown() {Ads.adDisplayed(this, "rewarded");}
			
			@Override
			public void onRewardedVideoLoaded() {Ads.adReceived(this, "rewarded");}
			
			@Override
			public void onRewardedVideoFailedToLoad() {Ads.adFailed(this, "rewarded", "Failed to receive");}
			
			@Override
			public void onRewardedVideoClosed(boolean finished) {Ads.adDismissed(this, "rewarded");}
			
			@Override
			public void onRewardedVideoFinished(int amount, String name) {Ads.adActionEnd(this, "rewarded");}
		});
	}
	
	public void loadAd(final Object parameters){
		SparseArray<String> param = (SparseArray<String>)parameters;
		int adType = Integer.valueOf(param.get(0));
		Appodeal.cache(sActivity.get(), adType);
	}
	
	public void showAd(final Object parameters)
	{
		SparseArray<String> param = (SparseArray<String>)parameters;
		int adType = Integer.valueOf(param.get(0));
		String placement = param.get(1);
		if(placement == null)
			Appodeal.show(sActivity.get(), adType);
		else
			Appodeal.show(sActivity.get(), adType, placement);
	}
	
	public void hideAd(String type) {
		int adType = Integer.valueOf(type);
		Appodeal.hide(sActivity.get(), adType);
	}
	
	public int getWidth(){
		return 0;
	}
	
	public int getHeight(){
		return bannerHeight;
	}

	@Override
	public void enableTesting() {
		Appodeal.setTesting(true);
	}
	
	private boolean getParameter(SparseArray<String> param, int parameterNumber, boolean defaultValue){
		return (param.get(parameterNumber) == null) ? defaultValue : Boolean.valueOf(param.get(parameterNumber));
	}
	
}
