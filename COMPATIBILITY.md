# iOS compatibility notes for XIT VIREX

The iOS minimum deployment target is set to **iOS 17.0** in this Podfile.
That means the app can be built for iOS 17 and later (including iOS 18, 26,
and 27), assuming the specific iPhone supports that OS version and the app's
dependencies continue to support iOS 17.

After generating the Flutter iOS runner with Flutter, confirm in Xcode:
Runner > Build Settings > iOS Deployment Target = 17.0
Also confirm each Runner configuration (Debug, Profile, Release) uses 17.0.

Flutter builds for iOS require macOS and Xcode. The project source can be
prepared on other systems, but a signed iOS IPA/App Store/TestFlight build
must be performed on a Mac.

This starter's key activation is UI-only until an API/backend is added.
