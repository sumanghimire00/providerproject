import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthProvider with ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    try {
      setLoading(true);
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        setLoading(false);
        print("login Sucessfully");
      } else {
        setLoading(false);
        print("login failed");
      }
    } catch (e) {
      e.toString();
    }
  }

  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
