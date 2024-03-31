import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudge_financial_app/bloc/user_list/user_list_event.dart';
import 'package:fudge_financial_app/bloc/user_list/user_list_state.dart';
import 'package:fudge_financial_app/repository/user_repository.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final UserRepository userRepository;

  UserListBloc({required this.userRepository}) : super(UsersLoadingState()) {
    on<LoadUsersEvent>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(LoadUsersEvent event, Emitter<UserListState> emit) async {
    emit(UsersLoadingState());
    try {
      final users = await userRepository.getUsers();
      emit(UsersLoadedState(users));
    } catch (error) {
      emit(UsersLoadErrorState(error.toString()));
    }
  }
}
