import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/auth/user_provider.dart';
import 'package:todoapp/tabs/tasks/task_item.dart';
import 'package:todoapp/tabs/tasks/tasks_provider.dart';

class TaskTab extends StatefulWidget {
  const TaskTab({super.key});

  @override
  State<TaskTab> createState() => _TaskTabState();
}

class _TaskTabState extends State<TaskTab> {
  late String userId;
  late TasksProvider tasksProvider;
  bool shouldGetTasks = true; //flag
  @override
  // void initState() {
  //   super.initState();
  //   // بس scope initState دول هيتشافو جوه
  // userId = Provider.of<UserProvider>(context).currentUser!.id;
  // tasksProvider = Provider.of<TasksProvider>(context)..getTasks(userId);
  // }

  @override
  Widget build(BuildContext context) {
    if (shouldGetTasks) {
      //هيتفزو مره واحده بس
      userId = Provider.of<UserProvider>(context).currentUser!.id;
      tasksProvider = Provider.of<TasksProvider>(context)..getTasks(userId);
      shouldGetTasks = false;
    }
    return Column(
      children: [
        TimelineCalendar(
          calendarType: CalendarType.GREGORIAN,
          calendarLanguage: "en",
          calendarOptions: CalendarOptions(
            viewType: ViewType.DAILY,
            toggleViewType: true,
            headerMonthElevation: 10,
            headerMonthShadowColor: Colors.black26,
            headerMonthBackColor: Colors.transparent,
          ),
          dayOptions: DayOptions(
              compactMode: true,
              weekDaySelectedColor: Theme.of(context).primaryColor,
              selectedBackgroundColor: Theme.of(context).primaryColor,
              disableDaysBeforeNow: true),
          headerOptions: HeaderOptions(
              weekDayStringType: WeekDayStringTypes.SHORT,
              monthStringType: MonthStringTypes.FULL,
              backgroundColor: Theme.of(context).primaryColor,
              headerTextColor: Colors.black),
          dateTime: CalendarDateTime(
              year: tasksProvider.selectedDate.year,
              month: tasksProvider.selectedDate.month,
              day: tasksProvider.selectedDate.day),
          onChangeDateTime: (calendarDatetime) {
            tasksProvider.changeSelectedDate(
                calendarDatetime.toDateTime(), userId);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => TaskItem(tasksProvider.tasks[index]),
            itemCount: tasksProvider.tasks.length,
          ),
        ),
      ],
    );
  }
}
