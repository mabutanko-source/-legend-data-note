# Legend Data App - API Documentation

## Base URL
```
http://localhost:5000/api
```

## Authentication

All requests (except register/login) require JWT token in header:
```
Authorization: Bearer <token>
```

---

## Endpoints

### 1. AUTH - Register
**Endpoint:** `POST /auth/register`

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "securePassword123"
}
```

**Response (201):**
```json
{
  "message": "User registered successfully"
}
```

**Error (400):**
```json
{
  "error": "All fields required"
}
```

---

### 2. AUTH - Login
**Endpoint:** `POST /auth/login`

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "securePassword123"
}
```

**Response (200):**
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "user": {
    "id": "1719829920000",
    "email": "john@example.com",
    "name": "John Doe"
  }
}
```

**Error (401):**
```json
{
  "error": "Invalid credentials"
}
```

---

### 3. DATA - Get All Packages
**Endpoint:** `GET /data`

**Response (200):**
```json
[
  {
    "id": 1,
    "provider": "MTN",
    "name": "1GB",
    "price": 500,
    "duration": "30 days"
  },
  {
    "id": 2,
    "provider": "MTN",
    "name": "2GB",
    "price": 900,
    "duration": "30 days"
  },
  {
    "id": 3,
    "provider": "GLO",
    "name": "1GB",
    "price": 450,
    "duration": "30 days"
  },
  {
    "id": 4,
    "provider": "AIRTEL",
    "name": "1GB",
    "price": 480,
    "duration": "30 days"
  },
  {
    "id": 5,
    "provider": "9MOBILE",
    "name": "1GB",
    "price": 420,
    "duration": "30 days"
  }
]
```

---

### 4. DATA - Get by Provider
**Endpoint:** `GET /data/provider/:provider`

**Parameters:**
- `provider` (string): MTN, GLO, AIRTEL, 9MOBILE

**Example:** `GET /data/provider/MTN`

**Response (200):**
```json
[
  {
    "id": 1,
    "provider": "MTN",
    "name": "1GB",
    "price": 500,
    "duration": "30 days"
  },
  {
    "id": 2,
    "provider": "MTN",
    "name": "2GB",
    "price": 900,
    "duration": "30 days"
  }
]
```

---

### 5. DATA - Purchase Data
**Endpoint:** `POST /data/purchase`

**Request Body:**
```json
{
  "packageId": 1,
  "phoneNumber": "08012345678"
}
```

**Response (200):**
```json
{
  "message": "Data purchase successful",
  "transaction": {
    "id": "1719829920000",
    "packageId": 1,
    "phoneNumber": "08012345678",
    "amount": 500,
    "status": "successful",
    "timestamp": "2024-07-01T10:12:00.000Z",
    "provider": "MTN",
    "data": "1GB"
  }
}
```

**Error (400):**
```json
{
  "error": "Package ID and phone number required"
}
```

**Error (404):**
```json
{
  "error": "Package not found"
}
```

---

### 6. AIRTIME - Get Denominations
**Endpoint:** `GET /airtime/denominations`

**Response (200):**
```json
[
  { "id": 1, "amount": 100, "provider": "MTN" },
  { "id": 2, "amount": 200, "provider": "MTN" },
  { "id": 3, "amount": 500, "provider": "MTN" },
  { "id": 4, "amount": 1000, "provider": "MTN" },
  { "id": 5, "amount": 100, "provider": "GLO" },
  { "id": 6, "amount": 200, "provider": "GLO" },
  { "id": 7, "amount": 500, "provider": "GLO" },
  { "id": 8, "amount": 1000, "provider": "AIRTEL" }
]
```

---

### 7. AIRTIME - Purchase Airtime
**Endpoint:** `POST /airtime/purchase`

**Request Body:**
```json
{
  "phoneNumber": "08012345678",
  "amount": 500,
  "provider": "MTN"
}
```

**Response (200):**
```json
{
  "message": "Airtime purchase successful",
  "transaction": {
    "id": "1719829920000",
    "phoneNumber": "08012345678",
    "amount": 500,
    "provider": "MTN",
    "status": "successful",
    "timestamp": "2024-07-01T10:12:00.000Z"
  }
}
```

**Error (400):**
```json
{
  "error": "All fields required"
}
```

---

### 8. HEALTH - Check Server Status
**Endpoint:** `GET /health`

**Response (200):**
```json
{
  "status": "OK",
  "message": "Server is running"
}
```

---

## Response Status Codes

| Code | Meaning |
|------|----------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 404 | Not Found |
| 500 | Server Error |

---

## Error Handling

All errors follow this format:
```json
{
  "error": "Error message here"
}
```

---

## Rate Limiting

Currently no rate limiting. Implement in production.

---

## Changelog

### v1.0.0
- Initial API release
- Authentication endpoints
- Data package endpoints
- Airtime purchase endpoints

---

## Version
**Current:** v1.0.0

---

**Last Updated:** July 1, 2024
