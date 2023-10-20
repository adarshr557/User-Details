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
        automaticallyImplyLeading:
            false, //this property removes the multi creation of homepage while navigation
        leading: IconButton(
            icon: Image.asset('assets/images/officer.png'), onPressed: () {}),

        elevation: 10,
        shadowColor: Color.fromARGB(255, 0, 29, 58),
        title: Text(
          'Employees',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: Color(0xFF004080),
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

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                        ),
                        scrollDirection: Axis.vertical,
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
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFF003366),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 0, 29, 58), //New
                                    blurRadius: 2.0,
                                  )
                                ],
                              ),
                              child: GridTile(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    value.getImage(index),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      value.userlist[index].name,
                                      style: TextStyle(

                                          //  fontSize: 22,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      value.userlist[index].company.name,
                                      style: TextStyle(
                                          // fontSize: 22,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                }
              }),
        );
      }),
    );
  }
}
