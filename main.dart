import "dart:io";

void main() {
  List<Map<String, dynamic>> alunos = [];
  double nota;
  String? nomeAluno;

  while (true) {
    List<double> notas = [];

    print("Informe o nome do Aluno: ");
    nomeAluno = stdin.readLineSync();

    for (var i = 0; i < 3; i++) {
      do {
        print("Informe a ${i + 1} º nota do aluno");
        String? inputNota = stdin.readLineSync();
        nota = double.parse(inputNota!);

        if (nota > 10 || nota < 0) {
          print("A nota informada é maior que 10 ou menor que 0!");
          print("infome uma nota válida!");
        }
      } while (nota > 10 || nota < 0);

      notas.add(nota);
    }

    alunos.add({"nome": nomeAluno, "notas": notas});

    print("Deseja adicionar mais um aluno? (s/n)");
    String? resposta = stdin.readLineSync();

    if (resposta != null && resposta.toLowerCase() == "n") {
      break;
    }
  }

  print("\n ================= Relatório Final ===================== \n");

  for (var aluno in alunos) {
    print("\nNome do Aluno: ${aluno["nome"]}");
    print("Notas do Aluno: ${aluno['notas'].join(", ")}");
    double media = (aluno["notas"] as List<double>).reduce((a, b) => a + b) / 3;
    print("Média: ${media.toStringAsFixed(2)}");
    media >= 7
        ? print("Classificação: Aprovado")
        : media < 7 && media >= 5
            ? print("Classificação: Em Recuperação")
            : print("Classificação: Reprovado");
  }
}
