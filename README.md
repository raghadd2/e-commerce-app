# base_project
RUN COMMANDS TO RENAME APP NAME AND BUNDLE AND CHANGE APP ICON

# FIRST
```
flutter pub global activate rename
```
# SECOND
```
rename setAppName --targets ios,android --value "YourAppName"
```
# THIRD
```
rename setBundleId --targets android --value "com.example.bundleId"
```

# GET APP NAME AND BUNDLE
```
rename getAppName --targets ios

rename getBundleId --targets android
```
# CHANGE APP ICON
only change the image in assets/icons/app_icon.png then run
```
flutter pub get
flutter pub run flutter_launcher_icons
```
