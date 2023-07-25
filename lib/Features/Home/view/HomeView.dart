import 'package:flutter/material.dart';
import 'package:fwitter/Constants/constants.dart';

class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeView());
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final appbar = Uiconst.appBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: const Center(
        child: Text("fkdsjflksjdkfjdask;fd"),
      ),
    );
  }
}
