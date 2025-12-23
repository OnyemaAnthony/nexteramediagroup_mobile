import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}
