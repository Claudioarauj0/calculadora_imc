import 'package:flutter/material.dart';
void main(){

runApp(const MaterialApp(
home: Home(),
));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CALCULADORA DE IMC"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
        ],
      ),
      backgroundColor: Colors.white,
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
    children: [
      Icon(Icons.person, size: 120.0, color: Colors.black),
      TextField(keyboardType: TextInputType.number),
  
    ],
      ),
    );
  }
}