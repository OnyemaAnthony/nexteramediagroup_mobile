abstract class UseCases<T, Params> {
  Future<T> call(Params params);
}

abstract class NoParamUseCases<T> {
  Future<T> call();
}
