import 'package:aoscompanion/model/battle_tactic.dart';
import 'package:aoscompanion/model/turn_objective.dart';
import 'package:aoscompanion/model/turn_score.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/providers/score.dart';

import '../common.dart';

class PlayerScore extends StatelessWidget {
  final TurnScore scoreTurn;
  final selPlayer chosenPlayer;

  PlayerScore(this.scoreTurn, this.chosenPlayer);

  @override
  Widget build(BuildContext context) {
    final score = Provider.of<Score>(context);
    final settings = Provider.of<PreGameSettings>(context);
    bool getObjectiveDone(TurnObjective objective){
      if(chosenPlayer==selPlayer.PLAYER){
        return score.turnsScoreList[scoreTurn.turnNumber - 1]
            .playerPrimaryScore[objective.index];
      }
      else{
        return score.turnsScoreList[scoreTurn.turnNumber - 1]
          .opponentPrimaryScore[objective.index];
      }
    }
    return Column(
      children: [
        Text(chosenPlayer == selPlayer.PLAYER
            ? settings.player.playerName
            : settings.opponent.playerName),
        Column(
          children: scoreTurn.objectivesList
              .map((objective) => ListTile(
                    title: Text(objective.title[0]),
                    trailing: Checkbox(
                      onChanged: (bool? value) {
                        var turn = scoreTurn.turnNumber;
                        print(turn);
                        print(objective.index);
                        score.setScoreObjective(chosenPlayer,turn, objective.index);
                      },
                      value: getObjectiveDone(objective),
                    ),
                  ))
              .toList(),
        ),
        Container(
          child: ListTile(
            leading: PopupMenuButton<BattleTactic>(
                child: Icon(Icons.edit),
                onSelected: (BattleTactic bt) => score.selectBattleTactic(
                    chosenPlayer, bt, scoreTurn.turnNumber),
                itemBuilder: (BuildContext context) {
                  score.addPreviousBt(chosenPlayer, scoreTurn.turnNumber);
                  List<BattleTactic> chosenList =
                      chosenPlayer == selPlayer.PLAYER
                          ? score.playerBattleTacticList
                          : score.opponentBattleTacticList;
                  return chosenList
                      .map<PopupMenuItem<BattleTactic>>((bt) => PopupMenuItem(
                            child: Text(bt.name[0]),
                            value: bt,
                          ))
                      .toList();
                }),
            title: Text(chosenPlayer==selPlayer.PLAYER?scoreTurn.playerBattleTactic.name[0]:scoreTurn.opponentBattleTactic.name[0]),
            trailing: Checkbox(
              value: chosenPlayer==selPlayer.PLAYER?scoreTurn.playerBtDone:scoreTurn.opponentBtDone,
              onChanged: (bool? value) =>score.setScoreBattleTactic(chosenPlayer,scoreTurn.turnNumber),
            ),
          ),
        )
      ],
    );
  }
}
