import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/first_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/next_page.dart';
import 'pages/profile_page.dart';
import 'pages/profile_settings_page.dart';
import 'pages/second_page.dart';
import 'pages/third_page.dart';

bool isAuthenticated = false;

class AppRouter {
  static const String home = '/';
  static const String first = '/first';
  static const String second = '/second';
  static const String third = '/third';
  static const String profile = '/profile';
  static const String profileSettings = '/profile/profile_settings';
  static const String login = '/login';
  static const String next = '/next';

  AppRouter._privateConstructor() {
    _initialize();
  }

  static final AppRouter _instance = AppRouter._privateConstructor();

  factory AppRouter.init() {
    return _instance;
  }

  static late GoRouter router;

  void _initialize() {
    router = GoRouter(
      initialLocation: home,
      redirect: (context, state) async {
        if (state.matchedLocation.startsWith(profile) && !isAuthenticated) {
          return login;
        } else {
          return null;
        }
      },
      routes: <GoRoute>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
          routes: [
            GoRoute(
              path: 'first',
              builder: (BuildContext context, GoRouterState state) =>
                  const FirstPage(),
            ),
            GoRoute(
              path: 'second',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const SecondPage(
                  title: 'text',
                  text: 100,
                ),
              ),
            ),
            GoRoute(
              path: 'third',
              builder: (BuildContext context, GoRouterState state) =>
                  const ThirdPage(
                title: 'title',
                text: 'text',
              ),
            ),
            GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfilePage(),
              routes: [
                GoRoute(
                  path: 'profile_settings',
                  builder: (BuildContext context, GoRouterState state) =>
                      const ProfileSettingsPage(),
                ),
              ],
            ),
            GoRoute(
              path: 'next',
              builder: (context, state) => const NextPage(),
            ),
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
      errorBuilder: (context, state) => const HomePage(),
    );
  }
}
