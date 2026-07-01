# 📱 Legend Data App

A comprehensive VTU (Virtual Top-Up) application for buying data, airtime, and paying bills easily.

## Features

✨ **Mobile App (Flutter)**
- User authentication (Login/Register)
- Buy Data packages
- Purchase Airtime
- Pay Bills
- Wallet management
- Transaction history
- Easy-to-use dashboard

⚙️ **Backend (Node.js)**
- RESTful API with Express.js
- User authentication with JWT
- Data package management
- Airtime services
- Transaction processing
- CORS enabled

## Project Structure

```
legend-data-app/
├── flutter_app/          # Flutter mobile application
│   ├── lib/
│   │   ├── main.dart
│   │   ├── config/
│   │   ├── services/
│   │   └── screens/
│   └── pubspec.yaml
├── node_backend/         # Node.js REST API
│   ├── server.js
│   ├── routes/
│   ├── package.json
│   └── .env.example
└── docs/                 # Documentation
```

## Quick Start

### Backend Setup

```bash
cd node_backend
npm install
cp .env.example .env
npm run dev
```

Backend runs on `http://localhost:5000`

### Frontend Setup

```bash
cd flutter_app
flutter pub get
flutter run
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - User login

### Data
- `GET /api/data` - Get all data packages
- `GET /api/data/provider/:provider` - Get packages by provider
- `POST /api/data/purchase` - Purchase data

### Airtime
- `GET /api/airtime/denominations` - Get airtime denominations
- `POST /api/airtime/purchase` - Purchase airtime

### Health
- `GET /api/health` - Health check

## Technology Stack

**Frontend:**
- Flutter 3.0+
- Dart 3.0+
- HTTP package for API calls
- Provider for state management
- Shared Preferences for local storage

**Backend:**
- Node.js 16+
- Express.js 4.18+
- Mongoose (MongoDB ODM)
- JWT for authentication
- Bcryptjs for password hashing

## Environment Variables

**Backend (.env)**
```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/legend-data-app
JWT_SECRET=your_jwt_secret_key_here
NODE_ENV=development
```

## Build & Deployment

### Mobile App

**Android APK:**
```bash
flutter build apk --release
```

**iOS:**
```bash
flutter build ios --release
```

### Backend

```bash
npm start
```

## API Configuration

Update `lib/config/api_config.dart` with your backend URL:

```dart
static const String baseUrl = 'https://your-api-domain.com/api';
```

## License

MIT License - See LICENSE file for details

## Author

**mabutanko**

## Support

For support, email: support@legenddata.com

---

**Made with ❤️ for easy VTU transactions**