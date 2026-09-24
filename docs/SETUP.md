# Setup

```bash
flutter pub get
flutterfire configure
flutter run --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_...
```

Add the Google Maps API key to `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift`. Enable Firestore and Authentication in Firebase.

Checks: `flutter analyze`, `flutter test`.
