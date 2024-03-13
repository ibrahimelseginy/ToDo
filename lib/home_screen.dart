import 'package:flutter/material.dart';
import 'package:todoapp/tabs/tasks/add_task_bottom_sheet.dart';
import 'package:todoapp/tabs/tasks/task_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [const TaskTab()];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> appBarTitles = [
      AppLocalizations.of(context)!.toDoList,
      AppLocalizations.of(context)!.settings
    ];
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20),
          child: Text(appBarTitles[currentIndex]),
        ),
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        surfaceTintColor: Colors.white,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          //  currentIndex عن طريقbottomNavigationBar ب body هنا ربطنا ال
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_settings.png'),
                label: 'Settings'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/icon_list.png'),
                label: 'Tasks')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (_) => const AddTaskButtomSheet());
        },
        child: const Icon(
          Icons.add,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
