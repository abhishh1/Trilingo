import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SelectLevel extends StatefulWidget {
  @override
  _SelectLevelState createState() => _SelectLevelState();
}

class _SelectLevelState extends State<SelectLevel> {
  level() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            height: 200.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Enter the LingoCode',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Icon(Icons.lock)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:50.0,right: 50,top:20),
                  child: TextFormField(),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: RichText(
            text: TextSpan(
              text: 'Select',
              style: TextStyle(
                  fontFamily: 'Bee',
                  color: Colors.lightBlueAccent,
                  fontSize: 20.0),
              children: <TextSpan>[
                TextSpan(
                    text: ' Level ', style: TextStyle(color: Colors.redAccent)),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 725.0,
                  width: 500.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 400.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.add_box,
                                color: Colors.lightBlueAccent,
                              ),
                              title: Text(
                                'Easy',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              subtitle: Text('Some basic words to practice'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularPercentIndicator(
                                footer: Text(
                                  'Language Learned',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                center: IconButton(
                                  icon: Icon(
                                    Icons.account_box,
                                    size: 20.0,
                                  ),
                                  onPressed: () {},
                                ),
                                radius: 40.0,
                                percent: 0.4,
                                backgroundColor: Colors.black,
                                progressColor: Colors.blue,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                               
                              },
                              minWidth: 50,
                              height: 30.0,
                              color: Colors.lightBlueAccent,
                              child: Text('Enter'),
                            )
                          ],
                        ),
                        height: 210.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 400.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.panorama_horizontal,
                                color: Colors.lightGreen,
                              ),
                              title: Text(
                                'Intermediate',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              subtitle: Text('One step above in profienciency'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularPercentIndicator(
                                  footer: Text(
                                    'Language Learned',
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                  center: IconButton(
                                      icon: Icon(
                                        Icons.account_box,
                                        size: 20.0,
                                      ),
                                      onPressed: () => {}),
                                  radius: 40.0,
                                  percent: 0.4,
                                  backgroundColor: Colors.black,
                                  progressColor: Colors.lightGreen),
                            ),
                            MaterialButton(
                              onPressed: () => level(),
                              minWidth: 50,
                              height: 30.0,
                              color: Colors.lightGreen,
                              child: Text('Enter'),
                            )
                          ],
                        ),
                        height: 210.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all()),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 400.0,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(
                                Icons.line_weight,
                                color: Colors.red,
                              ),
                              title: Text(
                                'Advanced',
                                style: TextStyle(fontSize: 20.0),
                              ),
                              subtitle:
                                  Text('Master this one and move to examine'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircularPercentIndicator(
                                footer: Text(
                                  'Language Learned',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                                center: IconButton(
                                  icon: Icon(
                                    Icons.account_box,
                                    size: 20.0,
                                  ),
                                  onPressed: () =>
                                      DrawerHeader(child: Text('a')),
                                ),
                                radius: 40.0,
                                percent: 0.4,
                                backgroundColor: Colors.black,
                                progressColor: Colors.red,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () => level(),
                              minWidth: 50,
                              height: 30.0,
                              color: Colors.red,
                              child: Text('Enter'),
                            )
                          ],
                        ),
                        height: 210.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all()),
                      ),
                    )
                  ]))),
        ));
  }
}

