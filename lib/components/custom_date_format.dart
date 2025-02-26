import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateFormat extends StatefulWidget {
  const CustomDateFormat({super.key});

  @override
  State<CustomDateFormat> createState() => _CustomDateFormatState();

  format(DateTime date) {}
}

class _CustomDateFormatState extends State<CustomDateFormat> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    var date = selectedDate;

    return Column(
      children: [
        Text(
          date == null
              ? "You haven't picked a date yet."
              : DateFormat('MM-dd-yyyy').format(date),
        ),
        ElevatedButton(
          onPressed: () async {
            var pickedDate = await showDatePicker(
              context: context,
              initialEntryMode: DatePickerEntryMode.calendarOnly,
              initialDate: DateTime.now(),
              firstDate: DateTime(2025),
              lastDate: DateTime(2050),
            );
            setState(() {
              selectedDate = pickedDate;
            });
          },
          child: const Icon(Icons.calendar_today),
        )
      ],
    );
  }
}
