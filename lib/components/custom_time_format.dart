import 'package:flutter/material.dart';

class CustomTimeFormat extends StatefulWidget {
  const CustomTimeFormat({super.key});

  @override
  State<CustomTimeFormat> createState() => _CustomTimeFormatState();
}

class _CustomTimeFormatState extends State<CustomTimeFormat> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    var time = selectedTime;

    return Column(
      children: [
        Text(
          time == null
              ? "You haven't picked a time yet."
              : time.format(context),
        ),
        ElevatedButton(
          onPressed: () async {
            var pickedTime = await showTimePicker(
              context: context,
              initialEntryMode: TimePickerEntryMode.dial,
              initialTime: TimeOfDay.now(),
            );
            if (pickedTime != null) {
              setState(() {
                selectedTime = pickedTime;
              });
            }
          },
          child: Icon(Icons.calendar_today),
        )
      ],
    );
  }
}
