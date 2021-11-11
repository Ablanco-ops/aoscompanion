import 'package:aoscompanion/model/turn_objective.dart';

import 'battle_tactic.dart';

class TurnScore{
  final int turnNumber;
  final List<TurnObjective> playerObjectives;
  final List<TurnObjective> opponentObjectives;
  late BattleTactic playerBattleTactic;
  late BattleTactic opponentBattleTactic;
  List<bool> listScore=[false,false,false,false];
  TurnScore(this.turnNumber, this.playerObjectives, this.opponentObjectives);
}