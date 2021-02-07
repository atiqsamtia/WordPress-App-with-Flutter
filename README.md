# WordPress App with Flutter

> IOS/Android Native App for WordPress Website/Blog built using Flutter. **No additional Plugins required for WordPress**.

> Built for DevFest Lahore 2019 Workshop

![](ScreenShot.jpg)

## Demo

[![Download 64Bit](https://img.shields.io/badge/Download%20APK-64%20bit-brightgreen)](https://github.com/atiqsamtia/WordPress-App-with-Flutter/releases/latest/download/app-arm64-v8a-release.apk)
[![Download 64Bit](https://img.shields.io/badge/Download%20APK-32%20bit-brightgreen)](https://github.com/atiqsamtia/WordPress-App-with-Flutter/releases/latest/download/app-armeabi-v7a-release.apk)

![](Demo.gif)

## Prerequisites
These are he requirements to run this App
- Flutter Version 1.9 or later  
- WordPress 4.7 or later

## Getting Started
clone this repo
```
git clone https://github.com/atiqsamtia/WordPress-App-with-Flutter.git wordpress_flutter
```
Change <code>TITLE</code> and <code>URL</code> according to your website in <code>lib/config.dart</code> file.

Update dependencies 
```
flutter packages get
```

Run App with this command
```
flutter run
```

It is that simple.

## Features
- [x] Latest Posts
- [x] Featured Posts
- [x] Single Category Posts List Page
- [x] Infinite Scroll with pagination
- [x] Post Detail Page
- [x] Top 15 Categories in Tab
- [x] Fade Image with Placeholder
- [x] Cached Network Image
- [x] RTL support for language like Arabic, Urdu, Hebrew etc
- [ ] Connectivity status, if offline pop a message
- [ ] Pull to refresh
- [ ] Setting page
- [ ] Related Posts on Post Detail Page
- [ ] OneSignal integration for Push Notifications
- [ ] Splash screen 
- [ ] Share and fav buttons 

## Meta

Atiq Samtia– [@AtiqSamtia](https://twitter.com/atiqsamtia) – me@atiqsamtia.com

Distributed under the GPL3 license.

[https://github.com/atiqsamtia/WordPress-App-with-Flutter](https://github.com/atiqsamtia/WordPress-App-with-Flutter)

## Contributing

1. Fork it (<https://github.com/atiqsamtia/WordPress-App-with-Flutter/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request
