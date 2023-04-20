abstract class TabBoxState {}

class TabBoxSelected extends TabBoxState {
  final int tabIndex;

  TabBoxSelected(this.tabIndex);
}