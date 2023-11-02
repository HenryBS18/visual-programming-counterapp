import 'package:flutter/material.dart';
import 'package:flutter_counter_app/utils/random_color.dart';

class Counter extends StatefulWidget {
  final VoidCallback onClose;

  const Counter({Key? key, required this.onClose}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  String randomColor = generateRandomHexColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse("0xFF$randomColor")),
      alignment: Alignment.center,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: widget.onClose,
                child: const Text("Close"),
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          Text(
            counter.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              // Increment the counter when the button is pressed
              setState(() {
                counter++;
              });
            },
            child: const Text("Increment"),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if (counter > 0) {
                setState(() {
                  counter--;
                });
              }
            },
            child: const Text("Decrement"),
          ),
        ],
      ),
    );
  }
}
