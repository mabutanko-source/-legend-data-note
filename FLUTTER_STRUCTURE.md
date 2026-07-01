# Flutter App Structure

## Directory Layout

```
flutter_app/
├── lib/
│   ├── main.dart                 # App entry point
│   ├── config/
│   │   └── api_config.dart       # API configuration
│   ├── screens/
│   │   ├── login_screen.dart     # Login UI
│   │   └── home_screen.dart      # Dashboard
│   └── services/
│       └── api_service.dart      # API communication
├── assets/
│   ├── images/                   # App images
│   ├── icons/                    # App icons
│   └── fonts/                    # Custom fonts
├── pubspec.yaml                  # Dependencies
└── android/                      # Android configuration
```

## Key Dependencies

- **http:** For API calls
- **provider:** State management
- **shared_preferences:** Local storage
- **intl:** Internationalization

## Main Features

### 1. SplashScreen (main.dart)
- Displays for 2 seconds on app start
- Navigates to LoginScreen

### 2. LoginScreen (screens/login_screen.dart)
- Email and password input
- Form validation
- API integration with backend
- Error handling

### 3. HomeScreen (screens/home_screen.dart)
- Wallet balance display
- Service cards (Data, Airtime, Bills, Pin Codes)
- Recent transactions
- Bottom navigation

## API Integration

All API calls go through `ApiService` class:
- `login(email, password)` - User authentication
- `getDataPackages()` - Fetch data packages
- `purchaseData(packageId, phoneNumber)` - Buy data
- `getAirtimeDenominations()` - Fetch airtime denominations

## Configuration

Update `lib/config/api_config.dart` for your backend URL:

```dart
static const String baseUrl = 'http://localhost:5000/api';
```

## Building & Running

```bash
# Get dependencies
flutter pub get

# Run on connected device/emulator
flutter run

# Build APK for Android
flutter build apk --release

# Build for iOS
flutter build ios --release
```
