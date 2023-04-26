import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'scanner.dart';

const users = const {
  'eliedersousa@gmail.com': '123456',
  'edu-bejor@hotmail.com': 'cappile',
  'nagi@hotmail.com': 'theuzin'
};

class Login extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  // Estilo personalizado modificado
  LoginTheme _loginTheme = LoginTheme(
    primaryColor: Color.fromARGB(255, 121, 68, 34),
    accentColor: Color.fromARGB(255, 160, 115, 32),
    errorColor: Color.fromARGB(255, 191, 73, 55),
    pageColorLight: Colors.white,
    pageColorDark: Colors.blueGrey[800],
  );

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'TACARO',
      theme: _loginTheme, // Aqui adiciona o estilo criado
      logo: AssetImage('assets/images/logo.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ScreenScanner(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
