import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/realm.dart';
import 'package:aoscompanion/providers/game_config_repository.dart';
import 'package:provider/provider.dart';

import '../common.dart';
import '../decoration.dart';

class BattleplanCard extends StatefulWidget {
  @override
  State<BattleplanCard> createState() => _BattleplanCardState();
}

class _BattleplanCardState extends State<BattleplanCard> {
  Realm? _chosenRealm;
  BattlePlan? _chosenBattlePlan;

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameConfig>(context, listen: false);
    return Card(
      margin:  gameConfigScreenCardMargin,
      child: Column(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.realm),
            trailing: DropdownButton(
                value: _chosenRealm ??= game.realms[0],
                onChanged: (Realm? newValue) {
                  setState(() {
                    _chosenRealm = newValue;
                  });
                },
                items: game.realms.map<DropdownMenuItem<Realm>>((Realm value) {
                  return DropdownMenuItem<Realm>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList()),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.battleplan),
            trailing: DropdownButton(
                value: _chosenBattlePlan ??= game.battlePlans[0],
                onChanged: (BattlePlan? newValue) {
                  setState(() {
                    _chosenBattlePlan = newValue;
                  });
                },
                items: game.battlePlans
                    .map<DropdownMenuItem<BattlePlan>>((BattlePlan value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
