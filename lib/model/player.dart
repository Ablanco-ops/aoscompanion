import 'package:aoscompanion/model/grand_strategy.dart';

import 'faction.dart';

class Player{
  final String playerName;
  final Faction faction;
  final GrandStrategy grandStrategy;


  Player({required this.playerName, required this.faction, required this.grandStrategy});

  @override
  String toString() {
    return 'Player{playerName: $playerName, faction: $faction, grandStrategy: $grandStrategy}';
  }
}