import 'package:flutter/material.dart';
import 'package:time_tracker/constants/constants.dart';

import 'login_screen.dart';
class ChooseLogin extends StatefulWidget {
  const ChooseLogin({Key? key}) : super(key: key);

  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}
enum BestTutorSite { manager, engineer }
class _ChooseLoginState extends State<ChooseLogin> {
  BestTutorSite _site = BestTutorSite.manager;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gredcol1, gredcol2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Image 2.png'),
                  ],
                ),
                SizedBox(height: 50,),
                Expanded(
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:100,
                              child: Text("imtac",style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold,fontSize: 35),)
                            ),
                          ],
                        ),
                        TextButton(
                            child: Text(
                                "Manager View",
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen(ismanager: true,)))
                        ),
                        SizedBox(height: 20,),
                        TextButton(
                            child: Text(
                                "Engineer View",
                                style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)
                            ),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                        side: BorderSide(color: Colors.white)
                                    )
                                )
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen(ismanager: false,)))
                        ),
                        // ListTile(
                        //   title: const Text('Employee view',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20)),
                        //   leading: Radio(
                        //     value: BestTutorSite.engineer,
                        //     groupValue: _site,
                        //     onChanged: (Best) {
                        //
                        //     },
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/Image 3.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
