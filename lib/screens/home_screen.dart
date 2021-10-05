import 'package:aoscompanion/screens/game_config_screen.dart';
import 'package:flutter/material.dart';
import 'package:aoscompanion/common.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.title),
      ),
      body: Column(
        children: [],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).pushNamed(GameConfigScreen.routeName),
          child: Icon(Icons.add)),
    );
  }
}
