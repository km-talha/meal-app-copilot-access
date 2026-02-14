import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;
  bool _isLoading = false;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null && _expiryDate!.isBefore(DateTime.now())) {
      return null;
    }
    return _token;
  }

  Future<void> signup(String email, String password) async {
    // Implement your signup logic here
    _isLoading = true;
    notifyListeners();
    // Simulate a network request
    await Future.delayed(Duration(seconds: 2));
    _token = 'dummy_token'; // replace with your token from your auth service
    _userId = 'dummy_user_id'; // replace with your user ID from your auth service
    _expiryDate = DateTime.now().add(Duration(hours: 1)); // simulate expiry
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    // Implement your login logic here
    _isLoading = true;
    notifyListeners();
    // Simulate a network request
    await Future.delayed(Duration(seconds: 2));
    _token = 'dummy_token'; // replace with your token from your auth service
    _userId = 'dummy_user_id'; // replace with your user ID from your auth service
    _expiryDate = DateTime.now().add(Duration(hours: 1)); // simulate expiry
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
}