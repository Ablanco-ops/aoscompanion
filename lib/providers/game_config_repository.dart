import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/faction.dart';
import 'package:aoscompanion/model/grand_strategy.dart';
import 'package:aoscompanion/model/realm.dart';

class GameConfigRepository {
  static List<Faction> _factions = [
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
  static List<GrandStrategy> _strategies = [
    GrandStrategy(01, ["Beast Master"]),
    GrandStrategy(02, ["Dominating Presence"]),
    GrandStrategy(03, ["Hold the Line"]),
    GrandStrategy(04, ["Pillars of Belief"]),
    GrandStrategy(05, ["Predator's Domain"]),
    GrandStrategy(06, ["Prized Sorcery"]),
    GrandStrategy(07, ["Sever the Head"]),
    GrandStrategy(08, ["Vendetta"]),
  ];
  static List<Realm> _realms = [Realm(01, "Ghur")];

  static List<BattlePlan> _battlePlans = [
    BattlePlan(111, "Marking Territory"),
    BattlePlan(112, "Savage Gains"),
    BattlePlan(113, "First Blood"),
    BattlePlan(114, "Power Struggle"),
    BattlePlan(115, "Survival of the Fittest"),
    BattlePlan(116, "Tectonic Interference"),
    BattlePlan(121, "Apex Predators"),
    BattlePlan(122, "The Vice"),
    BattlePlan(123, "Tooth and Nail"),
    BattlePlan(124, "Feral Foray"),
    BattlePlan(125, "Power in Numbers"),
    BattlePlan(126, "The Veins of Ghur"),
  ];

  static List<Realm> get realms => _realms;

  static List<BattlePlan> get battlePlans => _battlePlans;

  static List<Faction> get factions => _factions;

  static List<GrandStrategy> get strategies => _strategies;
}
