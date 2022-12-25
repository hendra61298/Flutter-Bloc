import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_perdin/bloc/login/login_bloc.dart';
import 'package:flutter_perdin/config/router/router.dart';
import 'package:flutter_perdin/utils/helper/pref_helper.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PrefHelper.instance.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GoRouter _router = MyRouter().router;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>LoginBloc() ,
        child: MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          routeInformationProvider: _router.routeInformationProvider,
        ),
    );
  }
}
