import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Pushpendra App'),
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

  var wtController = TextEditingController();
  var inchController = TextEditingController();
  var ftController = TextEditingController();
  var result = "";

  var bgColor =Colors.amberAccent.shade200 ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFF083AE0), // Hex code: 0D2A8CFF 083AE0FF

        title: Text('Pushpendra App', style: TextStyle(color: Colors.white),),
      ),
      body: Container(color: bgColor,
        child: Center(
          child: Container(width: 300,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),),

                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(enabledBorder:  OutlineInputBorder(
                     borderRadius: BorderRadius.circular(21),
                  ),
                    label:  Text('Enter your weight here'),
                    prefixIcon: Icon(Icons.line_weight),

                  ),

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                    label: Text('enter your ft here '),

                      prefixIcon : Icon(Icons.height),
                    suffixIcon: Icon(Icons.headphones_rounded),
                  ),

                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inchController,
                  decoration: InputDecoration(
                    label: Text('Enter your height here(in inch '),
                    prefixIcon: Icon(Icons.height),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    )
                  ),
                ),
                SizedBox(height: 11,),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inchController.text.toString();
                  if (wt!="" && ft!="" && inch!=""){

                    //Bmi calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var iInch = int.parse(inch);


                    var tInch = (ift*12) + iInch;

                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iwt/(tM*tM);

                    var msg = "";

                    if(bmi>25){
                      msg = "You're overweight";
                      bgColor = Colors.orange.shade200;
                    } else if (bmi<18){
                      msg = "you are underweight";
                      bgColor = Colors.red.shade200;
                    } else {
                      msg = "You are healthy ";
                      bgColor = Colors.greenAccent.shade200;
                    }

                    setState(() {

                    });
                    result = "$msg .\nYour BMI is ${bmi.toStringAsFixed(2)}";

                  }
                  else {
                    setState((){
                      result = 'Please fill all required blanks!!';

                    });

                  }


                }, style: ElevatedButton.styleFrom(
                  primary: Color(0xFF083AE0),
                ),

                    child: Text('Calculate',style: TextStyle(fontWeight: FontWeight.w700
                ,color: Colors.white),)),

                SizedBox(height: 11,),
                Text(result , style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700
                ,color:  Colors.black87),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
