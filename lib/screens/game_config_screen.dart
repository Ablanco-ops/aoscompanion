import 'package:aoscompanion/common.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
import 'package:aoscompanion/widgets/attacker_config_card.dart';
import 'package:aoscompanion/widgets/battleplan_card.dart';
import 'package:aoscompanion/widgets/player_config_card.dart';
import 'package:flutter/material.dart';

class GameConfigScreen extends StatelessWidget {
  static const routeName = "/PreGame";

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<PreGameSettings>(context);
    // void launch(){
    // settings.toString();
    // }
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pre_game_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GameConfigCard(AppLocalizations.of(context)!.you, true),
            GameConfigCard(AppLocalizations.of(context)!.opponent, false),
            BattleplanCard(),
            AttackerConfigCard(),
            ElevatedButton(
              onPressed: ()=>print(settings.toString()),
              child: Text(
                AppLocalizations.of(context)!.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
