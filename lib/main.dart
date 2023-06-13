import 'package:flutter/material.dart';
import 'package:flutter_application_movies4/kofic_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void showMov() async {
    var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime(2023, 5, 1),
        firstDate: DateTime(2023, 1, 1),
        lastDate: DateTime(2023, 6, 1));

    if (selectedDate != null) {
      //분리작업
      var dt = selectedDate.toString().split(' ')[0].replaceAll("-", "");
      var koficApi = KoficApi();
      var movies = await koficApi.search(dt);
      print(movies);
      for (var i in movies) {
        print(i);
        print(i['rank']);
      }
      print(dt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('무비검색하기'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showMov,
        child: const Icon(Icons.calendar_month),
      ),
    );
  }
}
