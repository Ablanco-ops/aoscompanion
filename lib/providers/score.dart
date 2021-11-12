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
  int numPlayerBtDone = 0;
  int numOpponentBtDone = 0;
  int playerScore = 0;
  int opponentScore = 0;
  late List<TurnScore> turnsScoreList;
  late List<BattleTactic> _playerBattleTacticList;
  late List<BattleTactic> _opponentBattleTacticList;

  void buildScore(BattlePlan battleplan) {
    numPlayerBtDone = 0;
    numOpponentBtDone = 0;
    playerScore = 0;
    opponentScore = 0;
    List<TurnScore> list = [];
    for (int i = 1; i <= turns; i++)
      list.add(TurnScore(i, battleplan.objectiveList));
    turnsScoreList = list;
    setInitialBattleTacticList((battleplan.index / 100).truncate());
  }

  void setScoreObjective(selPlayer chosenPlayer, int turn, int index) {
    if (chosenPlayer == selPlayer.PLAYER) {
      turnsScoreList[turn - 1].playerPrimaryScore[index] =
          !turnsScoreList[turn - 1].playerPrimaryScore[index];
      if (turnsScoreList[turn - 1].playerPrimaryScore[index]) {
        turnsScoreList[turn - 1].objectivesList[index].value != 0
            ? playerScore +=
                turnsScoreList[turn - 1].objectivesList[index].value
            : playerScore += turnsScoreList[turn - 1].turnNumber;
      } else {
        turnsScoreList[turn - 1].objectivesList[index].value != 0
            ? playerScore -=
                turnsScoreList[turn - 1].objectivesList[index].value
            : playerScore -= turnsScoreList[turn - 1].turnNumber;
      }
    } else {
      turnsScoreList[turn - 1].opponentPrimaryScore[index] =
          !turnsScoreList[turn - 1].opponentPrimaryScore[index];
      if (turnsScoreList[turn - 1].opponentPrimaryScore[index]) {
        turnsScoreList[turn - 1].objectivesList[index].value != 0
            ? opponentScore +=
                turnsScoreList[turn - 1].objectivesList[index].value
            : opponentScore += turnsScoreList[turn - 1].turnNumber;
      } else {
        turnsScoreList[turn - 1].objectivesList[index].value != 0
            ? opponentScore -=
                turnsScoreList[turn - 1].objectivesList[index].value
            : opponentScore -= turnsScoreList[turn - 1].turnNumber;
      }
    }

    notifyListeners();
  }

  void setScoreBattleTactic(selPlayer chosenPlayer, int turn) {
    if (chosenPlayer == selPlayer.PLAYER) {
      turnsScoreList[turn - 1].playerBtDone =
          !turnsScoreList[turn - 1].playerBtDone;
      if (turnsScoreList[turn - 1].playerBtDone) {
        numPlayerBtDone += 1;
        playerScore += 2;
      } else {
        numPlayerBtDone -= 1;
        playerScore -= 2;
      }
    } else {
      turnsScoreList[turn - 1].opponentBtDone =
          !turnsScoreList[turn - 1].opponentBtDone;
      if (turnsScoreList[turn - 1].opponentBtDone) {
        numOpponentBtDone += 1;
        opponentScore += 2;
      } else {
        numOpponentBtDone -= 1;
        opponentScore -= 2;
      }
    }
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
