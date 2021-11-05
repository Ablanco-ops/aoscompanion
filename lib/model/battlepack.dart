class Battlepack{
  final int index;
  final List<String> name;

  Battlepack(this.index, this.name);

  @override
  String toString() {
    return 'Battlepack{index: $index, name: $name}';
  }
}