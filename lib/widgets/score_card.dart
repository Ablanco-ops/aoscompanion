import 'package:aoscompanion/decoration.dart';
import 'package:aoscompanion/model/turn_score.dart';
import 'package:aoscompanion/widgets/player_score.dart';

import '../common.dart';

class ScoreCard extends StatelessWidget {
  final TurnScore scoreTurn;

  ScoreCard(this.scoreTurn);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            margin: gameConfigScreenCardMargin,
              color: redAOS, child: PlayerScore(scoreTurn, selPlayer.PLAYER)),
          SizedBox(height: 15),
          Container(
              margin: gameConfigScreenCardMargin,
              color: blueAOS,
              child: PlayerScore(scoreTurn, selPlayer.OPPONENT)),
        ],
      ),
    );
  }
}
