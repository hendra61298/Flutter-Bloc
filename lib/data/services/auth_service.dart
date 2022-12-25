import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_perdin/data/endpoint/endpoint.dart';
import 'package:flutter_perdin/domain/model/user_model.dart';
import 'package:flutter_perdin/utils/helper/base_response.dart';


class AuthService {
    static Future<Response> login(String username, String password) async{
        try{
            var response = await Dio().post(Endpoint.login, queryParameters: {'username' : username , 'password': password}, options: Options(responseType: ResponseType.json));
            return response;
        }catch(e){
            throw Exception(e);
        }
    }
}