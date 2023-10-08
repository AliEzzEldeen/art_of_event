import 'package:art_of_event/Core/Cubit/Main%20Screen/main_screen_cubit.dart';
import 'package:art_of_event/Core/Utills/app_svg.dart';
import 'package:art_of_event/Features/Home%20Screen/Presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  MainScreenCubit cubit = MainScreenCubit();

  int index = 0;
  List<Widget> listScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit,
  child: BlocBuilder<MainScreenCubit, MainScreenState>(
  builder: (context, state) {
    return SafeArea(child: Scaffold(body: cubit.screens[cubit.index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  Colors.grey.shade800,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (value) {
            cubit.index = value;
            setState(() {});
          },
          currentIndex: cubit.index,
          items: [
            BottomNavigationBarItem(
                label: 'Home',
                icon: AppSVG(
                  assetName: 'home',
                  color: cubit.index == 0
                      ? Colors.black
                      : Colors.white,
                )),
            BottomNavigationBarItem(
                label: 'category',
                icon: AppSVG(
                  assetName: 'category',
                  color: cubit.index == 1
                      ? Colors.black : Colors.white,
                )),
            BottomNavigationBarItem(
                label: 'scanner',
                icon: AppSVG(
                  assetName: 'scanner',
                  color: cubit.index == 2
                      ? Colors.black : Colors.white,
                )),
            BottomNavigationBarItem(
                label: 'cart',
                icon: AppSVG(
                  assetName: 'cart',
                  color: cubit.index == 3
                      ? Colors.black : Colors.white,
                )),
          ],
        ),));
  },
),
);
  }
}

