import 'package:flutter/material.dart';
import 'package:free_doctor/screens/all_reels_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AllReelsScreen.routeName:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AllReelsScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const AllReelsScreen(),
      );
  }
}
