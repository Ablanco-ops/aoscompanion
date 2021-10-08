import 'package:aoscompanion/model/battle_tactic.dart';

class Turn{
  int obj1;
  int obj2;
  int obj3;
  int obj4;
  BattleTactic battleTactic;

  Turn({this.obj1=-1, this.obj2=-1, this.obj3=-1, this.obj4=-1, required this.battleTactic});
}