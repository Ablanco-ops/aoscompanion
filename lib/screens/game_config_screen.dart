import 'package:aoscompanion/common.dart';
import 'package:aoscompanion/widgets/attacker_config_card.dart';
import 'package:aoscompanion/widgets/battleplan_card.dart';
import 'package:aoscompanion/widgets/player_config_card.dart';
import 'package:flutter/material.dart';

class GameConfigScreen extends StatelessWidget {
  static const routeName = "/PreGame";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pre_game_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GameConfigCard(AppLocalizations.of(context)!.you),
            GameConfigCard(AppLocalizations.of(context)!.opponent),
            BattleplanCard(),
            AttackerConfigCard(),
            ElevatedButton(
              onPressed: () {},
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
