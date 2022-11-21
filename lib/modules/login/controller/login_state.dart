// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState {
  final UserDTO? userDTO;
  final bool isOtpGenerated;
  final bool showResendOtp;
  final String errorMessage;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isUnauthenticated;

  LoginState(
      {this.userDTO,
      this.isOtpGenerated = false,
      this.showResendOtp = false,
      this.errorMessage = "",
      this.isLoading = false,
      this.isAuthenticated = false,
      this.isUnauthenticated = false});

  LoginState copyWith({
    UserDTO? userDTO,
    bool? isOtpGenerated,
    bool? showResendOtp,
    String? errorMessage,
    bool? isLoading,
    bool? isAuthenticated,
    bool? isUnauthenticated,
  }) {
    return LoginState(
      userDTO: userDTO ?? this.userDTO,
      isOtpGenerated: isOtpGenerated ?? this.isOtpGenerated,
      showResendOtp: showResendOtp ?? this.showResendOtp,
      errorMessage: errorMessage ?? this.errorMessage,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isUnauthenticated: isUnauthenticated ?? this.isUnauthenticated,
    );
  }

  @override
  String toString() {
    return 'LoginState(userDTO: $userDTO, isOtpGenerated: $isOtpGenerated, showResendOtp: $showResendOtp, errorMessage: $errorMessage, isLoading: $isLoading, isAuthenticated: $isAuthenticated, isUnauthenticated: $isUnauthenticated)';
  }
}
