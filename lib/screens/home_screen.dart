import 'package:aoscompanion/screens/pre_game_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AOS Companion"),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(PreGameScreen.routeName),
          child: Icon(Icons.add)),
    );
  }
}
