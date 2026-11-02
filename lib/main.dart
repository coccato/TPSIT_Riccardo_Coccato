import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 // This widget is the root of your application.
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Flutter Demo',
     theme: ThemeData(
   
       // tested with just a hot reload.
       colorScheme: .fromSeed(seedColor: Colors.deepPurple),
     ),
     home: const MyHomePage(title: 'Flutter Demo Home Page'),
   );
 }
}

class MyHomePage extends StatefulWidget {
 const MyHomePage({super.key, required this.title});

 final String title;

 @override
 State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var risultato=-1;
var stream;
Random rm =Random();
void init(){
  List<int> lista=[];
for (int i=0; i<5; i++){
 lista.add(rm.nextInt(10));
}
    stream = Stream.fromIterable(lista);

}


Future<void> prova() async {
 init();
 await for(var data in stream){
   setState(() {
     risultato=data;
   });
   await Future.delayed(const Duration(seconds: 1));
 }
}

 

 @override
 Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar( backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text(widget.title),),
     body: Center(
       child: Column(
      
         mainAxisAlignment: .center,
         children: [
           Text(risultato.toString()),
           TextField(
           decoration: InputDecoration(
             labelText: 'Inserisci la sequenza',
             border: OutlineInputBorder(),
           )),
         ],
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: prova,
       tooltip: 'Avvia il gioco',
       child: const Icon(Icons.add),
     ),
   );
 }
}

