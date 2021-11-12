import 'package:aoscompanion/model/battle_tactic.dart';
import 'package:aoscompanion/model/turn_score.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';
import 'package:aoscompanion/widgets/player_score.dart';

import '../common.dart';

class ScoreCard extends StatelessWidget {
  final TurnScore scoreTurn;

  ScoreCard(this.scoreTurn);

  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
    final settings = Provider.of<PreGameSettings>(context);
    return Container(
      child: Column(
        children: [
          PlayerScore(scoreTurn, selPlayer.PLAYER),
          SizedBox(height: 15),
          PlayerScore(scoreTurn, selPlayer.OPPONENT),
        ],
      ),
    );
  }
}
