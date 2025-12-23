import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';
import 'package:nexteramediagroup_mobile/domain/repostitories/user_repository.dart';
import 'package:nexteramediagroup_mobile/domain/usecases/use_case.dart'
    show NoParamUseCases;

class GetUsersUseCase implements NoParamUseCases<List<UserModel>> {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  @override
  Future<List<UserModel>> call() {
    return repository.getUsers();
  }
}
