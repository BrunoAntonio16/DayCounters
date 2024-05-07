import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dataInicial = DateTime.now();
  var _dataInicialFormat;
  DateTime _dataFinal = DateTime.now();
  var _dataFinalFormat;
  Duration diferencaEntreDatas = const Duration(days: 1);

  void _obterValorDataInicial() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(3000),
    ).then((value) => {
          setState(() {
            _dataInicial = value!;
            _dataInicialFormat = "${value!.day}-${value.month}-${value.year}";
          }),
        });
  }

  void _obterValorDataFinal() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(3000))
        .then((value) => {
              setState(() {
                _dataFinal = value!;
                _dataFinalFormat = "${value!.day}-${value.month}-${value.year}";
              }),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Container(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo_enercicio.png',
            scale: 5,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Contador de dias',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.chat,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.purple,
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data inicial',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  OutlinedButton(
                    onPressed: () => {_obterValorDataInicial()},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: Colors.purple),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: Container(
                      alignment: Alignment.center,
                      width: 400,
                      child: Text(
                        '$_dataInicialFormat',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Text(
                    'Escolha a data clicando na caixa',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data final',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  OutlinedButton(
                    onPressed: () => {_obterValorDataFinal()},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: Colors.purple),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: Container(
                      width: 400,
                      alignment: Alignment.center,
                      child: Text(
                        '$_dataFinalFormat',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const Text(
                    'Escolha a data clicando na caixa',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Diferença de dias entre as datas',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  OutlinedButton(
                    onPressed: () => {},
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(width: 2, color: Colors.purple),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: Container(
                      width: 400,
                      alignment: Alignment.center,
                      child: Text(
                        '${diferencaEntreDatas.inDays}',
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => {
                setState(() {
                  diferencaEntreDatas = _dataFinal.difference(_dataInicial);
                }),
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                width: 400,
                height: 60,
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
