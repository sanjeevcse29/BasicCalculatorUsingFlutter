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
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home: const MyHomePage( ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int firstnum=0;
int secondnum=0;
String texttodisplay = "";
String res="";
String operatortoperform="";


void btnclicked(String btnvalue)
{
    if(btnvalue == "C")
    {
      texttodisplay = "";
      firstnum =0;
      secondnum =0;
      res = "";
    }
    else if(btnvalue == "+" || btnvalue == "-" || btnvalue == "x" || btnvalue =="/" )
    {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = btnvalue;
    }
    else if(btnvalue == "=")
    {
        secondnum = int.parse(texttodisplay);
        if(operatortoperform == "+" )
        {
          res = (firstnum + secondnum).toString();
        }
         if(operatortoperform == "-" )
        {
          res = (firstnum - secondnum).toString();
        }
         if(operatortoperform == "x" )
        {
          res = (firstnum * secondnum).toString();
        }
         if(operatortoperform == "/" )
        {
          res = (firstnum ~/ secondnum).toString();  //~ for non decimal answer 
        }
    }
    else
    {
      res = int.parse(texttodisplay + btnvalue).toString();
    }

    setState(() {
      texttodisplay = res;
    });
}


Widget custombutton(String btnvalue){
  return Expanded(
    child: OutlinedButton(
      onPressed: () =>btnclicked(btnvalue),
      child: Text(
        "$btnvalue",
        style: TextStyle(
          fontSize: 25.0, 
        ),
        
      ),
    
    ),

  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text(
                  "$texttodisplay",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),


            Row(
              children: <Widget> [
                 custombutton("9"),
                 custombutton("8"),
                 custombutton("7"),
                 custombutton("+"),
 
              ],
            ),
            Row(
              children: <Widget> [
                 custombutton("6"),
                 custombutton("5"),
                 custombutton("4"),
                 custombutton("-"),

 
              ],
            ),
             Row(
              children: <Widget> [
                 custombutton("3"),
                 custombutton("2"),
                 custombutton("1"),
                 custombutton("x"),

 
              ],
            ),
             Row(
              children: <Widget> [
                 custombutton("C"),
                 custombutton("0"),
                 custombutton("="),
                 custombutton("/"),

 
              ],
            ),

          ],
        ),
        
      ),
    );
       
  }
}


 