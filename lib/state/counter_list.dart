import 'package:flutter/material.dart';
import 'package:flutter_counter_app/components/counter.dart';

class CounterListProvider extends ChangeNotifier {
  final List<Counter> _counterList = [];

  List<Counter> get counterList => _counterList;

  void addCounter() {
    _counterList.add(Counter(
      onClose: () {},
    ));
    notifyListeners();
  }

  void removeCounter(int index) {
    if (index >= 0 && index < _counterList.length) {
      _counterList.removeAt(index);
      notifyListeners();
    }
  }

  void reset() {
    _counterList.clear();
    notifyListeners();
  }

  void reorderCounters(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final Counter movedItem = _counterList.removeAt(oldIndex);
    _counterList.insert(newIndex, movedItem);
    notifyListeners();
  }
}
