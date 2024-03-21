import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';


class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Book Appointment",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Choose consultation form",
            style: TextStyle(fontSize: 24),),
            SizedBox(height: 5),

    ]),
        SizedBox(height: 20),
        CustomWidget(
          imagePath: 'lib/Images/img_8.png',
          title: "Online",
          onPressed: () {
            // Handle onPressed action
          },
        ),

        SizedBox(height: 20),
        CustomWidget(
          imagePath: 'lib/Images/img_8.png',
          title: "In-Person",
          onPressed: () {
            // Handle onPressed action
          },
        ),
        SizedBox(height: 20),
        TableCalendar(
  focusedDay: DateTime.now(), // Set focusedDay to the current date
  firstDay: DateTime.utc(2024, 1, 1), // Set the first selectable day
  lastDay: DateTime.utc(2024, 12, 31), // Set the last selectable day
  calendarFormat: CalendarFormat.month,
  headerStyle: HeaderStyle(
    titleTextStyle: TextStyle(fontSize: 20),
  ),
  daysOfWeekStyle: DaysOfWeekStyle(
    weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
    weekendStyle: TextStyle(fontWeight: FontWeight.bold),
  ),
  calendarStyle: CalendarStyle(
    todayDecoration: BoxDecoration(
      color: Colors.blue.withOpacity(0.5),
      shape: BoxShape.circle,
    ),
    selectedDecoration: BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
    ),
  ),
  onDaySelected: (selectedDay, focusedDay) {
    print('Selected day: $selectedDay');
  },
),

      ],
    ),
    );
  }

  void _handleSearch(String input) {
    // Handle search logic
  }
}

class CustomWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  const CustomWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Image.asset(imagePath,width: 70,
                height: 70),
            SizedBox(width: 10),
            SizedBox(width: 20),
            Expanded(
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.center, // Center align the children
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                      textAlign: TextAlign.center, // Center align the text
                    ),
                  SizedBox(height: 5),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


