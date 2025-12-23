import 'package:get_it/get_it.dart';
import 'package:nexteramediagroup_mobile/data/data_sources/remote_user_data_souce.dart';
import 'package:nexteramediagroup_mobile/data/data_sources/user_data_source.dart';
import 'package:nexteramediagroup_mobile/data/repositories/user_repostitory_impl.dart';
import 'package:nexteramediagroup_mobile/domain/repostitories/user_repository.dart';
import 'package:nexteramediagroup_mobile/domain/usecases/get_users_use_case.dart';
import 'package:nexteramediagroup_mobile/presentation/providers/user_provider.dart';

final sl = GetIt.instance;

Future<void> initializeDependence() async {
  sl.registerFactory(() => UserProvider(getUsersUseCase: sl()));

  sl.registerLazySingleton(() => GetUsersUseCase(repository: sl()));

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      remoteDataSource: sl(instanceName: 'RemoteUserDataSource'),
    ),
  );

  sl.registerLazySingleton<UserDataSource>(
    () => RemoteUserDataSource(),
    instanceName: 'RemoteUserDataSource',
  );
}
