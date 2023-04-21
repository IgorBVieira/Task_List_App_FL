import 'package:flutter/material.dart';
import 'tarefa.dart';

void main() {
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'TodoList App', home: ListaScreen());
  }
}

class ListaScreen extends StatefulWidget {
  const ListaScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaScreenState();
  }
}

class ListaScreenState extends State<ListaScreen> {
  List<Tarefa> tarefas = <Tarefa>[];

  TextEditingController controller = TextEditingController();

  void adicionaTarefa(String nome) {
    setState(() {
      tarefas.add(Tarefa(nome));
    });

    controller.clear();
  }

  Widget getItem(Tarefa tarefa) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Card(
            margin: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: IconButton(
                  icon: Icon(
                    tarefa.concluida
                        ? Icons.check_box
                        : Icons.check_box_outline_blank,
                    size: 42.0,
                    color: Colors.green,
                  ),
                  padding: const EdgeInsets.only(left: 10.0, right: 30.0),
                  onPressed: () {
                    setState(() {
                      tarefa.concluida == false
                          ? tarefa.concluida = true
                          : tarefa.concluida = false;
                    });
                  }),
              title: Text(
                tarefa.nome,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(tarefa.data.toIso8601String()),
              trailing: const Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Tarefas")),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black, style: BorderStyle.solid, width: 6)),
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: controller, onSubmitted: adicionaTarefa)),
          Expanded(
              child: ListView.builder(
            itemCount: tarefas.length,
            itemBuilder: (_, indice) {
              return getItem(tarefas[indice]);
            },
          ))
        ],
      ),
    );
  }
}
