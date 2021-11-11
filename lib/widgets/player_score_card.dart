import 'package:aoscompanion/model/battle_tactic.dart';
import 'package:aoscompanion/model/turn_score.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';

import '../common.dart';

class PlayerScoreCard extends StatefulWidget {
  final TurnScore scoreTurn;

  PlayerScoreCard(this.scoreTurn);

  @override
  _PlayerScoreCardState createState() => _PlayerScoreCardState();
}

class _PlayerScoreCardState extends State<PlayerScoreCard> {
  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
    final settings = Provider.of<PreGameSettings>(context);

    return Container(
      height: 200,
      child: Column(
        children: [
          Text(settings.player.playerName),
          Column(
            children: widget.scoreTurn.playerObjectives
                .map((objective) => ListTile(
                      leading: Text(objective.title[0]),
                      trailing: Checkbox(
                        onChanged: (bool? value) {
                          var turn = widget.scoreTurn.turnNumber;
                          print(turn);
                          print(objective.index);
                          score.setScorePoint(turn, objective.index);
                        },
                        value: score
                            .turnsScoreList[widget.scoreTurn.turnNumber - 1]
                            .listScore[objective.index],
                      ),
                    ))
                .toList(),
          ),
          Container(
            child: ListTile(
              leading: PopupMenuButton<BattleTactic>(
                child: Icon(Icons.edit),
                onSelected: (BattleTactic bt)=>score.selectBattleTactic(selPlayer.PLAYER, bt.index),
                itemBuilder: (BuildContext context) {
                  //score.addPreviousBt(selPlayer.PLAYER,widget.scoreTurn.turnNumber-1);
                    return score.playerBattleTacticList
                        .map<PopupMenuItem<BattleTactic>>((bt) => PopupMenuItem(
                              child: Text(bt.name[0]),
                              value: bt,
                            ))
                        .toList();}
              ),
            ),
          )
        ],
      ),
    );
  }
}
