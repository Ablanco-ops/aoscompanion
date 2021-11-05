import 'package:aoscompanion/model/battlepack.dart';
import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/realm.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';
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
  Battlepack? _chosenBattlepack;

  //PreGameSettings settings= PreGameSettings();
  @override
  Widget build(BuildContext context) {
    final settings= Provider.of<PreGameSettings>(context);
    //settings.battlePack?? settings.battlepacks[0];
    return Card(
      margin:  gameConfigScreenCardMargin,
      child: Column(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.realm),
            trailing: DropdownButton(
                value: _chosenRealm ?? settings.realms[0],
                onChanged: (Realm? newValue) {
                  setState(() {
                    _chosenRealm = newValue;
                    settings.realm=newValue!;
                  });
                },
                items: settings.realms.map<DropdownMenuItem<Realm>>((Realm value) {
                  return DropdownMenuItem<Realm>(
                    value: value,
                    child: Text(value.name),
                  );
                }).toList()),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.battlepack),
            trailing: DropdownButton(
                value: _chosenBattlepack ?? settings.battlepacks[0],
                onChanged: (Battlepack? newValue) {
                  setState(() {
                    _chosenBattlepack = newValue;
                    settings.battlePack=newValue!;
                    _chosenBattlePlan=settings.battlePlans[0];
                  });
                },
                items: settings.battlepacks.map<DropdownMenuItem<Battlepack>>((Battlepack value) {
                  return DropdownMenuItem<Battlepack>(
                    value: value,
                    child: Text(value.name[0]),
                  );
                }).toList()),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.battleplan),
            trailing: DropdownButton(
                value: _chosenBattlePlan ??= settings.battlePlans[0],
                onChanged: (BattlePlan? newValue) {
                  setState(() {
                    _chosenBattlePlan = newValue;
                    settings.battlePlan=newValue!;
                  });
                },
                items: settings.battlePlans
                    .map<DropdownMenuItem<BattlePlan>>((BattlePlan value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text((value.index%100).toString()+" "+value.name),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
