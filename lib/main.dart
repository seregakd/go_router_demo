import 'package:flutter/material.dart';
import 'package:go_router_demo/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _router.router.routerDelegate,
      routeInformationParser: _router.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
    );
  }
}