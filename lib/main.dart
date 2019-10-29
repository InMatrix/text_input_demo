import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Text Input Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();

  void initState() {
    _controller.text = "Ǻ Ɐỉ ḷĺ ƕⱶ 👍 😀 🇩🇰 한";
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChange(String text) {
    setState(() {
      // update all the text manipulation results
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text("Text Input", style: Theme.of(context).textTheme.display1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                controller: _controller,
                onChanged: _onTextChange,
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[
                Text("Length:"),
                Text("${Characters(_controller.text).length}"),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Skip last character:"),
                Text("${Characters(_controller.text).skipLast(1)}"),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Replace characters"),
                Text("${Characters(_controller.text).replaceAll(
                  Characters('🇩🇰'),
                  Characters('🇺🇸'),
                )}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
