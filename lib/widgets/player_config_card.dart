import 'package:aoscompanion/model/faction.dart';
import 'package:aoscompanion/model/grand_strategy.dart';
import 'package:aoscompanion/model/player.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';

import '../common.dart';
import '../decoration.dart';

class GameConfigCard extends StatefulWidget {
  final String name;
  final bool you;
  GameConfigCard(this.name, this.you);

  @override
  State<GameConfigCard> createState() => _GameConfigCardState();
}

class _GameConfigCardState extends State<GameConfigCard> {
  Faction? _chosenFaction;
  GrandStrategy? _chosenStrategy;
  String? newName;
  //SettingsOld settings = SettingsOld();



  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<PreGameSettings>(context);
    var player= Player(playerName: newName ??=widget.name, faction: _chosenFaction ??= settings.factions[0],
        grandStrategy: _chosenStrategy ??= settings.strategies[0]);
    void setPlayer(Player player){
      if (widget.you){
        settings.player=player;
      }
      else{
        settings.opponent=player;
      }
    }

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
                    setPlayer(player);
                    debugPrint(newName);
                  });
                },
              ),
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.faction),
            trailing: DropdownButton(
              value: _chosenFaction ?? settings.factions[0],
              items:
                  settings.factions.map<DropdownMenuItem<Faction>>((Faction value) {
                return DropdownMenuItem<Faction>(
                  value: value,
                  child: Text(value.name),
                );
              }).toList(),
              onChanged: (Faction? value) {
                debugPrint(value!.name);
                setState(() {
                  _chosenFaction = value;
                  setPlayer(player);
                });
              },
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.grand_strategy),
            trailing: DropdownButton(
              value: _chosenStrategy ?? settings.strategies[0],
              items: settings.strategies
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
                  setPlayer(player);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
