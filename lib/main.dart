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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late int firstnum;
  late int secondnum;
  String texttodisplay = "";
  late String res;
  late String operationperform;

  void btnClicked(String btnVal) {
    if (btnVal == "C") {
      texttodisplay = "";
      firstnum = 0;
      secondnum = 0;
      res = "";
    } else if (btnVal == "+" ||
        btnVal == "-" ||
        btnVal == "x" ||
        btnVal == "/") {
      firstnum = int.parse(texttodisplay);
      res = "";
      operationperform = btnVal;
    } else if (btnVal == "=") {
      secondnum = int.parse(texttodisplay);
      if (operationperform == "+") {
        res = (firstnum + secondnum).toString();
      }
      if (operationperform == "-") {
        res = (firstnum - secondnum).toString();
      }
      if (operationperform == "x") {
        res = (firstnum * secondnum).toString();
      }
      if (operationperform == "/") {
        res = (firstnum ~/ secondnum).toString();
      }
    } else {
      res = int.parse(texttodisplay + btnVal).toString();
    }
    setState(() {
      texttodisplay = res;
    });
  }

  Widget customButton(String btnVal) {
    return Expanded(
      child: SizedBox(
        height: 100,
        width: 200,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),

          // padding: EdgeInsets.all(25),
          onPressed: () => btnClicked(btnVal),
          child: Text(
            "$btnVal",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Expanded(child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              child: Text('$texttodisplay', style: TextStyle(fontSize: 40,
                  color: Colors.white,
              fontWeight: FontWeight.w600),),
            )),
        Row(
          children: <Widget>[
            customButton('9'),
            customButton('8'),
            customButton('7'),
            customButton('+'),
          ],
        ),
        Row(
          children: <Widget>[
            customButton('6'),
            customButton('5'),
            customButton('4'),
            customButton('-'),
          ],
        ),
        Row(
          children: <Widget>[
            customButton('3'),
            customButton('2'),
            customButton('1'),
            customButton('x'),
          ],
        ),
        Row(
          children: <Widget>[
            customButton('C'),
            customButton('0'),
            customButton('='),
            customButton('/'),
          ],
        ),
      ])),
    );
  }
}
