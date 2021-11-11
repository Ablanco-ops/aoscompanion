import 'package:aoscompanion/model/battle_tactic.dart';

class Repository{
  static List<BattleTactic> _listBattleTactics=[

    BattleTactic(1101, ["Break their Spirit"]),
    BattleTactic(1102, ["Broken Ranks"]),
    BattleTactic(1103, ["Conquer"]),
    BattleTactic(1104, ["Repel"]),
    BattleTactic(1105, ["Seize the Centre"]),
    BattleTactic(1106, ["Slay the Warlord"]),
    BattleTactic(1201, ["Broken Ranks"]),
    BattleTactic(1202, ["Conquer"]),
    BattleTactic(1203, ["Slay the Warlord"]),
    BattleTactic(1204, ["Ferocious Advance"]),
    BattleTactic(1205, ["Bring it Down!"]),
    BattleTactic(1206, ["Aggressive Expansion"]),
    BattleTactic(1207, ["Monstrous Takeover"]),
    BattleTactic(1208, ["Savage Spearhead"]),
  ];

  static List<BattleTactic> get listBattleTactics => _listBattleTactics;
}