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

  void selectBattleTactic(selPlayer player, BattleTactic bt, int turn) {
    if (player == selPlayer.PLAYER) {
      turnsScoreList[turn - 1].playerBattleTactic = bt;
      _playerBattleTacticList.remove(bt);
    } else {
      turnsScoreList[turn - 1].opponentBattleTactic = bt;
      _opponentBattleTacticList.remove(bt);
    }
    notifyListeners();
  }

  List<BattleTactic> get opponentBattleTacticList =>
      _opponentBattleTacticList.where((bt) => bt.index != 0).toList();

  List<BattleTactic> get playerBattleTacticList =>
      _playerBattleTacticList.where((bt) => bt.index != 0).toList();

  void addPreviousBt(selPlayer player, int turn) {
    var playerBt = turnsScoreList[turn - 1].playerBattleTactic;
    var opponentBt = turnsScoreList[turn - 1].opponentBattleTactic;

    if (player == selPlayer.PLAYER) {
      if (!_playerBattleTacticList.contains(playerBt))
        _playerBattleTacticList.add(playerBt);
    } else {
      if (_opponentBattleTacticList.contains(opponentBt))
        _opponentBattleTacticList.add(opponentBt);
    }
  }
}
