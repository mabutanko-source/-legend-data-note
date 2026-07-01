import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config/api_config.dart';

class ApiService {
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse(ApiConfig.loginEndpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(ApiConfig.connectionTimeout);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return {
          'success': true,
          'token': data['token'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'message': 'Invalid credentials',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Network error: ${e.toString()}',
      };
    }
  }

  static Future<List<dynamic>> getDataPackages() async {
    try {
      final response = await http
          .get(Uri.parse(ApiConfig.dataPackagesEndpoint))
          .timeout(ApiConfig.connectionTimeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  static Future<Map<String, dynamic>> purchaseData(
      String packageId, String phoneNumber) async {
    try {
      final response = await http
          .post(
            Uri.parse('${ApiConfig.dataPackagesEndpoint}/purchase'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'packageId': packageId,
              'phoneNumber': phoneNumber,
            }),
          )
          .timeout(ApiConfig.connectionTimeout);

      if (response.statusCode == 200) {
        return {
          'success': true,
          'data': jsonDecode(response.body),
        };
      } else {
        return {'success': false};
      }
    } catch (e) {
      return {'success': false};
    }
  }

  static Future<List<dynamic>> getAirtimeDenominations() async {
    try {
      final response = await http
          .get(Uri.parse('${ApiConfig.airtimeEndpoint}/denominations'))
          .timeout(ApiConfig.connectionTimeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}