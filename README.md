# Bamboo

Utilies that makes it easy and fast to build adaptive apps for mobile, web and beyond with Flutter

<p>&nbsp;</p>

## Getting started

  
In the `pubspec.yaml` of your flutter project, add the following dependency:

```dart
dependencies:
  ...
  bamboo: <latest_version>
```

In your library add the following import:

```dart
import 'package:bamboo/bamboo.dart';
```

Wrap your MaterialApp or root widget with our inherited widget.
You can define your own breakpoint using our inherited widget.
```dart
    BambooBreakPoint(
      mobile: 500,
      child: MaterialApp(
        ....
    ),
   )
```


<p>&nbsp;</p>

# Features 📝
> Bamboo required you to set a value for mobile breakpoint. If you don't set tht value for the others, it would automatically use the mobile as defualt for all the available breakpoint (desktop, tablet, large). 

<p>&nbsp;</p>

## Bamboo Value
A class that allow you to set widgets based on breakpoint. It can be use in most case, where ever you want to have an adaptive value.
```dart
    Container(
        child: Bamboo.value(
            context: context,
            mobile: const FlutterLogo(),
            tablet: const Text("data"),
        ),
    ),
```

<p>&nbsp;</p>

## Bamboo number
Works just like `Bamboo Value` but this goes with eveyrthing numbers. It allows you to specify the unit you would like to use, and all the math wis done at the background. Currently, we support only, `p`, `vmin`, `vmax`, `vw`, `vh`,`px`.

```dart
    Container(
      height: Bamboo.number(
        context: context,
        mobile: 20,
        tablet: 50,
        unit: Unit.vh,
     ),
    ),
```

<p>&nbsp;</p>

## BambooWidget
Responsive widget that allow you to define widget based on the current brealpoint. When you don't set breakpoint for desktop, tablet and large, it would automatically use mobile breakpoint.
```dart
   BambooWidget(
     mobile: Container(),
     tablet: const Text(''),
     desktop: const FlutterLogo(),
  )
```

##  BambooImage
BambooImage image allow you to specify mutilple Image path which shows based on the current breakpoint.

```dart
    BambooImage(
        builder: (BuildContext context, imagePath) {
            return Image.asset(imagePath);
        },
        mobile: 'assets/images/logo2x.png',
        tablet: 'assets/images/logo3x.png',
        desktop: 'assets/images/logo4x.png',
    )
```

<p>&nbsp;</p>

## BambooHidden
BambooHidden hide/display specify widget based on the current breakpoint.

```dart
    const BambooHidden(
        desktop: true,
        tablet: false,
        mobile: false,
        large: false,
        child: Text(''),
     ),
```


<p>&nbsp;</p>

## BambooOrientation
Orientation describe the positioning or overall layout of an item related to other items. BambooOrientation provides you with the common orientations found in some software applications, thus  Portrait and Landscape.
```dart
  // Display a widget based on the current Orientation
  const BambooOrientation(
     portrait: Text('Hello Bamboo'),
     landscape: FlutterLogo()
    )
```

<p>&nbsp;</p>

## Mode
Mode is class that allow you to set widget based on the current mode, either black or white. It is into two form, `Mode.all()` this only you to set one value but it applies for both theme. `Mode.only()` this only you to set either for light or dark

```dart
   /// Mode.only()
   Container(
     child: Mode.only(
         context: context,
         dark: const FlutterLogo(),
         light: const Text(''),
      ),
    ),

    /// Mode.all()
   Container(
     child: Mode.all(
         context: context,
         value: const FlutterLogo(),
      ),
    ),
```
<p>&nbsp;</p>

# Extensions 📍
Extension methods add functionality to existing libraries. Since we use some extensions initially we made our mind to share those with you to. Below are all the extension you can access. We are trying hard to add more.

```dart
  /// Returns the current orientation, either portrait or lanscape
  context.orientation

  /// Returns true if the screen is currently in the portrait mode, else false
  context.isPortrait

  /// Returns false if the screen is currently in the landscape mode, else false
  context.isLandscape
 
  /// Returns the current width
  context.width

  /// Returns the current height
  context.height

   /// Returns true if the current theme mode is dark.
   context.isDark

   /// Returns true if the current theme mode is light
   context.isLight
```

<p>&nbsp;</p>

## Known Issues 🧪

No known issues so far.


<p>&nbsp;</p>

## Contributing ⚙️

*   Fix a bug
*   Write and improve some **documentation**. Documentation is very critical to us. We would appreciate help in adding multiple languages to our docs.
*   If you are a developer, feel free to check out the source and submit pull requests.
*   Dig into CONTRIBUTING.MD, which covers submitting bugs, requesting new features, preparing your code for a pull request, etc.
*   Please don't forget to **like**, **follow**, and **star our repo**!

<p>&nbsp;</p>

### Show some ❤️ and star the repo