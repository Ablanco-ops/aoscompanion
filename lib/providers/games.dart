import 'package:aoscompanion/model/faction.dart';
import 'package:flutter/cupertino.dart';

class Games with ChangeNotifier {
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
  Map<int, String> _strategies = {
    01: "Sever the Head",
    02: "Hold the Line",
    03: "Vendetta",
    04: "Dominating Presence",
    05: "Beast Master",
    06: "Prized Sorcery",
    07: "Pillars of Belief",
    08: "Predator's Domain"
  };

  List<String> get factions {
    List<String> factList = [];
    _factions.forEach((faction) => factList.add(faction.name));
    return [...factList];
  }

  List<String> get strategies {
    List<String> stList = [];
    _strategies.forEach((key, value) => stList.add(value));
    return stList;
  }
}
