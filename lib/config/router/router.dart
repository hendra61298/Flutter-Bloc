
import 'package:flutter/cupertino.dart';
import 'package:flutter_perdin/features/login_view/login_view.dart';
import 'package:flutter_perdin/utils/helper/pref_helper.dart';
import 'package:go_router/go_router.dart';

import '../../features/home_view/home.dart';

class MyRouter {

  final GoRouter router = GoRouter(
    initialLocation: '/login',
      redirect: (BuildContext context, GoRouterState state) {
        if (PrefHelper.instance.token.isEmpty){
          return '/login';
        }else {
          return '/';
        }
      },
    routes: [
     GoRoute(
       path: '/',
       name: 'home',
       builder: (context, state) => const HomePage(),
     ),
      GoRoute(
        path:'/login',
        name: 'login',
        builder: (context ,state) => LoginView(),
      )
    ]
  );
}