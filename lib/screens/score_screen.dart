import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';
import 'package:aoscompanion/widgets/player_score_card.dart';

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
      body: Card(
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
                height: 300,
                child: TabBarView(
                  children: score.turnsScoreList.map((turn) => PlayerScoreCard(turn)).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
