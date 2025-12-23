import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nexteramediagroup_mobile/core/constants.dart';
import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';

import 'user_data_source.dart';

class RemoteUserDataSource implements UserDataSource {
  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(Constants.usersPath));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> usersJson = responseData['data'];

        return usersJson.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Server error: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect: $e');
    }
  }
}
