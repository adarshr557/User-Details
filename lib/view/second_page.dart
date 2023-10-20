import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_app/model/user_details_model_class.dart';
import 'package:user_app/view/home_page.dart';
import 'package:user_app/view_model/api_service.dart';
import 'package:user_app/view_model/home_page_provider.dart';
import 'package:user_app/view_model/second_provider.dart';

class secondpage extends StatelessWidget {
  const secondpage({super.key, required this.title, required this.index});
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 226, 226, 226),
      appBar: AppBar(
        centerTitle: true,
        elevation: 15,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: Color(0xFF004080),
        title: Text(
          'User Deatails',
          style: TextStyle(
              fontSize: 17,
              color: const Color.fromARGB(185, 255, 255, 255),
              letterSpacing: 0.53,
              fontWeight: FontWeight.w700),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        bottom: PreferredSize(
            child: getAppBottomView(context),
            preferredSize: Size.fromHeight(110.0)),
      ),
      body: Consumer<SecondProvider>(builder: (context, value, child) {
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
                            padding: EdgeInsets.only(top: 15),
                            children: [
                              Card(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 5,
                                child: ListTile(
                                  leading: Icon(Icons.account_circle,
                                      color: Color(0xFF004080)),
                                  title: Text(userlist[index].username,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42))),
                                ),
                              ),

                              SizedBox(
                                height: 9,
                              ),

                              Card(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 5,
                                child: ListTile(
                                  leading: Icon(Icons.location_on,
                                      color: Color(0xFF004080)),
                                  title: Text(
                                      '${userlist[index].address.city},',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42))),
                                  subtitle: Row(
                                    children: [
                                      Text('${userlist[index].address.street},',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 43, 42, 42))),
                                      Text(
                                          '${userlist[index].address.zipcode} .',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(
                                                  255, 43, 42, 42))),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Card(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 5,
                                child: ListTile(
                                  leading: Icon(Icons.home_work,
                                      color: Color(0xFF004080)),
                                  title: Text(userlist[index].company.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42))),
                                  subtitle: Text(
                                      '${userlist[index].company.bs} ,',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42))),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),
                              Card(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                color: Color.fromARGB(255, 255, 255, 255),
                                elevation: 5,
                                child: ListTile(
                                  leading:
                                      Icon(Icons.web, color: Color(0xFF004080)),
                                  title: Text(userlist[index].website,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 43, 42, 42))),
                                ),
                              ),
                              SizedBox(
                                height: 9,
                              ),

                              //this widget can change the size of the elavated button inside on a listview,
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: UnconstrainedBox(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    height: 50,
                                    width: 103,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (index < userlist.length - 1) {
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return secondpage(
                                                  title: title,
                                                  index: index + 1);
                                            }));
                                          } else {
                                            Navigator.pop(context,
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return MyHomePage(title: title);
                                            }));
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: Colors.black,
                                          elevation: 10,
                                          backgroundColor: Color(0xFF004080),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'Next',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255)),
                                            ),
                                            Icon(
                                              Icons.arrow_right_sharp,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ],
                                        )),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  }
                }));
      }),
    );
  }

  Widget getAppBottomView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          getProfileView(context),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Provider.of<HomepageProvider>(context).userlist[index].name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                Text(
                  Provider.of<HomepageProvider>(context).userlist[index].email,
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color.fromARGB(185, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  Provider.of<HomepageProvider>(context).userlist[index].phone,
                  style: TextStyle(
                    fontSize: 13,
                    color: const Color.fromARGB(185, 255, 255, 255),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getProfileView(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: CircleAvatar(
              radius: 41,
              backgroundImage: NetworkImage(
                  Provider.of<HomepageProvider>(context, listen: false)
                      .imageUrls[index])),
        ),

        /* Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.edit,
                color: Colors.deepPurple,
                size: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ))*/
      ],
    );
  }
}
