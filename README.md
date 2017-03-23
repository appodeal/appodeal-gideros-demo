# Appodeal Gideros Plugin

[![](https://img.shields.io/badge/docs-android-green.svg)](https://www.appodeal.com/sdk/documentation?framework=6&full=1&platform=1)
[![](https://img.shields.io/badge/docs-ios-grey.svg)](https://www.appodeal.com/sdk/documentation?framework=6&full=1&platform=4)
[![](https://img.shields.io/badge/download-crossplatform-red.svg)](https://s3-us-west-1.amazonaws.com/appodeal-gideros/Appodeal-Gideros-220317-2.0.0.zip)
[![](https://img.shields.io/badge/download-android-green.svg)](https://s3-us-west-1.amazonaws.com/appodeal-gideros/Appodeal-Gideros-Android-220317-2.0.0.zip)

## Configuration

+ Choose `Full Export` for the first export. 
+ Press `Select Plugins` in export menu, check `Ads` and `Bitop` pluigns. 
+ Export project.
+ Download and unzip plugin archive, then follow next instructions for selected platform.

### Android Configuration

+ place `Appodeal` folder and `cheetah-mobile-3.4.7.aar` from `ads/source/Android/libs` to your libs folder.
+ place `AdsAppodeal.java` file from `ads/source/Android/src/com/giderosmobile/android/plugins/ads/frameworks` folder to your `com/giderosmobile/android/plugins/ads/frameworks` folder.
+ open build.gradle for your app and add there following lines below `//TAG-DEPENDENCIES//`:
```
    compile fileTree(include: ['*.jar'], dir: 'libs/Appodeal')
    compile(name: 'cheetah-mobile-3.4.7', ext: 'aar')
```
+ if you don't have Google Play Services in your project please add `ads` and `location` modules, for example:
```
    compile 'com.google.android.gms:play-services-ads:9.8.0'
    compile 'com.google.android.gms:play-services-location:9.8.0'
```
+ add following permissions to your `AndroidManifest.xml` under manifest tag:
```
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```
+ add following to your `AndroidManifest.xml` under application tag below `<!-- TAG:APPLICATION-EXTRA -->`:
```
        <meta-data android:name="com.appodeal.framework" android:value="gideros" />
        <receiver android:name="com.appodeal.ads.AppodealPackageAddedReceiver" android:exported="true" android:enabled="true">
            <intent-filter>
                <action android:name="android.intent.action.PACKAGE_ADDED" />
                <data android:scheme="package" />
            </intent-filter>
        </receiver>

        <activity android:name="com.appodeal.ads.InterstitialActivity"
            android:configChanges="orientation|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar" />
        <activity android:name="com.appodeal.ads.VideoActivity"
            android:configChanges="orientation|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar" />

        <activity android:name="com.appodeal.ads.LoaderActivity"
            android:configChanges="orientation|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar" />

        <meta-data android:name="com.google.android.gms.version" android:value="@integer/google_play_services_version" />

        <activity android:name="com.google.android.gms.ads.AdActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"
            android:theme="@android:style/Theme.Translucent" />

        <activity android:name="com.chartboost.sdk.CBImpressionActivity" android:excludeFromRecents="true"
            android:hardwareAccelerated="true" android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen"
            android:configChanges="keyboardHidden|orientation|screenSize" />

        <activity android:name="com.applovin.adview.AppLovinInterstitialActivity"
            android:theme="@android:style/Theme.Translucent" />

        <activity android:name="com.mopub.mobileads.MoPubActivity"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Translucent" />
        <activity android:name="com.mopub.common.MoPubBrowser"
            android:configChanges="keyboardHidden|orientation|screenSize" />
        <activity android:name="com.mopub.mobileads.MraidActivity"
            android:configChanges="keyboardHidden|orientation|screenSize" />
        <activity android:name="com.mopub.mobileads.MraidVideoPlayerActivity"
            android:configChanges="keyboardHidden|orientation|screenSize" />

        <activity android:name="org.nexage.sourcekit.mraid.MRAIDBrowser"
            android:configChanges="orientation|keyboard|keyboardHidden|screenSize"
            android:theme="@android:style/Theme.Translucent" />


        <activity android:name="com.amazon.device.ads.AdActivity" android:configChanges="keyboardHidden|orientation|screenSize"/>

        <activity android:name="com.my.target.ads.MyTargetActivity" android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:hardwareAccelerated="true"/>

        <activity android:name="org.nexage.sourcekit.vast.activity.VASTActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />

        <activity android:name="org.nexage.sourcekit.vast.activity.VPAIDActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />

        <!--suppress AndroidDomInspection -->
        <activity android:name="com.appodeal.ads.networks.vpaid.VPAIDActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />

        <activity android:name="com.appodeal.ads.networks.SpotXActivity"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"/>
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.facebook.ads.InterstitialAdActivity" android:configChanges="keyboardHidden|orientation|screenSize" />

        <activity android:name="com.unity3d.ads.adunit.AdUnitActivity"
            android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" android:hardwareAccelerated="true" />
        <activity android:name="com.unity3d.ads.adunit.AdUnitSoftwareActivity"
            android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" android:hardwareAccelerated="false" />
        <activity android:name="com.unity3d.ads2.adunit.AdUnitActivity"
            android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" android:hardwareAccelerated="true" />
        <activity android:name="com.unity3d.ads2.adunit.AdUnitSoftwareActivity"
            android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen" android:hardwareAccelerated="false" />


        <!--suppress AndroidDomInspection -->
        <activity android:name="com.jirbo.adcolony.AdColonyOverlay"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.jirbo.adcolony.AdColonyFullscreen"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Black.NoTitleBar.Fullscreen" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.jirbo.adcolony.AdColonyBrowser"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.Black.NoTitleBar.Fullscreen" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.vungle.publisher.FullScreenAdActivity"
            android:configChanges="keyboardHidden|orientation|screenSize"
            android:theme="@android:style/Theme.NoTitleBar.Fullscreen"/>
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.startapp.android.publish.list3d.List3DActivity"
            android:theme="@android:style/Theme" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.startapp.android.publish.OverlayActivity"
            android:theme="@android:style/Theme.Translucent"
            android:configChanges="orientation|keyboardHidden|screenSize" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.startapp.android.publish.FullScreenActivity"
            android:theme="@android:style/Theme"
            android:configChanges="orientation|keyboardHidden|screenSize" />
        <service android:name="com.yandex.metrica.MetricaService" android:enabled="true"
            android:exported="true" android:process=":Metrica">
            <intent-filter>
                <category android:name="android.intent.category.DEFAULT" />
                <action android:name="com.yandex.metrica.IMetricaService" />
                <data android:scheme="metrica" />
            </intent-filter>
            <meta-data android:name="metrica:api:level" android:value="52" />
        </service>
        <receiver android:name="com.yandex.metrica.MetricaEventHandler"
            android:enabled="true" android:exported="true">
            <intent-filter>
                <action android:name="com.android.vending.INSTALL_REFERRER" />
            </intent-filter>
        </receiver>
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.yandex.mobile.ads.AdActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" />

        <!--suppress AndroidDomInspection -->
        <activity android:name="com.flurry.android.FlurryFullscreenTakeoverActivity"
            android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" />

        <activity android:name="com.appodeal.ads.VideoPlayerActivity" android:theme="@android:style/Theme.Black.NoTitleBar.Fullscreen"/>

        <!--suppress AndroidDomInspection -->
        <activity android:name="com.revmob.FullscreenActivity" android:theme="@android:style/Theme.Translucent"
            android:configChanges="keyboardHidden|orientation"/>

        <!--suppress AndroidDomInspection -->
        <activity android:name="com.tapjoy.TJAdUnitActivity" android:configChanges="orientation|keyboardHidden|screenSize"
            android:hardwareAccelerated="true" android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.tapjoy.mraid.view.ActionHandler" android:configChanges="orientation|keyboardHidden|screenSize" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.tapjoy.mraid.view.Browser" android:configChanges="orientation|keyboardHidden|screenSize" />
        <!--suppress AndroidDomInspection -->
        <activity android:name="com.tapjoy.TJContentActivity" android:configChanges="orientation|keyboardHidden|screenSize"
            android:theme="@android:style/Theme.Translucent.NoTitleBar" android:hardwareAccelerated="true" />
```
+ build your application.

### iOS Configuration

+ drag and drop `Appodeal.framework` and `Resources` folder to your project, check `Copy if needed` after dropping files.
+ drag and drop `Appodeal.h` and `Appodeal.m` files from `ads/source/iOS/Plugins/Ads/frameworks` to `Plugins/Ads/frameworks` folder of your project, check `Copy if needed` after dropping files.
+ change `Deployment Target` to 8.0
+ add the following keys in your app’s info.plist:
```
    <key>NSAppTransportSecurity</key>
    <dict>
      <key>NSAllowsArbitraryLoads</key>
      <true/>
    </dict>
    <key>NSBluetoothPeripheralUsageDescription</key>
    <string>Advertising</string>
    <key>NSCalendarsUsageDescription</key>
    <string>Advertising</string>
    <key>NSLocationWhenInUseUsageDescription</key>
    <string>Advertising</string>
    <key>NSPhotoLibraryUsageDescription</key>
    <string>Advertising</string>
```

+ add `-ObjC` flag to `Other linker flags` inside `Build Settings` of your project.
+ add following frameworks and libraries to the `Build phases` of your project:
```
    AdSupport
    AudioToolbox
    AVFoundation
    CFNetwork
    CoreBluetooth
    CoreFoundation
    CoreGraphics
    CoreImage
    CoreLocation
    CoreMedia
    CoreMotion
    CoreTelephony
    EventKit
    EventKitUI
    GLKit
    JavaScriptCore
    libc++
    libsqlite3.dylib
    libxml2.2.dylib
    libz.dylib
    MediaPlayer
    MessageUI
    MobileCoreServices
    QuartzCore
    SafariServices
    Security
    Social
    StoreKit
    SystemConfiguration
    Twitter
    UIKit
    WebKit 
```

## Changelog

2.0.0 (22/03/2017)

+ crossplatform interface
+ Appodeal Android SDK updated to 1.15.9
+ Appodeal iOS SDK updated to 1.3.9
+ Android libraries updated
