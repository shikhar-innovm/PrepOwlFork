part of 'login_bloc.dart';

class LoginState {
  final LoginDTO? loginDTO;
  final String message;
  final bool isLoading;

  LoginState({
    this.loginDTO,
    this.message = '',
    this.isLoading = false,
  });

  LoginState copyWith({
    LoginDTO? loginDTO,
    String? message,
    bool? isLoading,
  }) {
    return LoginState(
      loginDTO: loginDTO ?? this.loginDTO,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() =>
      'LoginState(loginDTO: $loginDTO, message: $message, isLoading: $isLoading)';
}
