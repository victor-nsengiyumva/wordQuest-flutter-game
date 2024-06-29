# WordQuest App

![Static Badge](https://img.shields.io/badge/Made%20with%20-%20Flutter%20-blue?style=for-the-badge)

WordGame

## :sparkles: App Features

- Authentication
- simple word game

## How to run the application
1. **Clone the repository**

   ```bash
   git clone https://github.com/victor-nsengiyumva/wordQuest-flutter-game
   cd wordquest   

2. Get dependencies

    ```bash
    flutter pub get

 3. run the app
   
    ```bash
    flutter run

## Issues encountered during development
I encountered an authentication error when connecting my Flutter app to Firebase. The app failed to authenticate users despite correct API key configuration.

### Solutions to the issue
   1. **Identifying the Issue**: Checked Firebase console for error logs, which pointed to a misconfigured OAuth client ID.
   2. **Research**: Reviewed Firebase documentation and community forums for similar issues.
   3. **Troubleshooting Steps**: Updated OAuth client ID in Firebase console to match the one in my app’s configuration files.
   4. **Solution**: Successfully authenticated users after ensuring all credentials matched across Firebase and app settings.

    
## :iphone: Screens

Login | Sign up | Home Screen |
:------------:|:-----------:|:--------------:|
![](./app_ui_images/login.jpg) | ![](./app_ui_images/signup.jpg) | ![](./app_ui_images/homeScreen.jpg) |
Game Screen | Correct Response | Wrong Response |
![](./app_ui_images/game_screen.jpg) | ![](./app_ui_images/correct.jpg) | ![](./app_ui_images/incorrect.jpg) |
Reset score & Logout |
![](./app_ui_images/Capture.jpg)

## 🚀 Technologies
- Flutter 3.19.3
- Dart 3.3.1
- Firebase 
