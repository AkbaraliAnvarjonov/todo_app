import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_event.dart';
import 'package:todo_app/bloc/tab_box_bloc/tab_box_state.dart';

class TabBoxBloc extends Bloc<TabBoxEvent, TabBoxState> {
  TabBoxBloc() : super(TabBoxSelected(0)) {
    on<TabChanged>(changeIndex);
  }

  changeIndex(TabChanged event, emit) {
    emit(TabBoxSelected(event.tabIndex));
  }
}
