import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/player.dart';
import 'package:aoscompanion/model/realm.dart';

enum Result {
  majorVictoryYou,
  majorVictoryOpponent,
  minorVictoryYou,
  minorVictoryOpponent,
  Deuce
}

class Score {
  final Realm realm;
  final BattlePlan battlePlan;
  final Player you;
  final Player opponent;
  final DateTime date;
  final bool attacker;
  int score;
  Result result;

  Score(this.battlePlan, this.you, this.opponent, this.score, this.result,
      this.realm, this.attacker, this.date);
}
