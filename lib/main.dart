import 'package:flutter/material.dart';

void main() {
  runApp(const Box());
}

class Box extends StatefulWidget {
  const Box({super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  Color colortest = Colors.red;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Draggable<String>(
                childWhenDragging: const SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: Center(
                        child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Icon(Icons.satellite_alt_rounded)))),
                data: 'red',
                feedback: Container(
                  width: 120,
                  height: 120,
                  color: Colors.green,
                  child: const Text(
                    "I'm Flying in the sky",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                onDraggableCanceled: (velocity, offset) {},
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                  child: const Center(
                    child: Text("drag me"),
                  ),
                ),
              ),
              DragTarget(
                onAcceptWithDetails: (details) {
                  colortest = Colors.orange;
                },
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    width: 200,
                    height: 200,
                    color: accepted.isEmpty ? colortest : Colors.grey,
                    child: Center(
                      child: Container(
                        color: Colors.yellow,
                        child: const Text("Drag here"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
