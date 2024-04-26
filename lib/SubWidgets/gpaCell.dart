// ignore_for_file: must_be_immutable
import 'package:bisguide/Models/constats.dart';
import 'package:bisguide/Models/subjects.dart';
import 'package:flutter/material.dart';

class GpacCell extends StatefulWidget {
  String type;
  Subjects subject = Subjects(0, 0);
  GpacCell({super.key, required this.type});

  @override
  State<GpacCell> createState() => _GpacCellState();
  double getMult() {
    return subject.grade * subject.hours;
  }
}

class _GpacCellState extends State<GpacCell> {
  bool _isAr = MyConstents.language == 'ar';
  final TextEditingController _pointsController = TextEditingController();
  final TextEditingController _hrsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 100,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: _isAr ? 'المعدل' : 'GPA',
            ),
            controller: _pointsController,
            onChanged: (value) {
              widget.subject.grade = double.parse(value);
            },
          ),
        ),
        SizedBox(
          width: 100,
          height: 40,
          child: TextField(
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 12),
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: _isAr ? 'الساعات' : 'Hrs',
            ),
            controller: _hrsController,
            onChanged: (value) {
              widget.subject.hours = int.parse(value);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            height: 40,
            child: TextField(
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: widget.type,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
