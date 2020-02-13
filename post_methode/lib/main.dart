import 'package:flutter/material.dart';
import 'package:post_methode/post_result_methode.dart';
import 'package:post_methode/user_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
PostResult postResult;
User user ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Text("ApiTestUpload") ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text((postResult != null) ? postResult.id + "|" + postResult.name + "|" + postResult.job + "|" + postResult.created : "no data found"),
            RaisedButton(child: Text("Upload (POST)"),onPressed: (){
              PostResult.connectToAPI("Hadi", "Programmer").then((value){
                postResult = value;
                setState(() {
                  
                });
              });
            },),
                        Text((user!= null) ? user.id + "|" + user.name : "no data found"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(),
            ),
            RaisedButton(child: Text("GET"), onPressed: (){
              User.connectToApi("2").then((value){
                user = value;
                setState(() {
                },);
              });
            })
          ]
        ),
      ) 
      ,),
    );
  }
}


