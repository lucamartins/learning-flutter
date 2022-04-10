import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFirstPanelOpen = false;
  bool _isSecondPanelOpen = false;

  void _togglePanel(int index, bool isExpanded) {
    setState(() {
      if (index == 0) {
        _isFirstPanelOpen = !_isFirstPanelOpen;
      } else if (index == 1) {
        _isSecondPanelOpen = !_isSecondPanelOpen;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            ExpansionPanelList(
              expansionCallback: _togglePanel,
              children: [
                ExpansionPanel(
                  headerBuilder: ((context, isExpanded) => const ListTile(
                        title: Text('Conceitos aplicados'),
                        leading: Icon(Icons.menu_book_sharp),
                      )),
                  isExpanded: _isFirstPanelOpen,
                  backgroundColor: Colors.lightGreenAccent[700],
                  canTapOnHeader: true,
                  body: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    children: const <Widget>[
                      Text('1. Widgets usuais de uma aplicação'),
                      Text('2. Contexto global utilizando Provider'),
                      Text('3. Consumir APIs e modelar os dados equivalentes'),
                      Text('4. Multi-page app que mantem estados individuais de cada pagina'),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
