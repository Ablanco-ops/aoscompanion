import 'package:aoscompanion/model/grand_strategy.dart';
import 'package:aoscompanion/model/turn.dart';

import 'faction.dart';

class Player{
  final String playerName;
  final Faction faction;
  final GrandStrategy grandStrategy;
  bool grandStrategyDone;
  late List<Turn> listScoreTurn;


  Player({required this.playerName, required this.faction, required this.grandStrategy, this.grandStrategyDone=false});
}