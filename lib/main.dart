import 'package:flutter/material.dart';
import 'package:flutter_counter_app/components/counter.dart';
import 'package:flutter_counter_app/state/counter_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterListProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container Examples'),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer<CounterListProvider>(
                builder: (context, counterListProvider, child) {
                  return counterListProvider.counterList.isEmpty
                      ? const Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Empty",
                              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      : ReorderableListView.builder(
                          onReorder: (int oldIndex, int newIndex) {
                            context.read<CounterListProvider>().reorderCounters(oldIndex, newIndex);
                          },
                          itemCount: counterListProvider.counterList.length,
                          itemBuilder: (context, index) {
                            return Counter(
                              key: ValueKey(index), // Important: Set a unique key for each Counter widget
                              onClose: () {
                                context.read<CounterListProvider>().removeCounter(index);
                              },
                            );
                          },
                        );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterListProvider>().reset();
                      },
                      child: const Text("Reset"),
                    )
                  ],
                ),
                const SizedBox(width: 10),
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CounterListProvider>().addCounter();
                      },
                      child: const Text("Add Counter"),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
