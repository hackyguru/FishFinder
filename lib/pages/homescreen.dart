import 'package:flutter/material.dart';
import 'package:Maruthuvan/utils/header.dart';
import 'package:Maruthuvan/utils/customcard.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> show;
  @override
  Widget build(BuildContext context) {
    setState(() => this.show = symptomList);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Landing()));
        },
        child: Icon(Icons.check),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF33B9CB),
      ),
      body: Scaffold(
        backgroundColor: Color(0xFFB5DFEA),
        body: Column(children: [
          HeaderWithSearchBox(
            size: MediaQuery.of(context).size,
            addSym: (value) => setState(() {
              symptomList.add(value);
            }),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Column(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Fishes:",
                  style:
                      GoogleFonts.fredokaOne(fontSize: 20, color: Color(0xFF3C4046)),
                  textAlign: TextAlign.left,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  height: 300,
                  child: ListView(
                    children: show
                        .map((String item) => CustomCard(
                            color: Color(0xFF33B9CB),
                            data: item,
                            funct: () {
                              setState(() {
                                symptomList.remove(item);
                              });
                            }))
                        .toList(),
                    itemExtent: 80,
                  ),
                ),
              )
            ]),
          )
        ]),
      ),
    );
  }
}

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Detected: aaa"),
          elevation: 0,
          backgroundColor: Color(0xFF33B9CB),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  "assets/sample.jpg",
                  height: 300,
                ),
                Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    ""),
                Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                    "")
              ],
            ),
          ),
        ));
  }
}
