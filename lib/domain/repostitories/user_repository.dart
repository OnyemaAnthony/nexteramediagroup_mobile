import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();
}
