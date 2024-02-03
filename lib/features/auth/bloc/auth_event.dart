part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialized extends AuthEvent {
  const AuthInitialized({this.isLoading = true});
  final bool isLoading;
  @override
  List<Object> get props => [isLoading];
}
