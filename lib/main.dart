import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//void main() => runApp(Home());
 void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
     runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
 }

// String inputText = 'Grossery List';

Widget newNote(String inputText) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.blueGrey[700], borderRadius: BorderRadius.circular(20)),
    width: 400.0,
    height: 70.0,
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(20.0),
    child: Text(
      inputText,
      style: TextStyle(
        fontSize: 20,
        color: Colors.tealAccent[400],
      ),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          title: Text(
            'Notes',
            style: TextStyle(
                fontFamily: 'DancingScript',
                fontSize: 25,
                color: Colors.tealAccent[50]),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[800],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 1],
            colors: [Colors.blueGrey[800], Colors.blueGrey[600]]
          ),
        ),
      ), 
      // Column(
      //   children: <Widget>[
      //     Column(
      //       //ROW 1
      //       children: [
      //         newNote('Grossery List 1'),
      //         newNote('Grossery List 2'),
      //         newNote('Grossery List 3'),
      //       ],
      //     ),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Add Note'),
        foregroundColor: Colors.tealAccent[50],
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddNew());
          Navigator.push(context, route);
        },
        backgroundColor: Colors.blueGrey[700],
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AddNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'Add Note',
          style: TextStyle(
              fontFamily: 'DancingScript',
              fontSize: 35,
              color: Colors.tealAccent[50]),
        ),
      ),
      body: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Add your note',
        ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.check),
        label: Text('Save'),
        foregroundColor: Colors.tealAccent[50],
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => AddNew());
          Navigator.pop(context);
        },
        backgroundColor: Colors.blueGrey[700],
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
