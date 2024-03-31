import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudge_financial_app/bloc/user_list/user_list_bloc.dart';
import 'package:fudge_financial_app/bloc/user_list/user_list_event.dart';
import 'package:fudge_financial_app/bloc/user_list/user_list_state.dart';
import 'package:fudge_financial_app/repository/user_repository.dart';
import 'package:fudge_financial_app/ui/design_components/username_with_image.dart';

class ScrollableUserNameList extends StatefulWidget {
  @override
  State<ScrollableUserNameList> createState() => _ScrollableUserNameListState();
}

class _ScrollableUserNameListState extends State<ScrollableUserNameList> {
  List<String> imagePaths = [
    "assets/images/mike.png",
    "assets/images/oslo.png",
    "assets/images/nikki.png",
    "assets/images/jayden.png",
  ];

  final userListBloc = UserListBloc(userRepository: UserRepository());

  @override
  void initState() {
    super.initState();
    // Dispatch LoadUsersEvent when the widget is initialized
    userListBloc.add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => userListBloc,
        child: BlocBuilder<UserListBloc, UserListState>(
          builder: (context, state) {
            if (state is UsersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is UsersLoadedState) {
              // Display the list of usernames in a horizontal scrollable row
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    final user = state.users[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: UserNameWithImage(
                          imagePath: imagePaths[index % 4], userName: user.username),
                    );
                  },
                ),
              );
            } else if (state is UsersLoadErrorState) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return Container(); // Handle other states if needed
            }
          },
        ));
  }
}
