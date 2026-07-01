# Node.js Backend Structure

## Directory Layout

```
node_backend/
├── server.js                     # Main server file
├── routes/
│   ├── auth.js                  # Authentication
│   ├── data.js                  # Data packages
│   └── airtime.js               # Airtime services
├── package.json                 # Dependencies
├── .env.example                 # Environment template
└── .gitignore                   # Git ignore
```

## Dependencies

- **express:** Web framework
- **cors:** Cross-origin requests
- **dotenv:** Environment variables
- **mongoose:** MongoDB ODM (for future DB integration)
- **bcryptjs:** Password hashing
- **jsonwebtoken:** JWT authentication
- **axios:** HTTP client

## Server Setup

### Main File (server.js)

```javascript
const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/data', dataRoutes);
app.use('/api/airtime', airtimeRoutes);

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

## Routes

### Authentication (routes/auth.js)

**POST /auth/register**
- Creates new user
- Hashes password
- Stores in database

**POST /auth/login**
- Validates credentials
- Returns JWT token
- User data in response

### Data (routes/data.js)

**GET /data**
- Returns all available data packages
- Includes price and duration

**GET /data/provider/:provider**
- Filters packages by provider

**POST /data/purchase**
- Processes data purchase
- Returns transaction details

### Airtime (routes/airtime.js)

**GET /airtime/denominations**
- Returns available denominations
- Organized by provider

**POST /airtime/purchase**
- Processes airtime purchase
- Confirms transaction

## Environment Variables (.env)

```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/legend-data-app
JWT_SECRET=your_secret_key
NODE_ENV=development
```

## Running the Server

**Development:**
```bash
npm run dev
```

**Production:**
```bash
npm start
```

## Error Handling

All endpoints include:
- Input validation
- Error responses
- Try-catch blocks

## Security Features

- Password hashing with bcryptjs
- JWT token authentication
- CORS enabled
- Input validation

## Future Enhancements

- MongoDB integration
- Payment gateway integration
- Email notifications
- SMS alerts
- Advanced error logging
- Rate limiting
- API versioning
