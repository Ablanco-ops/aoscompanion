import 'package:aoscompanion/model/faction.dart';
import 'package:aoscompanion/model/grand_strategy.dart';
import 'package:aoscompanion/providers/game_config_repository.dart';
import 'package:provider/provider.dart';

import '../common.dart';
import '../decoration.dart';

class GameConfigCard extends StatefulWidget {
  final String name;


  GameConfigCard(this.name);

  @override
  State<GameConfigCard> createState() => _GameConfigCardState();
}

class _GameConfigCardState extends State<GameConfigCard> {
  Faction? _chosenFaction;
  GrandStrategy? _chosenStrategy;
  String? newName;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameConfig>(context, listen: false);

    return Card(
      margin:  gameConfigScreenCardMargin,
      child: Column(
        children: [
          ListTile(
            title: Center(
              child: TextField(
                maxLength: 15,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: widget.name,
                ),
                onChanged: (value) {
                  setState(() {
                    newName = value;
                    debugPrint(newName);
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.faction),
            trailing: DropdownButton(
              value: _chosenFaction ??= game.factions[0],
              items:
                  game.factions.map<DropdownMenuItem<Faction>>((Faction value) {
                return DropdownMenuItem<Faction>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (Faction? value) {
                debugPrint(value!.name);
                setState(() {
                  _chosenFaction = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.grand_strategy),
            trailing: DropdownButton(
              value: _chosenStrategy ??= game.strategies[0],
              items: game.strategies
                  .map<DropdownMenuItem<GrandStrategy>>((GrandStrategy value) {
                return DropdownMenuItem<GrandStrategy>(
                  value: value,
                  child: Text(value.name[0]),
                );
              }).toList(),
              onChanged: (GrandStrategy? value) {
                debugPrint(value!.name[0]);
                setState(() {
                  _chosenStrategy = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
