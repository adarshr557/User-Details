import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/model/user_details_model_class.dart';
import 'package:user_app/view/second_page.dart';
import 'package:user_app/view_model/api_service.dart';
import 'package:user_app/view_model/home_page_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'All USERS',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(206, 107, 238, 0),
      ),
      body: Consumer<HomepageProvider>(builder: (context, value, child) {
        return Center(
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
                      Provider.of<HomepageProvider>(context, listen: false)
                          .userlist = snapshot.data ?? [];

                      return ListView.builder(
                          itemCount: value.userlist.length,
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                value.savedindex = index;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          secondpage(
                                            title: 'test',
                                            index: value.savedindex,
                                          )),
                                );
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 12,
                                width: MediaQuery.of(context).size.width / 12,
                                child: Card(
                                  color: Color.fromARGB(204, 219, 219, 219),
                                  margin: EdgeInsets.all(3),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          value.userlist[index].id.toString(),
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Text(
                                          value.userlist[index].name,
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                }
              }),
        );
      }),
    );
  }
}
