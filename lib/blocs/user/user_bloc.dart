import 'package:bank_sha/services/user_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if(event is UserGetByUsername){
        try {

          emit(UserLoading());

          final user = await UserService().getUsersByUsername(event.username);
          
          emit(UserSuccess(user));
          
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
      if(event is UserGetRecentUsers){
        try {

          emit(UserLoading());

          final user = await UserService().getRecentUsers();

          emit(UserSuccess(user));
          
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
