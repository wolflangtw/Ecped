import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecped',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ecped'),
      debugShowCheckedModeBanner: false,
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

  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Icon(Icons.star, size: 200.0,),
    Icon(Icons.mood_bad, size: 200.0,),
    Icon(Icons.wb_sunny, size: 200.0,),
  ];
  void _onItemTap(int index) {
    setState(() => _selectedIndex = index);
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.search),
            onPressed: null,
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Ecped"),
        leading: const Icon(FontAwesomeIcons.wolfPackBattalion),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.star), label: ('主頁')),
            BottomNavigationBarItem(
                icon: Icon(Icons.mood_bad), label: ('工具')),
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_sunny), label: ('資訊')),
        ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('狼狼'),
                accountEmail: Text('example@gmail.com'),
                currentAccountPicture: Image.network('https://speditat.github.io/DWMSV2/img/Ecped.png'),
                decoration: const BoxDecoration(color: Colors.indigo),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('首頁(test)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.pan_tool_alt),
                title: const Text('工具(test)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info),
                title: const Text('資訊(test)'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),




      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.network('https://speditat.github.io/DWMSV2/img/Ecped.png'),
            const Text(
              'Ecped',
              style: TextStyle(fontSize: 80.0, color: Colors.purple),
            ),
            const Text(
              '一個Minecraft地圖製作團隊',
              style: TextStyle(fontSize: 40.0, color: Colors.purple),
            ),
            const Text(
              '==============',
                style: TextStyle(fontSize: 50.0, color: Colors.lightBlue),
            ),
            const Text(
              '點擊按鈕次數:',
              style: TextStyle(fontSize: 40.0, color: Colors.green),
            ),
            Text(
              '$_counter',
              style: const TextStyle(fontSize: 40.0, color: Colors.deepPurple),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: '點我',
        child: const Icon(Icons.add),

      ),
    );
  }
}

