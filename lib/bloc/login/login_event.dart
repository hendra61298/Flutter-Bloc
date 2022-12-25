import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];

}

class LoginUsernameChange extends LoginEvent{
  final String username ;
  const LoginUsernameChange({required this.username});
}

class LoginPasswordChange extends LoginEvent{
  final String password;
  const LoginPasswordChange({required this.password});
}

class LoginSubmitted extends LoginEvent{}
