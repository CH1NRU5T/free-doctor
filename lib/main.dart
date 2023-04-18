import 'package:flutter/material.dart';
import 'package:free_doctor/router.dart';
import 'package:free_doctor/screens/all_reels_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: generateRoute,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            elevation: 10,
          ),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AllReelsScreen.routeName, (route) => false);
          },
          icon: const Icon(Icons.play_arrow_outlined),
        ),
      ),
    );
  }
}
