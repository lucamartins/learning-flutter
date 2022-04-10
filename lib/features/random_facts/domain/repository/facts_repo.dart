import 'dart:convert';
import '../models/facts_model.dart';
import 'package:http/http.dart' as http;

abstract class IFactsRepository {
  void getNewFact();
}

class FactsRepository implements IFactsRepository {
  @override
  Future<Fact> getNewFact() async {
    var url = Uri.parse('https://api.chucknorris.io/jokes/random');
    var res = await http.get(url);
    var data = jsonDecode(res.body);
    var newFact = Fact.fromJson(data);

    return newFact;
  }
}
