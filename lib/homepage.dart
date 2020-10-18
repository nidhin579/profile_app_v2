import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neumorphic/neumorphic.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String id = "HomePage";

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Model myModel = Provider.of<Model>(context);
    myModel.readName();
    myModel.readNum();
    myModel.readPic();
    myModel.readStat();
    return Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 20),
        body: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: NeuCard(
                  decoration: NeumorphicDecoration(
                      color: Colors.lightBlueAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8)),
                  bevel: 20,
                  curveType: CurveType.concave,
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            myModel.imagepick();
                            myModel.pic = true;
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            child: Hero(
                                tag: 'pro',
                                child: myModel.pic != true
                                    ? CircleAvatar(
                                        backgroundImage: myModel.pic
                                            ? FileImage(myModel.imported)
                                            : AssetImage(myModel.propic),
                                        backgroundColor: Colors.black,
                                      )
                                    : CircleAvatar(
                                        radius: 135,
                                        backgroundColor: Colors.black,
                                        backgroundImage:
                                            FileImage(File(myModel.imagepath)),
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Text(
                                'NAME :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Edit your name',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 300,
                                          child: TextField(
                                            controller: myController1,
                                            decoration: new InputDecoration(
                                              hintText: myModel.name,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.greenAccent,
                                                    width: 5.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 5.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        FlatButton(
                                          child: Text(
                                            'Save Changes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            myModel.update(
                                                myController1.text != ''
                                                    ? myController1.text
                                                    : myModel.name,
                                                myController2.text != ''
                                                    ? int.parse(
                                                        myController2.text)
                                                    : myModel.phone);
                                            myController1.clear();
                                            Navigator.pop(context);
                                          },
                                          color:
                                              Color.fromRGBO(79, 32, 149, 100),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                              height: 40,
                              width: 300,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                              child: ListTile(
                                leading: Icon(Icons.person),
                                trailing: Icon(Icons.edit),
                                dense: true,
                                title: Text(
                                  myModel.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 45.0),
                              child: Text(
                                'PHONE NO. :',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            )),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('Edit your phone no.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 300,
                                          child: TextField(
                                            controller: myController2,
                                            decoration: new InputDecoration(
                                              hintText:
                                                  myModel.phone.toString(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.greenAccent,
                                                    width: 5.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red,
                                                    width: 5.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        FlatButton(
                                          child: Text(
                                            'Save Changes',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            myModel.update(
                                                myController1.text != ''
                                                    ? myController1.text
                                                    : myModel.name,
                                                myController2.text != ''
                                                    ? int.parse(
                                                        myController2.text)
                                                    : myModel.phone);
                                            myController2.clear();
                                            Navigator.pop(context);
                                          },
                                          color:
                                              Color.fromRGBO(79, 32, 149, 100),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Container(
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18))),
                            child: Center(
                                child: ListTile(
                              leading: Icon(Icons.phone),
                              trailing: Icon(Icons.edit),
                              title: Text(
                                myModel.phone.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
