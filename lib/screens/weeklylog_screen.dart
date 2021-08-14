import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';
import 'package:time_tracker/screens/add_timesheet_screen.dart';

class WeeklyLogScreen extends StatefulWidget {
  const WeeklyLogScreen({Key? key}) : super(key: key);

  @override
  _WeeklyLogScreenState createState() => _WeeklyLogScreenState();
}

class _WeeklyLogScreenState extends State<WeeklyLogScreen> {
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                    Center(
                      widthFactor: 2.3,
                      child: Text(
                        "Weekly Logs",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
              DropdownButton<String>(
                dropdownColor: appdarkColor,
                underline: Container(
                  height: 2,
                  color: appdarkColor,
                ),
                items: <String>['Select the week', 'week 1', 'week 2', 'week 3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
                hint: Text("Select the week"),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('weeks')
                      // .orderBy('timestamp', descending: true)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data == null) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ListView.builder(
                      padding: EdgeInsets.all(10),
                      // controller: _listScrollController,
                      // reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        // mention the arrow syntax if you get the time
                        return WeekItem(snapshot.data!.docs[index]);
                      },
                    );
                  },
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

  Widget WeekItem(QueryDocumentSnapshot<Object?> doc) {
    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => AddTimeSheetScreen(
                    weekid: doc.id,
                  )));
        },
        child: Icon(Icons.add_circle),
      ),
      title: Text(doc['title']),
      trailing: Icon(Icons.delete),
      onTap: () {
        //Navigator.push(context, MaterialPageRoute(builder: (_)=>AnalyticsScreen()));
      },
    );
  }
}
