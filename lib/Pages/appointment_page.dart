import 'package:debtstiny/Components/appointment_widget.dart';
import 'package:debtstiny/Components/top_backBar.dart';
import 'package:debtstiny/Pages/advisor_page.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:debtstiny/Components/button.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3FCF7),
      appBar: TopBackBar(
        title: 'Appointment Booking',
        onBack: () {
          Navigator.of(context).pop();
        },
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Book Appointment",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Choose consultation form",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 5),
            ],
          ),
          AppointmentWidget(
            imagePath: 'lib/Images/online.png',
            title: "Online",
          ),
          SizedBox(height: 20),
          AppointmentWidget(
            imagePath: 'lib/Images/in-person.png',
            title: "In-Person",
          ),
          SizedBox(height: 10),
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2024, 1, 1),
            lastDay: DateTime.utc(2024, 12, 31),
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
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Button(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdvisorPage(),
                ),
              );
            },
            title: 'Done',
            width: 50,
          ),
        ],
      ),
    );
  }
}
