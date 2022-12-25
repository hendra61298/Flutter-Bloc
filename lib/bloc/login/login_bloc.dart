

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_perdin/bloc/login/login_event.dart';
import 'package:flutter_perdin/bloc/login/login_state.dart';
import 'package:flutter_perdin/data/services/auth_service.dart';
import 'package:flutter_perdin/utils/helper/base_response.dart';
import 'package:flutter_perdin/utils/helper/form_submission_status.dart';
import 'package:flutter_perdin/utils/helper/pref_helper.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState>{
    LoginBloc() :   super(LoginState()){
    on<LoginUsernameChange>((event, emit) async {
        emit(state.copyWith(event.username,null,null));
    });

    on<LoginPasswordChange>((event, emit) async {
      emit(state.copyWith(null,event.password,null));
    });

    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(null,null,FormSubmitting()));
      try{
        Response response = await AuthService.login(state.username, state.password);
        await PrefHelper.instance.saveToken(response.data['token']);
        emit(state.copyWith(null,null,SubmissionSuccess()));
      }catch(e){
        emit(state.copyWith(null,null,SubmissionFailed(Exception(e))));
        throw Exception(e);
      }
    });
  }


}