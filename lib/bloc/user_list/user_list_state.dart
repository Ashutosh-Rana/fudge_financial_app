import 'package:fudge_financial_app/models/user.dart';

// States
abstract class UserListState {}

class UsersLoadingState extends UserListState {}

class UsersLoadedState extends UserListState {
  final List<User> users;

  UsersLoadedState(this.users);
}

class UsersLoadErrorState extends UserListState {
  final String error;

  UsersLoadErrorState(this.error);
}
