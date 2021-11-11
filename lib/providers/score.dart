import 'package:aoscompanion/common.dart';
import 'package:aoscompanion/model/battle_tactic.dart';
import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/turn_score.dart';
import 'package:aoscompanion/repository.dart';

enum Result {
  majorVictoryYou,
  majorVictoryOpponent,
  minorVictoryYou,
  minorVictoryOpponent,
  Deuce
}

class Score with ChangeNotifier {
  int turns = 5;
  int yourScore = 0;
  int opponentScore = 0;
  late List<TurnScore> turnsScoreList;
  late List<BattleTactic> _playerBattleTacticList;
  late List<BattleTactic> _opponentBattleTacticList;

  void buildScore(BattlePlan battleplan) {
    List<TurnScore> list = [];
    for (int i = 1; i <= turns; i++)
      list.add(
          TurnScore(i, battleplan.objectiveList, battleplan.objectiveList));
    turnsScoreList = list;
    setInitialBattleTacticList((battleplan.index / 100).truncate());
    print(_playerBattleTacticList);
  }

  void setScorePoint(int turn, int index) {
    turnsScoreList[turn - 1].listScore[index] =
        !turnsScoreList[turn - 1].listScore[index];
    notifyListeners();
  }

  void setInitialBattleTacticList(int index) {
    _playerBattleTacticList = Repository.listBattleTactics
        .where((bp) => (bp.index / 100).truncate() == index)
        .toList();
    _opponentBattleTacticList = Repository.listBattleTactics
        .where((bp) => (bp.index / 100).truncate() == index)
        .toList();
  }

  void selectBattleTactic(selPlayer player, int index) {
    if (player == selPlayer.PLAYER) {
      _playerBattleTacticList.removeWhere((bt) => bt.index == index);
    } else {
      _opponentBattleTacticList.removeWhere((bt) => bt.index == index);
    }
  }

  List<BattleTactic> get opponentBattleTacticList => _opponentBattleTacticList;

  List<BattleTactic> get playerBattleTacticList => _playerBattleTacticList;

  void addPreviousBt(selPlayer player, int turn) {
    if (player == selPlayer.PLAYER) {
      if (turnsScoreList[turn].playerBattleTactic != BattleTactic(0, [])) {
        _playerBattleTacticList.add(turnsScoreList[turn].playerBattleTactic);
      }
    } else {
      if (turnsScoreList[turn].opponentBattleTactic != BattleTactic(0, [])) {
        _opponentBattleTacticList.add(turnsScoreList[turn].playerBattleTactic);
      }
    }
  }
}
