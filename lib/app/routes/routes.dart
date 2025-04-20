import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/app/bloc/app_bloc.dart';
import 'package:flutter_firebase_app/home/view/home_page.dart';

import '../../login/view/login_page.dart';

List<Page<dynamic>> onGeneratePages(
    AppStatus authStatus, List<Page<dynamic>> pages) {
  switch (authStatus) {
    case AppStatus.authenticated:
      return [const MaterialPage(child: HomePage())];
    case AppStatus.unauthenticated:
      return [const MaterialPage(child: LoginPage())];
  }
}
