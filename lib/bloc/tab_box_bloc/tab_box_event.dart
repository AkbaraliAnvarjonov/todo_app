abstract class TabBoxEvent {}

class TabChanged extends TabBoxEvent {
  final int tabIndex;

  TabChanged({required this.tabIndex});
}
