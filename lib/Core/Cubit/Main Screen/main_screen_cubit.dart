import 'package:art_of_event/Features/Home%20Screen/Presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'main_screen_state.dart';

class MainScreenCubit extends Cubit<MainScreenState> {
  MainScreenCubit() : super(MainScreenInitial());
  int index = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }


  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }

}
