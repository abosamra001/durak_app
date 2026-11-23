import 'package:flutter/material.dart';

enum AppointmentStatus { waiting, done, canceled }

enum CalendarStatus {
  all(Colors.deepPurple),
  waiting(Colors.amber),
  done(Colors.green),
  canceled(Colors.red);

  const CalendarStatus(this.color);

  final Color color;
}
