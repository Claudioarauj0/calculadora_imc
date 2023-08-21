import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
     debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
  
}

class HomeState extends State<Home> {
  
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String resultadoText = ""; //aqui sai o resultado

  void resetFields() {
    weightController.text = "";
    heightController.text = "";
    setState(() {
      resultadoText = ""; //aqui sai o resultado
      formKey = GlobalKey<FormState>();
    });
  }

  void calcular() {
    setState(() {
      double Weidget = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = Weidget / (height * height);
      print(imc);
      if (imc < 18.6) {
        resultadoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        resultadoText = "Peso ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        resultadoText =
            "Levemente acima do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        resultadoText = "Obesidade grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        resultadoText = "Obesidade grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        resultadoText = "Obesidade grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CALCULADORA DE IMC"),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: resetFields, icon: const Icon(Icons.refresh)),
          ],
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.person, size: 120.0, color: Colors.black),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Peso (KG)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  controller: weightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira seu Peso";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black, fontSize: 20.0),
                  controller: heightController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Insira sua Altura";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          calcular();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: const Text("Calcular",
                          style: TextStyle(fontSize: 20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(resultadoText,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0)),
                ),
              ],
            ),
          )),
        ));
  }
}
