import 'dart:io';

class Constants {
  static String usersPath =
      'http://${Platform.isIOS ? 'localhost' : '10.0.2.2'}:8000/api/users';
}
