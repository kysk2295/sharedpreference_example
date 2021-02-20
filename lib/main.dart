import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  //widget은 상위 클래스의 변수에 접근할 때 쓰인다.
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _incrementCounter(){
    setState(() {
      _counter++;
      _setData(_counter);
    });
  }

  //데이터를 저장하는 함수
  void _setData(int value) async{
    var key='count';
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(key, value);
  }

  //데이터를 가져오는 함수

  void _loadData() async{
    var key='count';
    SharedPreferences pref=await SharedPreferences.getInstance();
    setState(() {
      var value=pref.getInt(key);
      if(value==null){
        _counter=0;
      }else{
        _counter=value;
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('버튼을 눌러주세요'),
            Text('$_counter',style: TextStyle(fontSize: 30.0),)
          ],mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      appBar: AppBar(title: Text(widget.title),),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){
        _incrementCounter();
      },),
    );

  }
}
