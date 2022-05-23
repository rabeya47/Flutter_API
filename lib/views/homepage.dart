import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_api/constants/routes.dart';
import 'package:flutter_api/model/product.dart';
import 'package:flutter_api/networks/http_helper.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Product> plist = [];

  @override

  void initState() {
    productView();
    super.initState();
  }

  void productView() {
    getAllProduct().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;
      plist = data.map((e) => Product.fromMap(e)).toList();

      setState(() {

      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.cyan),
        backgroundColor: Colors.white,
        elevation: 0,

        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: "Home Page ", style: TextStyle(color: Colors.cyan)),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {

            },
          )
        ],
      ),


      drawer: Drawer(

        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                '',
                style: TextStyle(color: Colors.yellow, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/cover.jpg'))),
            ),

            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Registration'),
               onTap: () => {Navigator.pushNamed(context, Routes.registration)},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Feedback'),
              onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () => {Navigator.pushNamed(context, Routes.login)},
            ),
          ],
        ),
      )      ,


      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value)  {

                  print(value);
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: "search here",
                    hintStyle: TextStyle(color: Colors.black26)),
              ),
            ),

            GridView.count(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              children: List.generate(plist.length, (index) {
                return GestureDetector(

                  child: Card(


                    child: Column(
                      children: [

                        Image.network(plist[index].imagesUri.replaceAll('http://localhost:8081', host),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,

                        ),

                        Text(plist[index].productName, style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                        Text(plist[index].price.toString()+'TK', style: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold), ),

                      ],
                    ),
                  ),
                  onTap: (){


                  },
                ); //robohash.org api provide you different images for any number you are giving
              }),
            ),

          ],
        ),
      ),









      //start bottom navigation bar

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.cyan,

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.cyan

          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.cyan

          )
        ],
        onTap: (_currentPages){
          setState(() {
            _currentIndex =_currentPages;
          });
        },
      ) ,

      //finish bottom navigation bar



    );
  }
}
