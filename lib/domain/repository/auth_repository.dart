
import 'package:flutter/cupertino.dart';

@immutable
abstract class AuthRepository {
 static Future login(String username, String password) async{}
}