import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/facts_provider.dart';

class FactsPageHeader extends StatelessWidget {
  const FactsPageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          _buildStats(context),
          _buildNewFactBtn(context),
        ],
      ),
    );
  }

  SizedBox _buildStats(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('API calls: ${context.watch<FactsProvider>().numberApiCalls}'),
            Text('Call state: ${context.watch<FactsProvider>().loading ? 'loading' : 'complete'}'),
            SizedBox(
                height: 30,
                child: Center(
                  child: context.watch<FactsProvider>().loading ? const CupertinoActivityIndicator() : const Text(''),
                )),
          ],
        ),
      ),
    );
  }

  Container _buildNewFactBtn(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () => context.read<FactsProvider>().getNewFact(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.cyan),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.add, color: Colors.white),
            Text('Get to know Chuck Norris', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
