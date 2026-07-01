# 🚀 LEGEND DATA APP - QUICK START GUIDE

## Prerequisites

Before you begin, make sure you have installed:

### For Backend:
- **Node.js** (v16 or higher) - [Download](https://nodejs.org/)
- **npm** (comes with Node.js)
- **MongoDB** (local or Atlas) - [Download](https://www.mongodb.com/try/download/community)

### For Frontend:
- **Flutter** (v3.0 or higher) - [Install](https://flutter.dev/docs/get-started/install)
- **Dart** (comes with Flutter)
- **Android Studio** or **Xcode** (for emulator/simulator)

---

## ⚙️ BACKEND SETUP

### Step 1: Navigate to Backend Directory
```bash
cd node_backend
```

### Step 2: Install Dependencies
```bash
npm install
```

### Step 3: Configure Environment Variables
```bash
cp .env.example .env
```

Edit `.env` and update:
```env
PORT=5000
MONGODB_URI=mongodb://localhost:27017/legend-data-app
JWT_SECRET=your_super_secret_key_here_change_this
NODE_ENV=development
```

### Step 4: Start the Server

**For Development (with auto-reload):**
```bash
npm run dev
```

**For Production:**
```bash
npm start
```

✅ Server should be running on `http://localhost:5000`

### Step 5: Test the API
```bash
curl http://localhost:5000/api/health
```

Expected response:
```json
{"status":"OK","message":"Server is running"}
```

---

## 📱 FRONTEND SETUP

### Step 1: Navigate to Flutter App Directory
```bash
cd flutter_app
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Configure API URL

Edit `lib/config/api_config.dart`:

```dart
// For Local Development
static const String baseUrl = 'http://localhost:5000/api';

// For Production
// static const String baseUrl = 'https://your-api-domain.com/api';
```

### Step 4: Run the App

**On Android Emulator:**
```bash
flutter run
```

**On iOS Simulator:**
```bash
flutter run -d macos
```

**On Physical Device:**
```bash
flutter run
```

---

## 📋 API ENDPOINTS

### Authentication

**Register User:**
```bash
POST /api/auth/register
Content-Type: application/json

{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "securePassword123"
}
```

**Login:**
```bash
POST /api/auth/login
Content-Type: application/json

{
  "email": "john@example.com",
  "password": "securePassword123"
}

Response:
{
  "token": "eyJhbGciOiJIUzI1NiIs...",
  "user": {
    "id": "1234567890",
    "email": "john@example.com",
    "name": "John Doe"
  }
}
```

### Data Packages

**Get All Packages:**
```bash
GET /api/data

Response:
[
  { "id": 1, "provider": "MTN", "name": "1GB", "price": 500, "duration": "30 days" },
  { "id": 2, "provider": "MTN", "name": "2GB", "price": 900, "duration": "30 days" },
  ...
]
```

**Get by Provider:**
```bash
GET /api/data/provider/MTN
```

**Purchase Data:**
```bash
POST /api/data/purchase
Content-Type: application/json

{
  "packageId": 1,
  "phoneNumber": "08012345678"
}

Response:
{
  "message": "Data purchase successful",
  "transaction": {
    "id": "1234567890",
    "packageId": 1,
    "phoneNumber": "08012345678",
    "amount": 500,
    "status": "successful",
    "provider": "MTN",
    "data": "1GB"
  }
}
```

### Airtime

**Get Denominations:**
```bash
GET /api/airtime/denominations

Response:
[
  { "id": 1, "amount": 100, "provider": "MTN" },
  { "id": 2, "amount": 200, "provider": "MTN" },
  ...
]
```

**Purchase Airtime:**
```bash
POST /api/airtime/purchase
Content-Type: application/json

{
  "phoneNumber": "08012345678",
  "amount": 500,
  "provider": "MTN"
}

Response:
{
  "message": "Airtime purchase successful",
  "transaction": {
    "id": "1234567890",
    "phoneNumber": "08012345678",
    "amount": 500,
    "provider": "MTN",
    "status": "successful"
  }
}
```

---

## 🧪 TESTING

### Test Backend with Postman

1. Download [Postman](https://www.postman.com/downloads/)
2. Import the API endpoints above
3. Test each endpoint

### Test Flutter App

1. Run the app: `flutter run`
2. Try logging in with test credentials
3. Navigate through the app features

---

## 📦 BUILD FOR PRODUCTION

### Build Android APK

```bash
cd flutter_app
flutter build apk --release
```

Output: `build/app/outputs/flutter-app-release.apk`

### Build iOS App

```bash
flutter build ios --release
```

### Build Backend for Production

1. Set `NODE_ENV=production` in `.env`
2. Use a process manager like **PM2**:

```bash
npm install -g pm2
pm2 start server.js --name "legend-data-api"
pm2 startup
pm2 save
```

---

## 🐛 TROUBLESHOOTING

### Backend Issues

**Error: `Cannot find module 'express'`**
- Run: `npm install`

**Error: `MongoDB connection failed`**
- Ensure MongoDB is running
- Check `MONGODB_URI` in `.env`

**Error: `Port 5000 already in use`**
- Change port in `.env`: `PORT=5001`

### Frontend Issues

**Error: `flutter: command not found`**
- Add Flutter to PATH: See [Flutter docs](https://flutter.dev/docs/get-started/install)

**Error: `Failed to connect to API`**
- Update `api_config.dart` with correct backend URL
- Ensure backend is running

**Error: `Android SDK not found`**
- Run: `flutter doctor` and follow instructions

---

## 📱 APP FEATURES

### User Authentication
- ✅ Register new account
- ✅ Login with email & password
- ✅ Session persistence

### Dashboard
- ✅ View wallet balance
- ✅ Quick access to services
- ✅ Recent transactions history

### Data Purchase
- ✅ Browse available packages
- ✅ Filter by provider (MTN, GLO, AIRTEL, 9MOBILE)
- ✅ Purchase with phone number verification

### Airtime Purchase
- ✅ Select denomination
- ✅ Choose provider
- ✅ Instant purchase confirmation

### Wallet Management
- ✅ Fund wallet
- ✅ View balance
- ✅ Transaction history

---

## 🔐 SECURITY NOTES

1. **JWT Secret:** Change `JWT_SECRET` in `.env` to a strong random string
2. **CORS:** Configure CORS properly for production
3. **Database:** Use MongoDB Atlas for production
4. **API Keys:** Don't commit sensitive data to Git
5. **HTTPS:** Always use HTTPS in production

---

## 📞 SUPPORT

For issues or questions:
- Email: support@legenddata.com
- GitHub Issues: [Create an issue](https://github.com/mabutanko-source/-legend-data-note/issues)

---

**Happy coding! 🎉**
