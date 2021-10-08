import 'package:aoscompanion/decoration.dart';
import 'package:aoscompanion/providers/pre_game_settings.dart';

import '../common.dart';

class AttackerConfigCard extends StatefulWidget {
  @override
  _AttackerConfigCardState createState() => _AttackerConfigCardState();
}

class _AttackerConfigCardState extends State<AttackerConfigCard> {
  bool _attacker = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: gameConfigScreenCardMargin,
      child: ListTile(
        title: Text(AppLocalizations.of(context)!.attacker),
        subtitle: Container(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(AppLocalizations.of(context)!.you),
              Radio(
                  value: true,
                  groupValue: _attacker,
                  onChanged: (bool? value) {
                    setState(() {
                      _attacker = value!;
                      PreGameSettings().attacker=value;
                      print(_attacker);
                    });
                  }),
              Text(AppLocalizations.of(context)!.opponent),
              Radio(
                  value: false,
                  groupValue: _attacker,
                  onChanged: (bool? value) {
                    setState(() {
                      _attacker = value!;
                      PreGameSettings().attacker=value;
                      print(_attacker);
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
