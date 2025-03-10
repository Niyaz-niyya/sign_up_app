

import 'package:sign_up/domin/repositories/api_service.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  Future<Map<String, dynamic>?> login(String email, String password) {
    return apiService.login(email, password);
  }

  Future<bool> signup(String username, String email, String password) {
    return apiService.signup(username, email, password);
  }

  Future<Map<String, dynamic>?> fetchUserProfile(String token) {
    return apiService.fetchUserProfile(token);
  }
}
