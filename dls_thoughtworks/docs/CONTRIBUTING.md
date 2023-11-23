[//]: # (TODO: Update the name of your DLS library)
# Contributing to dls_thoughtworks

[//]: # (TODO: Update the name of your DLS library)
Welcome to the contributing guide for the dls_thoughtworks. This document serves as a collection
of conventions specific to this project which contributors might useful.

## Pre-requisites

### Environment setup

The project has the following system requirements
- JDK 11 (you can install it from [azul downloads])
- Latest stable version of [Android Studio]
- Flutter SDK. Check [here](https://docs.flutter.dev/get-started/install/macos)

### Test run

Run the Playground app from your IDE on an emulator or on real device. This will ensure your setup
is functioning properly. Check how to run playground app in [Getting Started] guide.

### Git hooks

To enable [git hooks] for this repository on your local machine, please run the following command
at the project folder.
```shell
.githooks/install-githooks
```

## Building & running the project

1. To build the DLS library, run the following commands on root of the project.
```shell
flutter clean
flutter pub get
```

2. Dart entry point is not needed for DLS library, hence we only need to run Playground app:
```shell
flutter pub get playground
flutter run playgorund/lib/main.dart
```

## Tooling

### Enforcing a consistent code style

The Dart sdk allows us to format all dart files in the project which follows consistent 
[dart style guide]. To format your project dart files run:
```shell
dart format .
```

### Dependency lock

The `pubspec.lock` of the DLS library is not checked into git. Since, regenerating `pubspec.lock`
allows testing the library with the latest version of its dependencies. 
More on not committing [pubspec.lock of library packages].

The `pubspec.lock` of Playground app is checked into git.

## Releasing

Releasing the library is done by creating & pushing tags on the [GitHub repository].

See [RELEASING.md].

[azul downloads]: https://www.azul.com/downloads/
[Android Studio]: https://developer.android.com/studio
[git hooks]: https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks
[dart style guide]: https://dart.dev/guides/language/effective-dart/style#formatting
[pubspec.lock of library packages]: https://dart.dev/guides/libraries/private-files#pubspeclock
[//]: # (TODO: Update the link to your github respository)
[GitHub repository]: https://github.com/obvious/dls-starter-flutter
[Getting Started]: GETTING_STARTED.md
[RELEASING.md]: RELEASING.md
