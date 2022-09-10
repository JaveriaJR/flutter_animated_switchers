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


[Click here for more Example](https://pub.dev/packages/flutter_animated_switchers/example)
 
## Example Images:
 
<video width="190"  autoplay>
  <source src="https://github.com/JaveriaJR/flutter_animated_switchers/blob/main/styleone.mp4?raw=true" type="video/mp4"> 
Your browser does not support the video tag.
</video>

 <img src="https://github.com/JaveriaJR/flutter_animated_switchers/blob/main/styleone.mp4?raw=true" width="180" />  <img src="https://github.com/JaveriaJR/flutter_animated_switchers/blob/main/styletwo.mp4?raw=true" width="180" />  <img src="https://github.com/JaveriaJR/flutter_animated_switchers/blob/main/stylethree.mp4?raw=true" width="180" />  <img src="https://imgur.com/5Yu89Sb.png" width="180" />  <img src="https://imgur.com/Vh6Uf0N.png" width="180" />
 


Created by [Javeria Iffat](https://www.linkedin.com/in/javeria-iffat/)


## FAQ

In case you need: to add new feature or you get any error or any help, please contact me at javeriaiffat312@gmail.com or javeria.iffat@lums.edu.pk
please be kind if you get any errors, text me I'll be more than happy to help you all.

THANK YOU!