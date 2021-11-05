class BattlePlan{
  final int index;
  final String name;
  final String battlepack;

  BattlePlan(this.index, this.name, this.battlepack);

  @override
  String toString() {
    return 'BattlePlan{index: $index, name: $name, battlepack: $battlepack}';
  }
}