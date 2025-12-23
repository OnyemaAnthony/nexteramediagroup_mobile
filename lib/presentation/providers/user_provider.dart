import 'package:flutter/material.dart';
import 'package:nexteramediagroup_mobile/core/app_states.dart';
import 'package:nexteramediagroup_mobile/domain/model/user_model.dart';
import 'package:nexteramediagroup_mobile/domain/usecases/get_users_use_case.dart';

class UserProvider extends ChangeNotifier {
  final GetUsersUseCase getUsersUseCase;

  UserProvider({required this.getUsersUseCase});

  UserState _state = UserState.initial;
  UserState get state => _state;

  List<UserModel> _users = [];
  List<UserModel> get users => _users;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> getUsers() async {
    _state = UserState.loading;
    notifyListeners();

    try {
      final result = await getUsersUseCase.call();
      _users = result;
      _state = _users.isEmpty ? UserState.empty : UserState.loaded;
    } catch (e) {
      _errorMessage = e.toString();
      _state = UserState.error;
    } finally {
      notifyListeners();
    }
  }

  void retry() {
    getUsers();
  }
}
