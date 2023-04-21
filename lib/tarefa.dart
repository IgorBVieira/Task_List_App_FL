class Tarefa {
 late String nome;
  late DateTime data;
  late bool concluida; 

  Tarefa(this.nome) {
    data = DateTime.now();
    concluida = false; // inicialização do campo
  } 
}
