import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/random_facts/providers/facts_provider.dart';
import 'package:provider/provider.dart';
import '../components/facts_page_header.dart';

class FactsPage extends StatelessWidget {
  const FactsPage({Key? key}) : super(key: key);

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Text(
          context.watch<FactsProvider>().facts[index].factText,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Facts'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.read<FactsProvider>().clearData(),
        label: const Text('Limpar'),
        icon: const Icon(Icons.delete),
      ),
      body: Column(
        children: [
          const FactsPageHeader(),
          const Divider(color: Colors.black26, height: 10, thickness: 1),
          Flexible(
            child: Scrollbar(
              child: ListView.separated(
                padding: const EdgeInsets.all(15),
                itemBuilder: _listItemBuilder,
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: Colors.black26,
                  height: 30,
                  thickness: 1,
                ),
                itemCount: context.watch<FactsProvider>().facts.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
              ),
            ),
          )
        ],
      ),
    );
  }
}
