import 'package:aoscompanion/model/battlepack.dart';
import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/faction.dart';
import 'package:aoscompanion/model/grand_strategy.dart';
import 'package:aoscompanion/model/player.dart';
import 'package:aoscompanion/model/realm.dart';
import 'package:aoscompanion/model/turn_objective.dart';

import '../common.dart';

class PreGameSettings with ChangeNotifier {
  int numberTurns=5;
  Realm realm = Realm(01, "Ghur");
  Battlepack battlePack = Battlepack(11, ["Contest of Generals"]);
  BattlePlan battlePlan = BattlePlan(1101, ["Frontal Assault"]);
  Player player = Player(
      playerName: "You",
      faction: Faction(101, "Cities of Sigmar"),
      grandStrategy: GrandStrategy(01, ["Beast Master"]));
  Player opponent = Player(
      playerName: "Opponent",
      faction: Faction(101, "Cities of Sigmar"),
      grandStrategy: GrandStrategy(01, ["Beast Master"]));
  bool attacker = false;

  List<Faction> _factions = [
    Faction(101, "Cities of Sigmar"),
    Faction(102, "Daughters of Khaine"),
    Faction(103, "Fyreslayers"),
    Faction(104, "Idoneth Deepkin"),
    Faction(105, "Kharadron Overlords"),
    Faction(106, "Lumineth Realmlords"),
    Faction(107, "Seraphon"),
    Faction(108, "Strormcast Eternals"),
    Faction(109, "Sylvaneth"),
    Faction(201, "Beast of Chaos"),
    Faction(202, "Blades of Khorne"),
    Faction(203, "Disciples of Tzeentch"),
    Faction(204, "Hedonites of Slaanesh"),
    Faction(205, "Legion of Azgorth"),
    Faction(206, "Legion of the First Prince"),
    Faction(207, "Maggotkin of Nurgle"),
    Faction(208, "Skaven"),
    Faction(209, "Slaves to Darkness"),
    Faction(301, "Flesheater Courts"),
    Faction(302, "Nighthaunt"),
    Faction(303, "Ossiarch Bonereapers"),
    Faction(304, "Soulblight Gravelords"),
    Faction(401, "Gloomspite Gitz"),
    Faction(402, "Ogor Mawtribes"),
    Faction(403, "Orruk Warclans"),
    Faction(404, "Sons of Behemat")
  ];
  List<GrandStrategy> _strategies = [
    GrandStrategy(01, ["Beast Master"]),
    GrandStrategy(02, ["Dominating Presence"]),
    GrandStrategy(03, ["Hold the Line"]),
    GrandStrategy(04, ["Pillars of Belief"]),
    GrandStrategy(05, ["Predator's Domain"]),
    GrandStrategy(06, ["Prized Sorcery"]),
    GrandStrategy(07, ["Sever the Head"]),
    GrandStrategy(08, ["Vendetta"]),
  ];
  List<Realm> _realms = [Realm(01, "Ghur")];

  List<Battlepack> _battlePacks = [
    Battlepack(11, ["Contest of Generals"]),
    Battlepack(12, ["Pitched Battles 2021"])
  ];

  List<BattlePlan> _battlePlans = [
    BattlePlan(1101, ["Frontal Assault"]),
    BattlePlan(1102, ["Burn and Pillage"]),
    BattlePlan(1103, ["Rising Power"]),
    BattlePlan(1211, ["Marking Territory"], objectiveList: []),
    BattlePlan(1212, ["Savage Gains"]),
    BattlePlan(1213, ["First Blood"]),
    BattlePlan(1214, [
      "Power Struggle"
    ], objectiveList: [
      TurnObjective(["One Objective 2+ turns", "Un Objetivo 2+ turnos"], 1, 2,0),
      TurnObjective(
          ["Two Objectives 2+ turns", "Dos Objetivos 2+ turnos"], 1, 2,1),
      TurnObjective(["More objectives", "Más objetivo"], 1, 1,2)
    ]),
    BattlePlan(1215, ["Survival of the Fittest"]),
    BattlePlan(1216, [
      "Tectonic Interference"
    ], objectiveList: [
      TurnObjective(["Alpha objective", "Objetivo Alfa"], 2, 1,0),
      TurnObjective(["Beta objectives", "Objetivo Beta"], 1, 1,1)
    ]),
    BattlePlan(1221, ["Apex Predators"]),
    BattlePlan(1222, ["The Vice"]),
    BattlePlan(1223, ["Tooth and Nail"]),
    BattlePlan(1224, ["Feral Foray"]),
    BattlePlan(1225, ["Power in Numbers"]),
    BattlePlan(1226, ["The Veins of Ghur"]),
  ];

  List<Realm> get realms => _realms;

  List<Battlepack> get battlepacks => _battlePacks;

  List<BattlePlan> get battlePlans => _battlePlans
      .where((plan) => (plan.index / 100).truncate() == battlePack.index)
      .toList();

  List<Faction> get factions => _factions;

  List<GrandStrategy> get strategies => _strategies;

  @override
  String toString() {
    return 'PreGameSettings{realm: $realm, battlePack: $battlePack, battlePlan: $battlePlan, player: $player, opponent: $opponent, attacker: $attacker}';
  }

// Realm realm=PreGameSettings.realms[0];
// BattlePlan battlePlan=PreGameSettings.battlePlans[0];
// Player player=Player(playerName: "You", faction: PreGameSettings.factions[0], grandStrategy: PreGameSettings.strategies[0]);
// Player opponent=Player(playerName: "Opponent", faction: PreGameSettings.factions[0], grandStrategy: PreGameSettings.strategies[0]);
// bool attacker=false;
//

}
