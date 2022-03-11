import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m6_imtihon_bank/pages/create_page.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class Home_Page extends StatefulWidget {
  static const String id = "/home_page";

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  bool isLoading = false;
  String data = 'No data';
  String card = "1223213132133231";
  List<Post> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostList();
  }

  void _apiPostList(){
    setState(() {
      isLoading = true;
    });
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
      print(response!),
      _showResponse(response),
    });
  }

  void _apiPostDelete(Post post) {
      Network.DELETE(Network.API_DELETE + post.id.toString(), Network.paramsEmpty()).then((response) => {
      print(response!),
      _showResponse(response),
    });
  }

  void _showResponse(String response){
    setState(() {
      data = response;
      list = List<Post>.from(json.decode(data).map((x) => Post.fromJson(x)));
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Good Morning,\n",style: TextStyle(fontSize: 25,color: Colors.black)),
                    TextSpan(text: "Eugene",style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              CircleAvatar(
                minRadius: 25,
              ),
            ],
          ),
        )
      ),
      body: ListView.builder(
        itemCount: list.length+1,
        itemBuilder: (context,index) {
          return index == list.length ? GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Create_Page.id);
            },
           child: Container(
             height: 200,
             width: 200,
             padding: EdgeInsets.all(20),
             color: Colors.white,
             alignment: Alignment.center,
             child: Container(
               decoration: BoxDecoration(
                 color: Colors.black12.withOpacity(0.05),
                 borderRadius: BorderRadius.circular(5),
                 border: Border.all(
                     color: Colors.grey.withOpacity(0.15),
                     width: 2
                 ),
               ),
               alignment: Alignment.center,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(Icons.add_box_outlined,size: 50,color: Colors.black45,),
                   Text("Add new card",style: TextStyle(color: Colors.black45),),
                 ],
               ),
             ),
           ),
          )
              : GestureDetector(
            onLongPress: () {
              setState(() {
                _apiPostDelete(list[index]);
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 40,vertical: 35),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/card.jpg"),
                    fit: BoxFit.cover
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[index].card_number!,style: TextStyle(color: Colors.white,fontSize: 20),),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "CARD HOLDER\n",style: TextStyle(fontSize: 8,)),
                            TextSpan(text: "${list[index].name!} ${list[index].surname!}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: "EXPIRES\n",style: TextStyle(fontSize: 8,)),
                            TextSpan(text: list[index].date!,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}