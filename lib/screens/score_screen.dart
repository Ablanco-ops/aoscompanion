import 'dart:ui';

import 'package:aoscompanion/decoration.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';
import 'package:aoscompanion/widgets/score_card.dart';

import '../common.dart';

class ScoreScreen extends StatelessWidget {
  static const routeName = "/ScoreScreen";

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<PreGameSettings>(context);
    final score = Provider.of<Score>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "${settings.player.playerName} ${score.yourScore} - ${score.opponentScore} ${settings.opponent.playerName}")),
      body: Container(
        margin: gameConfigScreenCardMargin,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child: DefaultTabController(
            length: score.turnsScoreList.length,
            child: Column(
              children: [
                TabBar(
                  tabs: score.turnsScoreList.map((turn) => Tab(
                    child: Text(
                      (turn.turnNumber).toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  )).toList(),
                ),
                Container(
                  padding: const EdgeInsets.only(top:10,bottom: 10),
                  height: 600,
                  child: TabBarView(
                    children: score.turnsScoreList.map((turn) => ScoreCard(turn)).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
