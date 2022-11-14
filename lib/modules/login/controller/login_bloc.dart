import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login_dto.dart';
import '../repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<GoogleLogin>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final result = await LoginRepoImp().googleLogin();
      final updatedState = result.fold(
        (l) => state.copyWith(isLoading: false, message: l.response.toString()),
        (r) => state.copyWith(
          isLoading: false,
          loginDTO: r,
        ),
      );
      emit(updatedState);
    });
  }
}
