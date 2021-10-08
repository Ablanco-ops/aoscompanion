import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/player.dart';

enum Result{majorVictoryYou, majorVictoryOpponent, minorVictoryYou, minorVictoryOpponent, Deuce}

class Score{
  final BattlePlan battlePlan;
  final Player you;
  final Player opponent;
  int score;
  Result result;


  Score(this.battlePlan, this.you, this.opponent, this.score, this.result,
      );
}