import 'package:flutter/material.dart';

class Newpage extends StatelessWidget {
  const Newpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AppBar(
      centerTitle: true,
      title: Text('Home Page'),
    ));
  }
}
