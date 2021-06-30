import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixel_search/utils.dart';
import 'package:http/http.dart'as http;

class FindImage extends StatefulWidget {
  final String imageCategory;
  const FindImage({Key key,this.imageCategory}) : super(key: key);

  @override
  _FindImageState createState() => _FindImageState();

}

class _FindImageState extends State<FindImage> {
  Map output;

  Future <dynamic> fetchData(String imageCategory)async{
    String url='https://pixabay.com/api/?key=$apiKey&q=$imageCategory&image_type=photo&pretty=true';
    final response= await http.get(Uri.parse(url));
    if(response.statusCode==200)
      {
        output= jsonDecode(response.body);
        return output;
      }
    else{
      throw Exception('Cannot connect to the server at the moment!');
    }
  }

  @override
  void initState() {
    fetchData(widget.imageCategory);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Showing results for ${widget.imageCategory}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 25,color: Colors.white,),
        ),
      ),
      body: FutureBuilder(
        future: fetchData(widget.imageCategory),
        builder: (BuildContext context,snapshot){
          if(snapshot.hasData)
            {
              List _data=output['hits'];
              return ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context,index){
                  return Container(
                    height: 280,
                    padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(_data[index]['largeImageURL'],fit: BoxFit.fitWidth,),
                  );
                },
              );
            }
          else if(snapshot.hasError)
            {
              return Center(child: Text('Cannot fetch data atm, pls try again later'),);
            }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}


