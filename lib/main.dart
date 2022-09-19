import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.pinkAccent),
      home: const Demo(),
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  DemoState createState() => DemoState();
}

class DemoState extends State<Demo> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmi = 0;
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI 計算機"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '身高cm',
                icon: Icon(Icons.trending_up),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: '體重Kg',
                icon: Icon(Icons.trending_down),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: calculateBMI,
              child: const Text(
                "計算",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              bmi > 0 ? "你的bmi為：${bmi.toStringAsFixed(2)}" : " ",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            RichText(
              text: TextSpan(
                  text: "體重狀態為：",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                  children: <TextSpan>[
                    TextSpan(
                      text: determineStatus(bmi),
                      style: TextStyle(
                          color: getStatusColor(bmi),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double h = double.parse(heightController.text) / 100;
    double w = double.parse(weightController.text);
    bmi = w / (h * h);
    setState(() {});
  }

  String determineStatus(double bmi) {
    if (bmi < 18.5) {
      return "過輕";
    } else if (bmi < 24) {
      return "正常";
    } else if (bmi < 27) {
      return "過重";
    } else if (bmi < 30) {
      return "輕度肥胖";
    } else if (bmi < 35) {
      return "中度肥胖";
    } else {
      return "重度肥胖";
    }
  }

  MaterialColor getStatusColor(double bmi) {
    if (bmi < 18.5) {
      return Colors.red;
    } else if (bmi < 24) {
      return Colors.green;
    } else if (bmi < 27) {
      return Colors.yellow;
    } else if (bmi < 30) {
      return Colors.orange;
    } else if (bmi < 35) {
      return Colors.red;
    } else {
      return Colors.red;
    }
  }
}
