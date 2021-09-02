import 'package:aoscompanion/providers/factions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreGameScreen extends StatefulWidget {
  static const routeName = "/PreGame";

  @override
  _PreGameScreenState createState() => _PreGameScreenState();
}

class _PreGameScreenState extends State<PreGameScreen> {
  @override
  Widget build(BuildContext context) {
    final factionList = Provider.of<Factions>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Settings'),
      ),
      body: Column(
        children: [
          Card(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ListTile(
                    title: Text('You'),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: DropdownButton(
                      items: factionList.factions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
