import 'package:aoscompanion/model/turn_objective.dart';

class BattlePlan {
  final int index;
  final List<String> name;

  final List<TurnObjective> objectiveList;

  BattlePlan(this.index, this.name, {List<TurnObjective>? objectiveList})
      : objectiveList = objectiveList ??
            [
              TurnObjective(["One objective", "Un objetivo"], 1, 1, 0),
              TurnObjective(["Two objectives", "Dos objetivos"], 1, 1, 1),
              TurnObjective(["More objectives", "Más objetivo"], 1, 1, 2)
            ];

  @override
  String toString() {
    return 'BattlePlan{index: $index, name: $name}';
  }
}
