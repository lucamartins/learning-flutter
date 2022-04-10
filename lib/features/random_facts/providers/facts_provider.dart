import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/random_facts/domain/models/facts_model.dart';
import 'package:flutter_application_1/features/random_facts/domain/repository/facts_repo.dart';

class FactsProvider with ChangeNotifier {
  final List<Fact> _facts = [];
  var factsRepo = FactsRepository();
  int _numberApiCalls = 0;
  bool _loading = false;

  int get numberApiCalls => _numberApiCalls;
  bool get loading => _loading;
  List<Fact> get facts => _facts;

  void getNewFact() async {
    _loading = true;
    _numberApiCalls++;
    notifyListeners();

    var newFact = await factsRepo.getNewFact();
    _facts.add(newFact);
    _loading = false;
    notifyListeners();
  }

  void clearData() {
    _facts.removeRange(0, _facts.length);

    notifyListeners();
  }
}
