import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/add_cso_screen.dart';
import 'package:time_tracker/screens/add_timesheet_screen.dart';

class CSOScreen extends StatefulWidget {
  const CSOScreen({Key? key}) : super(key: key);

  @override
  _CSOScreenState createState() => _CSOScreenState();
}

class _CSOScreenState extends State<CSOScreen> {
  @override
  Widget build(BuildContext context) {
    Size _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: _mediaQuery.height,
          color: applightColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: appdarkColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.home,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      "CSO",
                      style: TextStyle(fontSize: 20, color: Colors.blue,fontWeight: FontWeight.bold ),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: new InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    labelText: "Search",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                    children: [
                      ListTile(
                        title: Text(
                            'CSO 1'),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (_)=>AnalyticsScreen()));
                        },
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      ListTile(
                        title: Text(
                            'CSO 2'),
                        trailing: Icon(Icons.edit),
                        onTap: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (_)=>AnalyticsScreen()));
                        },
                      ),
                      Divider(
                        thickness: 1,
                      ),


                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>AddCSOScreen()));
                        },
                        child: Icon(Icons.add),),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
