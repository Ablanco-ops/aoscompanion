import 'package:aoscompanion/model/turn_objective.dart';

import 'battle_tactic.dart';

class TurnScore{
  final int turnNumber;
  final List<TurnObjective> playerObjectives;
  final List<TurnObjective> opponentObjectives;
  BattleTactic playerBattleTactic= BattleTactic(0, [""]);
  BattleTactic opponentBattleTactic= BattleTactic(0, [""]);
  bool playerBtDone=false;
  bool opponentBtDone=false;
  List<bool> listScore=[false,false,false,false];
  TurnScore(this.turnNumber, this.playerObjectives, this.opponentObjectives);
}