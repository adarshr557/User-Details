import 'package:flutter/material.dart';
import 'package:user_app/model/user_details_model_class.dart';
import 'package:user_app/view_model/api_service.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key, required this.title, required this.index});
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 68, 87, 194),
        title: Text(
          'User Deatails',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
          child: FutureBuilder<List<UserDetails>?>(
              future: fetchedDetails(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      return Text('Error : ${snapshot.error}');
                    } else {
                      late List<UserDetails> userlist = snapshot.data ?? [];
                      switch (index) {
                        case 0:
                          index == 0;
                          break;
                        case 1:
                          index == 1;
                          break;
                        case 2:
                          index == 2;
                          break;
                        case 3:
                          index == 3;
                          break;
                        case 4:
                          index == 4;
                          break;
                        case 5:
                          index == 5;
                          break;
                        case 6:
                          index == 6;
                          break;
                        case 7:
                          index == 7;
                          break;
                        case 8:
                          index == 8;
                          break;
                        case 9:
                          index == 9;
                          break;
                      }
                      return Center(
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Icon(
                                Icons.account_circle,
                                color: const Color.fromARGB(255, 68, 87, 194),
                              ),
                              title: Text(userlist[index].name,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.email,
                                  color:
                                      const Color.fromARGB(255, 68, 87, 194)),
                              title: Text(userlist[index].email,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.phone,
                                  color:
                                      const Color.fromARGB(255, 68, 87, 194)),
                              title: Text(userlist[index].phone,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.location_on,
                                  color:
                                      const Color.fromARGB(255, 68, 87, 194)),
                              title: Text(
                                  userlist[index].address.city.toString(),
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.home_work,
                                  color:
                                      const Color.fromARGB(255, 68, 87, 194)),
                              title: Text(userlist[index].company.name,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.web,
                                  color:
                                      const Color.fromARGB(255, 68, 87, 194)),
                              title: Text(userlist[index].website,
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 68, 87, 194))),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    }
                }
              })),
    );
  }
}
