import 'package:flutter/material.dart';

import '../modules/modules.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    HomeScreen.name: (_) => const HomeScreen(),
    NewPersonScreen.name: (_) => const NewPersonScreen(),
  };
}
