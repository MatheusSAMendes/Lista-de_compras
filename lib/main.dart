import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Lista de Compras',
    home: ListaProduto(),
    );
  }
}

class ListaProdutoState extends State<ListaProduto> {
  final  _suggestions =  <String> ["Cimento", "Areia", "Brita", "Telha", "Tijolos", "Tinta", "Azulejos", "Canos", "Gesso", "Argamassa"];
  final Set <String> _saved = Set<String>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        backgroundColor: Colors.black87,
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            return null;
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(String items) {
    final bool alreadySaved = _saved.contains(items);
    return ListTile(
      title: Text(items, style: _biggerFont
      ),
      trailing: Icon(
        alreadySaved ? Icons.check_box : Icons.check_box_outline_blank,
        color: alreadySaved ? Colors.green[300] : null,
      ),
      onTap: (){
        setState(() {
         if (alreadySaved){
           _saved.remove(items);
         } else {
           _saved.add(items);
         }
        });
      },
    );
  }
}

class ListaProduto extends StatefulWidget {
  @override
  ListaProdutoState createState() => ListaProdutoState();
  }