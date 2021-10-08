import 'package:aoscompanion/decoration.dart';

import '../common.dart';

class AttackerConfigCard extends StatefulWidget {
  @override
  _AttackerConfigCardState createState() => _AttackerConfigCardState();
}

class _AttackerConfigCardState extends State<AttackerConfigCard> {
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
              Checkbox(value: false, onChanged: (value){}),
              Text(AppLocalizations.of(context)!.opponent),
              Checkbox(value: false, onChanged: (value){}),
            ],
          ),
        ),
      ),
    );
  }
}
