import 'package:meta/meta.dart';

@immutable
abstract class NavBarState {}

class NavBarInitial extends NavBarState {}

class NavBarChanged extends NavBarState {
  final int tabIndex;
  NavBarChanged(this.tabIndex);
}