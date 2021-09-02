import 'package:aoscompanion/providers/games.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreGameScreen extends StatefulWidget {
  static const routeName = "/PreGame";

  @override
  _PreGameScreenState createState() => _PreGameScreenState();
}

class _PreGameScreenState extends State<PreGameScreen> {
  String _chosenFaction = 'Cities of Sigmar';
  String _chosenStrategy = 'Sever the Head';

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<Games>(context);

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
                    title: Center(child: Text('You')),
                    trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    title: Text('Faction: '),
                    trailing: DropdownButton(
                      value: _chosenFaction,
                      items: game.factions
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        print(value);
                        setState(() {
                          _chosenFaction = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Grand Strategy: '),
                    trailing: DropdownButton(
                      value: _chosenStrategy,
                      items: game.strategies
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        print(value);
                        setState(() {
                          _chosenFaction = value!;
                        });
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
