import 'package:nexteramediagroup_mobile/data/data_sources/user_data_source.dart';
import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';
import 'package:nexteramediagroup_mobile/domain/repostitories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<UserModel>> getUsers() {
    return remoteDataSource.getUsers();
  }
}
