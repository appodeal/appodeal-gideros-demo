# appodeal-gideros-demo

1) Install Gideros http://giderosmobile.com/   
2) Export project to the Android Studio project 
3) Open the exported project    
4) Add gideros plugin http://www.appodeal.com/sdk/documentation?framework=6&full=1&platform=1#p_2    
Put all jar files files into your src\main\java folder, jar files into src\main\libs folder, *.so files into src\main\jniLibs.

   Add following lines to build.gradle dependencies section:
   ```
   compile 'com.google.android.gms:play-services-ads:9.6.1'

   compile 'com.google.android.gms:play-services-location:9.6.1'
   ```
5) Add System.loadLibrary("ads") to the main activity and "com.giderosmobile.android.plugins.ads.Ads" to external classes.
6) Modify Android manifest as described here: http://www.appodeal.com/sdk/documentation?framework=6&full=1&platform=1#p_3     
6) Run project   

In "ExportedToAndroidStudio" folder you can find ready-to-build Android Studio project