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
String StringaUtente= "";
var stream;
String numeriUsciti="";
TextEditingController controller = TextEditingController();
Random rm =Random();
int cont=3;
void init(){
  List<int> lista=[];
for (int i=0; i<cont; i++){
  int nRandom = rm.nextInt(10);
 lista.add(nRandom);
 numeriUsciti+=nRandom.toString();
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

String risultatoUtente(){
return controller.text;
} 
bool controllo(){
  if(StringaUtente==numeriUsciti){
    cont++;
    StringaUtente="";
    numeriUsciti="";
    return true;
    
  }else{
     StringaUtente="";
    numeriUsciti="";
    return false;
  }
}
 

 @override
 Widget build(BuildContext context) {

   return Scaffold(
     appBar: AppBar( backgroundColor: Theme.of(context).colorScheme.inversePrimary,title: Text(widget.title),),
     body: Center(
       child: Column(
       mainAxisAlignment: .center,
      children:[
        Container(
         
          width: 250,
          height: 150,
          decoration: BoxDecoration(
             color: Colors.deepPurple,
             borderRadius: BorderRadius.circular(20),
             boxShadow: [
              BoxShadow(
              color: Colors.black26,
               blurRadius: 10, 
               offset: Offset(0, 4),
             ) 
             ]
          ),
          child: Center(
            child: Text(
              risultato.toString(),
                style: TextStyle(
                 fontSize: 65,
                 fontWeight: FontWeight.bold,
                  color: Colors.white,           
              ),
          ),
        ),
        ),
        SizedBox(height: 20),
        TextField(
            controller: controller, // per prendere i dati all'utente
           decoration: InputDecoration(
             labelText: 'Inserisci la sequenza',
             border: OutlineInputBorder(),
            )),
             SizedBox(height: 20),

           ElevatedButton(onPressed:() {
            setState(() {
              StringaUtente=risultatoUtente();
              if(controllo()){
                StringaUtente="HAI VINTO";
              }else{
                StringaUtente="COMBINZIONE ERRATA";
              }
              controller.clear();
            });
            },
             child: Text("INVIA")),
           Text(StringaUtente),
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

