import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perdin/bloc/login/login_bloc.dart';
import 'package:flutter_perdin/bloc/login/login_event.dart';
import 'package:flutter_perdin/bloc/login/login_state.dart';
import 'package:flutter_perdin/utils/helper/form_submission_status.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm(){
    return BlocListener<LoginBloc,LoginState>(listener: (context, state){
        final formStatus = state.formStatus;
        if( formStatus is SubmissionFailed){
          _showSnackbar(context);
        } else if(formStatus is SubmissionSuccess ){
          context.goNamed('home');
        }
    },
    child: Form(
      key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              _passwordField(),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child:  _loginButton(),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _usernameField(){
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context ,state) {
        return TextFormField(
          decoration: const InputDecoration(
            icon: Icon(Icons.person),
            hintText: "Username",
          ),
          validator: (value)=> state.isRequiredUsername ? null : "Username is Required",
          onChanged: (value)=> context.read<LoginBloc>().add(LoginUsernameChange(username: value)),
        );
      }
    );
  }

  Widget _passwordField(){
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context,state) {
        return TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            icon: Icon(Icons.security),
            hintText: "Username",
          ),
          validator: (value)=> state.isRequiredPassword ? null : "Password is Required",
          onChanged: (value)=> context.read<LoginBloc>().add(LoginPasswordChange(password: value)),
        );
      }
    );
  }

  Widget _loginButton(){
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context,state) {
        return state.formStatus is FormSubmitting ? const CircularProgressIndicator() :
        ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                  context.read<LoginBloc>().add(LoginSubmitted());
              }
            },
            child: const Text('Login')
        );
      }
    );
  }

  void _showSnackbar(BuildContext context){
    const snackBar = SnackBar(content:Text("Login Failed"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
