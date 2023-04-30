import 'package:flutter/material.dart';
import 'pages/learn.dart';
import 'pages/share.dart';
import 'widgets/xpbar.dart';

void main() {
  runApp(const AdaApp());
}

class AdaApp extends StatelessWidget {
  const AdaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ada.ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Ada.ai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _exp = 0;
  int _selectedIndex = 0;

  void _incrementExp() {
    setState(() {
      _exp++;
    });
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 166, 216),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(238, 89, 172, 224),
        title: Text(widget.title),
      ),
      body: Center(
          child: _selectedIndex == 0
              ? Column(children: <Widget>[
                  LearnPage(
                    exp: _exp,
                    incrementExp: _incrementExp,
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: XpBar(exp: _exp),
                  ))
                ])
              : SharePage(exp: _exp, incrementExp: _incrementExp)),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 218, 225, 233),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share Stats',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _setSelectedIndex,
      ),
    );
  }
}
