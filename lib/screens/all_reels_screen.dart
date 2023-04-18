import 'package:flutter/material.dart';
import 'package:free_doctor/widgets/grid_box.dart';

class AllReelsScreen extends StatefulWidget {
  const AllReelsScreen({super.key});
  static const String routeName = 'all-reels-page';
  @override
  State<AllReelsScreen> createState() => _AllReelsScreenState();
}

class _AllReelsScreenState extends State<AllReelsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          children: const [
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
            Gridbox(),
          ],
        ),
      ),
    );
  }
}
