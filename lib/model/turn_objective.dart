class TurnObjective{
  final int index;
  final List<String> title;
  final int value;
  final int activeTurn;
  bool done;

  TurnObjective(this.title, this.value, this.activeTurn, this.index, {this.done=false});
}