import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zemoga_app/Components/detail_page/detail_page.dart';
import 'package:zemoga_app/Components/home_page/home_page.dart';

part './routes_hanlder.dart';

class RouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: <GoRoute>[
      GoRoute(
        path: '/home',
        builder: _homePageBuilder,
      ),
      GoRoute(
        path: '/detailPost/:postId',
        pageBuilder: _detailPageBuilder,
      ),
    ],
  );
}
