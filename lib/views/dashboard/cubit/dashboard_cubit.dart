import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  int selectedBottomNavigationIndex = 0;
  DashboardCubit() : super(DashboardInitial());

  void selectBottomNavigation(int index){
    emit(DashboardBottomNavigationToggle(selectedIndex: index));
  }

}
