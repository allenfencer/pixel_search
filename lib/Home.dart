import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'images.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var searchController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Pixel Search', style: TextStyle(fontSize: 22, color: Colors.white,fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 300,
                child: Image.asset('images/banner.png'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: searchController,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    enabled: true,
                    labelText: 'Search',
                    hintText: 'Eg: Wildlife',
                    hintStyle: TextStyle(fontSize: 25, color: Colors.grey),
                    labelStyle: TextStyle(fontSize: 22, color: Colors.grey[700]),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.blueGrey[900])),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(width: 2, color: Colors.grey[700]))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
              child: MaterialButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>FindImage(imageCategory: searchController.text.toString(),)));
                },
                height: 50,
                minWidth: 80,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                color: Colors.black,
                textColor: Colors.white,
                child: Text('SEARCH',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
              ),
            ),
          ],
        ));
  }
}











