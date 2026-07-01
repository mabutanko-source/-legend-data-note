class ApiConfig {
  // Change this to your actual backend URL
  // For development: http://localhost:5000
  // For production: https://your-api-domain.com
  static const String baseUrl = 'https://api.legenddata.com/api';
  
  // API Endpoints
  static const String loginEndpoint = '$baseUrl/auth/login';
  static const String registerEndpoint = '$baseUrl/auth/register';
  static const String dataPackagesEndpoint = '$baseUrl/data';
  static const String airtimeEndpoint = '$baseUrl/airtime';
  static const String healthCheckEndpoint = '$baseUrl/health';
  
  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // App Info
  static const String appName = 'Legend Data';
  static const String appVersion = '1.0.0';
  static const String privacyPolicyUrl = 'https://legenddata.com/privacy';
  static const String termsOfServiceUrl = 'https://legenddata.com/terms';
}