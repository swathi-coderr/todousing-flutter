import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  
  List<String> tasks=["task1"];
  TextEditingController text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        appBar:AppBar(title:Text(" Todo list"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: false,),
        body: Column(
          children:[
            Row(
              children: [
                 Expanded(child: Container(padding: EdgeInsets.all(10),
          child: TextField(
            controller: text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text("Enter value"),
            ),
          )
        ),),
        MaterialButton(
          color:Colors.white,
          height: 50,
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
          onPressed:(){ 
            setState(() {
              
              tasks.add(text.text);
              text.clear();
            });
          },
          child: Text("Click"),
        ),

              ],
            ),
            
        
        
        Flexible(
          child: ListView.builder(itemCount:tasks.length,itemBuilder: (context,index){return Row(children: [
            Expanded(
              child:Container(
                padding: EdgeInsets.all(20),
                child:Text(tasks[index]),),
              ),
          
          MaterialButton(
            child: Icon(Icons.delete,color:Colors.red ),
            onPressed: (){
              setState(() {
                tasks.removeAt(index);
              });
              
            },
          )]);
          } ,),
        )
        
      ],
    )),);
  }
}
