# githublogin

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

pub global activate flutterfire_cli
curl -sL https://firebase.tools | bash
Password:
-- Checking for existing firebase-tools on PATH...
Your machine has firebase-tools@12.7.0 installed.
If you would like to upgrade your install run: curl -sL firebase.tools | upgrade=true bash
rajkumar@rajs-Mac-mini unicahealthcare % firebase login
Already logged in as raj30kumar19@gmail.com
rajkumar@rajs-Mac-mini unicahealthcare % flutterfire configure
i Found 5 Firebase projects.                                                                                                                                                                                                          
✔ Select a Firebase project to configure your Flutter application with · fir-fluttertest-9980d (firebasefluttertest)                                                                                                                  
✔ Which platforms should your configuration support (use arrow keys & space to select)? · android, ios                                                                                                                                
i Firebase android app com.Aura.UnicaHealthpatient is not registered on Firebase project fir-fluttertest-9980d.                                                                                                                       
FirebaseCommandException: An error occured on the Firebase CLI when attempting to run a command.
COMMAND: firebase apps:list android --json --project=fir-fluttertest-9980d
ERROR: Failed to list Firebase ANDROID apps. See firebase-debug.log for more info.
rajkumar@rajs-Mac-mini unicahealthcare % flutterfire configure
i Found 5 Firebase projects.                                                                                                                                                                                                          
✔ Select a Firebase project to configure your Flutter application with · <create a new project>                                                                                                                                       
✔ Enter a project id for your new Firebase project (e.g. my-cool-project) · unica-healthcare                                                                                                                                          
i New Firebase project unica-healthcare created successfully.                                                                                                                                                                         
✔ Which platforms should your configuration support (use arrow keys & space to select)? · android, ios                                                                                                                                
i Firebase android app com.Aura.UnicaHealthpatient is not registered on Firebase project unica-healthcare.                                                                                                                            
i Registered a new Firebase android app on Firebase project unica-healthcare.                                                                                                                                                         
i Firebase ios app com.Aura.UnicaHealthpatient is not registered on Firebase project unica-healthcare.                                                                                                                                
i Registered a new Firebase ios app on Firebase project unica-healthcare.                                                                                                                                                             
✔ The google-services.json file already exists but for a different Firebase project (fir-fluttertest-9980d). Do you want to replace it with Firebase project unica-healthcare? · yes                                                  
✔ Generated FirebaseOptions file lib/firebase_options.dart already exists, do you want to override it? · yes                                                                                                                          
✔ Generated FirebaseAppID file /Users/rajkumar/Documents/Mobile App Development/istudio/unicahealthcare/ios/firebase_app_id_file.json already exists, do you want to override it? · yes

Firebase configuration file lib/firebase_options.dart generated successfully with the following Firebase apps:


flutter version for this project
Flutter 3.13.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 12fccda598 (8 weeks ago) • 2023-09-19 13:56:11 -0700
Engine • revision bd986c5ed2
Tools • Dart 3.1.2 • DevTools 2.25.0
