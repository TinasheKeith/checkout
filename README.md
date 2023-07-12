# Checkout App - Credit card validator

Checkout App is a cross-platform credit card validation application built in flutter for android, iOS and the web (more on that in a bit 😅)

## Project Scope and limitations

Who said ReadMe's can't have forewords? 😅

After reading the project requirements, I knew the direction that I would take this challenge:

1. I wanted to use this as an opportunity to demonstrate, and also learn some of the cool knew Dart language features and Flutter 3 features (Enhanced Enums are my fave! 💙)
2. This was a small enough project that it would be a great opportunity to try and deliver it on web as well, but in doing so, I didn't want to target web for the sakes of targetting web, but could also demonstrate how a QA testing pipeline could work for a flutter app that is truely cross platform. What this lead to was learning about DevicePreview, which allows testers and developers during development or QA to test the app under different conditions without physically having to test on different devices etc, and realised there is an opportunity to use this as well as different build environments to have a dev version deployment that testers could use for device previews, and then a staging deployment without it. Which lead to 3
3. A deployment pipeline across the platforms I'm supporting (sheesh)
4. I've recently come to understand how Flutter's intended theming works for setting global themes across the app without having to repeat styling, or having a dedication version of the widget for your app and this was going to demonstate that too

In my naïvity I didn't realise how much the scope had expanded by this point 

In my defence, the instructions did say have fun!

These decisions early in the project did have an impact on the ease of delivering some of the features expected in the requirements. The biggest hurdle being data persistence that also works on the web 🤦🏾‍♂️

Checkout initially used IsarDB. I hadn't heard of it before to be honest. I was initially going with HiveDB, which I have used once before, but Isar was by the same creator and claimed to support web and had a really cool debugging inspector that I thought could really be a godsend for future projects and was keen to try it out. Isar is fantastic to work with, easy to set up and the inspector UI was amazing! You can even listen to your stored collection easily and just update your view when your collection changes with a streambuilder (godsend!) but after I'd already finished and had been testing on moile, I'd come to discover a javascript error that was failing the build... hmmm 🤨 that's suspicious. I eventually stumbled onto this GitHub thread [https://github.com/isar/isar/issues/686] where it was basically concluded that although it says it supports web, Isar does not support web yet.

With a few hours until the app was due, I figured the easiest course would be to do away with Isar and just serialise the card objects and store them in shared preferences, although admittedly I'd entertained this, there are some commits that would suggest there was a full implementation of sharedPreferences as the persistence layer before I added HiveDB, but that is Git's word against mine and I say that did not happen! (it did 😅) Either way, the final app persists cards to HiveDB.

Dev:
[https://checkout-dev-a0249.web.app/#/]

Staging:
[https://checkout-staging-d836d.web.app]

## Setup

### To run the project locally, follow these steps:

Clone the repository:
```bash
git clone https://github.com/TinasheKeith/checkout.git
```

1. Install Flutter and Dart if you haven't already. For instructions, see the Flutter installation guide.
2. In the project root, create a .vscode foler, in which you can include a launch.json with the app configurations for dev, staging and prod:
```json
{
    "version": "0.2.0",
    "configurations": [
      {
        "name": "Development",
        "program": "lib/main_dev.dart",
        "request": "launch",
        "type": "dart",
        "args": [
            "--dart-define=FLAVOR=development",
            "--dart-define",
            "sentry-dsn=https://e20157210f3d448eb61748c76fdd8581@o4505472229179392.ingest.sentry.io/4505472298516480",
        ],
      },
      {
        "name": "Staging",
        "program": "lib/main_stg.dart",
        "request": "launch",
        "type": "dart",
        "args": [
            "--dart-define=FLAVOR=staging",
            "--dart-define",
            "sentry-dsn=https://e20157210f3d448eb61748c76fdd8581@o4505472229179392.ingest.sentry.io/4505472298516480",
        ],
      },
      {
        "name": "Production",
        "program": "lib/main.dart",
        "request": "launch",
        "type": "dart",
        "args": [
            "--dart-define=FLAVOR=production",
            "--dart-define",
            "sentry-dsn=https://e20157210f3d448eb61748c76fdd8581@o4505472229179392.ingest.sentry.io/4505472298516480",
        ],
      }
    ]
  }
```

3. From the project root, run the following command to install the required dependencies:
```bash
flutter pub get
```

7. That is it! Launch the app with one of the environment configurations; dev, staging, or prod.

## Features

### CheckoutApp provides the following features:
* Validate credit cards, CheckoutApp will validate cards and reveal the transaction provider from the card number
* Checkout App is cross platforms and adapts to every environment, even the web! 
* For testers, Checkouts app is Previewable, and runnable on any device/form-factor and can be tested


### Convensions
* This project was built using flutter skeleton template, which was introduced in flutter 2.5 [https://www.youtube.com/watch?v=Yy4NgbqNNtY] which already had a few goodies baked in such as localisations (which Ironically, I could not get working [https://github.com/flutter/flutter/issues/99741]) and then ultimately decided to code the raw strings into the Text widgets etc, which is less than ideal.

* For linting, I chose to go with VeryGoodAnalysis [https://verygood.ventures/blog/introducing-very-good-analysis], built and maintained by the very well known VeryGoodVentures. 

* For routing, I went with GoRouter instead of using Flutter's own Navigator 2.0. But GoRouter is maintained by the flutter community and is really well supported. The reason I felt it necessary was that I needed an easy way to have control over that url in the browser so that all the screens have dedicated, and shareable paths.

### Improvement areas
There are plenty of areas where I feel this project needs work:
1. The CI/CD pipeline is really just to deploy the app, in the realworld, the actions would be broken out and reused where it makes sense
2. There is no testing 🤦🏾‍♂️🤦🏾‍♂️
3. 
4. Spent too much time focused on how things are presented in the actual app, which could have been focused instead on improvement areas 1 and 2 instead. There was even a version of this app with a bottom nav at the beginning
5. Generally spent time quite a bit of time on features that were eventually omitted

### Contributing
Contributions to this project are welcome. If you find a bug or would like to suggest a new feature, or you might want to try your hand at any of the above issues, 🤪 please submit a pull request :)