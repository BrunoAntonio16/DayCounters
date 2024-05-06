import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime initialDate = DateTime(2024, 06, 04);
  DateTime finalDate = DateTime(2024, 06, 04);
  Duration diferenceDates = Duration(days: 30);
  String diferenceDatesS = '';

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
        padding: EdgeInsets.all(10),
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
                  Text(
                    'Data inicial',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  TextFormField(
                    onChanged: (text) => {
                      setState(() {
                        initialDate = DateTime.parse(text);
                      })
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        //hintText: initialDateS,
                        //hintStyle: TextStyle(
                        //color: Colors.white,
                        //fontWeight: FontWeight.w400,
                        //fontSize: 20,
                        //),
                        helperText:
                            'Insira a data no seguinte formato: 2024-08-13',
                        helperStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        border: OutlineInputBorder()),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
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
                  TextFormField(
                    onChanged: (text) => {
                      setState(() {
                        finalDate = DateTime.parse(text);
                      })
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        helperText:
                            'Insira a data no seguinte formato: 2024-08-13',
                        helperStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        border: OutlineInputBorder()),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
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
                  Text(
                    'Diferença de dias entre as datas',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        //labelText: "Data Inicial",
                        hintText: diferenceDatesS,
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                        border: const OutlineInputBorder()),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
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
                  diferenceDates = finalDate.difference(initialDate);
                  diferenceDatesS = diferenceDates.inDays.toString();
                }),
              },
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
