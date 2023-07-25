import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
   const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}


class Loading_Page extends StatelessWidget {
  const Loading_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Loader();
  }
}