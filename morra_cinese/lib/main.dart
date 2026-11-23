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
  // 1 sasso 2 carta 3 forbice
int sceltaUtente=0;
int punteggioUser=0;
int punteggioPC=0;
String decisione="";
final random=Random();
int pc=0;
String vitoria="";
void gioca(int scelta){
  sceltaUtente=scelta;
  pc=random.nextInt(3)+1;
 
  
  if(scelta==pc){
    setState(() {
       decisione=sceltaPC(pc);
      vitoria="pareggio";
    });
  }else if((scelta==1 &&pc==3 )||(scelta==2 && pc==1)||(scelta==3 && pc==2)){
    setState(() {
       decisione=sceltaPC(pc);
      vitoria= "hai vinto";
      punteggioUser++;
    });

  }else{
    setState(() {
       decisione=sceltaPC(pc);
      vitoria="hai perso";
      punteggioPC++;
    });
  }
}
String sceltaPC(int scelta){
if(scelta==1){
  return "sasso";
}else if(scelta==2){
return "carta";
}else if(scelta==3){
  return "forbice";
  }else {
return "sto ragionando";
}
}


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          
          children:[
            Text("$vitoria punteggi : utente:$punteggioUser   | pc:$punteggioPC"),
            Text("scelta pc: $decisione "),
             ElevatedButton(onPressed:()=> gioca(1), child: Text("sasso")),
             ElevatedButton(onPressed:()=> gioca(2), child: Text("carta")),
             ElevatedButton(onPressed:()=> gioca(3), child: Text("forbice"))

          ]
        ),
      ),
      
    );
  }
}
