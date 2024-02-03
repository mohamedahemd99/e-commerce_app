part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial({this.isLoading = true, this.userLoginModel});
  final bool isLoading;
  final UsersLoginModel? userLoginModel;
  @override
  List<Object> get props => [isLoading];
}

class AuthLoad extends AuthState {
  const AuthLoad({this.isLoading = false, this.userLoginModel});
  final bool isLoading;
  final UsersLoginModel? userLoginModel;
  @override
  List<Object> get props => [isLoading, userLoginModel!];
}

class AuthError extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterInitial extends AuthState {
  const RegisterInitial({this.isLoading = true, this.registerModel});
  final bool isLoading;
  final ProfileModel? registerModel;
  @override
  List<Object> get props => [isLoading];
}

class RegisterLoad extends AuthState {
  const RegisterLoad({this.isLoading = false, this.registerModel});
  final bool isLoading;
  final ProfileModel? registerModel;
  @override
  List<Object> get props => [isLoading, registerModel!];
}

class RegisterError extends AuthState {
  @override
  List<Object> get props => [];
}
