# Bamboo

Utilities that make it easy and fast to build adaptive apps for mobile, web, and beyond with Flutter.

![Bamboo](https://user-images.githubusercontent.com/36260221/205433724-5c04c706-2a35-4fd5-b4a6-3b5e40f71a03.svg)


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

Wrap your MaterialApp or root widget with our inherited widget. By default we have a default breakpoint but you can define your own breakpoint using our inherited widget.

```dart
    BambooBreakPoint(
      mobile: 500,
      child: MaterialApp(
        ....
    ),
   )
```


# Features 📝
> Bamboo requires you to set a value for the mobile breakpoint. If you don't provide values for the others, it will automatically use the mobile as default for all the available breakpoints (desktop, tablet, large). 


## Bamboo Value
A class that allows you to set widgets based on the breakpoint. You can use it in most cases, where ever you want to have an adaptive value.

```dart
    Container(
        child: Bamboo.value(
            context: context,
            mobile: const FlutterLogo(),
            tablet: const Text("data"),
        ),
    ),
```


## Bamboo number
It works just like `Bamboo Value` but this goes with everything numbers. It allows you to specify the unit you would like to use. Currently, we support only, `p`, `vmin`, `vmax`, `vw`, `vh`, and `px`.

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


## BambooWidget
A responsive widget that allows you to define widgets based on the current breakpoint. When you don't set the breakpoint for desktop, tablet, and large, it will automatically use the mobile breakpoint.

```dart
   BambooWidget(
     mobile: Container(),
     tablet: const Text(''),
     desktop: const FlutterLogo(),
  )
```

##  BambooImage
BambooImage image allows you to specify multiple Image path which shows based on the current breakpoint.

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



## BambooOrientation
Orientation describes the positioning or overall layout of an item related to other items. BambooOrientation provides you with the common orientations found in most software applications, thus Portrait and Landscape.

```dart
  // Display a widget based on the current Orientation
  const BambooOrientation(
     portrait: Text('Hello Bamboo'),
     landscape: FlutterLogo()
    )
```

## Mode
Mode is a class that allows you to set widgets based on the current mode, either black or white. It is in two forms, `Mode.all()` this allow you to set one value which applies to both themes. `Mode.only()` this allow you to set either for light or dark.

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

# Extensions 📍
Extension methods add functionality to existing libraries. Since we use some extensions initially we made up our minds to share those with you too. Below is all the extension you can access. We are trying hard to add more.

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



## Known Issues 🧪

No known issues so far.




## Contributing ⚙️

*   Fix a bug
*   Write and improve some **documentation**. Documentation is very critical to us. We would appreciate help in adding multiple languages to our docs.
*   If you are a developer, feel free to check out the source and submit pull requests.
*   Dig into CONTRIBUTING.MD, which covers submitting bugs, requesting new features, preparing your code for a pull request, etc.
*   Please don't forget to **like**, **follow**, and **star our repo**!



### Show some ❤️ and star the repo
