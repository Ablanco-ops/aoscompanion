import 'package:aoscompanion/model/battleplan.dart';
import 'package:aoscompanion/model/player.dart';
import 'package:aoscompanion/model/realm.dart';
import 'package:aoscompanion/providers/game_config_repository.dart';

class PreGameSettings{
  Realm realm=GameConfigRepository.realms[0];
  BattlePlan battlePlan=GameConfigRepository.battlePlans[0];
  Player player=Player(playerName: "You", faction: GameConfigRepository.factions[0], grandStrategy: GameConfigRepository.strategies[0]);
  Player opponent=Player(playerName: "Opponent", faction: GameConfigRepository.factions[0], grandStrategy: GameConfigRepository.strategies[0]);
  bool attacker=false;

  PreGameSettings._privateConstructor();
  static final PreGameSettings _settings= PreGameSettings._privateConstructor();

  factory PreGameSettings(){
    return _settings;
  }

  @override
  String toString() {
    return 'PreGameSettings{realm: $realm, battlePlan: $battlePlan, player: $player, opponent: $opponent, attacker: $attacker}';
  }
}