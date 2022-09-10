Flutter package for animated switchers in your flutter application

## How to Use
To use flutter_animated_switchers, follow the following steps:

### Step1: Adding plugin dependency
- add the plugin to your pubspec.yaml file:

```yaml
flutter_animated_switchers: [latest_version]
```

### Step2: Importing the package.
- import the plugin in [your_file].dart

```dart
import 'package:flutter_animated_switchers/flutter_animated_switchers.dart';
```

### Step3: Call the switcher of your desired Switcher Type
 
```dart
const FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleOne,
),
```
 
### Step6: Listen to state changes  
- you can also listen to state changes from the following two states:

| STATE               |          DESCRIPTION                     |  DATA TYPE / FORMAT |
| :---                |           :----                          |   :---- |
| State On            |  When the switcher is turned on          |  bool: true |
| State Off           |  When the switcher is turned off         | bool: false | 

```dart
FlutterAnimatedSwitcher(
              switcherType: SwitcherType.styleFive,
              onTap: (() { 
                print("Tapped");
              }),
              onStateChanged: ((state) { 
                print("current state is $state");
              }),
)
```

## Example Images:
- Example Gif/Mp4 files for review are as below: (wait while its loading)

 
https://user-images.githubusercontent.com/112107681/189474932-f2b5a8f5-02a3-4a62-9a16-04aacfa9a3a5.mp4 

https://user-images.githubusercontent.com/112107681/189474936-f5477589-750a-45b0-a1eb-3ce0766a1c1c.mp4

https://user-images.githubusercontent.com/112107681/189474917-26865164-572f-4437-9db7-3bb9014e3b11.mp4

https://user-images.githubusercontent.com/112107681/189474953-1e52225e-449f-4651-b2ba-8edd536c11f0.mp4

https://user-images.githubusercontent.com/112107681/189474954-a9cf0ccb-857f-4273-b89a-03f2e7c500ad.mp4 



## Important URL

- [PUBDEV URL](https://pub.dev/packages/flutter_animated_switchers)

- [GITHUB URL](https://github.com/JaveriaJR/flutter_animated_switchers/tree/main/example)


## FAQ

In case you need: to add new feature or you get any error or any help, please contact me at javeriaiffat312@gmail.com or javeria.iffat@lums.edu.pk
please be kind if you get any errors, text me I'll be more than happy to help you all.

THANK YOU!
