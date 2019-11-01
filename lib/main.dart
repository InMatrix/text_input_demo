import 'package:characters/characters.dart';
import 'package:flutter/material.dart';

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
  var _useCharactersAPI = true;
  static const _defaultText = "👍😀🇩🇰한好🛴⚽️🍕👧🏽";

  void initState() {
    _controller.text = _defaultText;
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

  int _countCharacters(String input, bool useCharactersAPI) {
    if (useCharactersAPI) {
      return Characters(input).length;
    } else {
      return input.length;
    }
  }

  String _skipLastCharacter(String input, bool useCharactersAPI) {
    if (useCharactersAPI) {
      return Characters(input).skipLast(1).toString();
    } else {
      return input.substring(0, input.length - 1);
    }
  }

  String _replaceCharacters(String input, bool useCharactersAPI) {
    if (useCharactersAPI) {
      return Characters(input)
          .replaceAll(Characters('🇩🇰'), Characters('🇺🇸'))
          .toString();
    } else {
      return input.replaceAll(new RegExp(r'🇩🇰'), '🇺🇸');
    }
  }

  String _addWhitespaces(String input, bool useCharactersAPI) {
    var myString = '';
    if (useCharactersAPI) {
      Characters(input).forEach((char) {
        myString = myString + char + ' ';
      });
    } else {
      for (int i = 0; i < input.length; i++) {
        myString = myString + input[i] + ' ';
      }
    }

    return myString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _controller.text = _defaultText;
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Use the Characters API"),
              Switch(
                value: _useCharactersAPI,
                onChanged: (isSwitchOn) {
                  if (isSwitchOn) {
                    setState(() {
                      _useCharactersAPI = true;
                    });
                  } else {
                    setState(() {
                      _useCharactersAPI = false;
                    });
                  }
                },
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
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
                ListTile(
                  title: Text("Length:"),
                  subtitle: Text(
                      "${_countCharacters(_controller.text, _useCharactersAPI)}"),
                ),
                ListTile(
                  title: Text("Skip last character:"),
                  subtitle: Text(
                      "${_skipLastCharacter(_controller.text, _useCharactersAPI)}"),
                ),
                ListTile(
                  title: Text("Replace characters"),
                  subtitle: Text(
                      "${_replaceCharacters(_controller.text, _useCharactersAPI)}"),
                ),
                ListTile(
                  title: Text("Add whitespaces"),
                  subtitle: Text(
                      "${_addWhitespaces(_controller.text, _useCharactersAPI)}"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
