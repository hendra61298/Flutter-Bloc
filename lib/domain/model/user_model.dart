
import 'package:flutter/cupertino.dart';

@immutable
class User{
  final String username;
  final String password;

  const User(this.username,this.password);
}