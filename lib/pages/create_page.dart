import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:m6_imtihon_bank/pages/home_page.dart';

import '../models/post_model.dart';
import '../services/http_service.dart';

class Create_Page extends StatefulWidget {
  static const String id = "/create_page";

  @override
  _Create_PageState createState() => _Create_PageState();
}

class _Create_PageState extends State<Create_Page> {
  TextEditingController card_number = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController date2 = TextEditingController();
  TextEditingController cvv_number = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController surname = TextEditingController();

  void _apiPostCreate(Post post) async{
    await Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((response) => {});
  }

  Post post() {
    Post post = Post(date: "${date1.text}/${date2.text}",name: name.text,surname: surname.text,card_number: card_number.text,cvv_number: cvv_number.text);
    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40,left: 20,right: 20,bottom: 20),
        height: MediaQuery.of(context).size.height,
        color: Colors.blueAccent.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add your card",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w500)),
                    Icon(Icons.add_box_outlined,color: Colors.white,),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Fill in the field  below or use camera phone",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 20,
                ),

                // #card_number
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your card number",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: card_number,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        keyboardType: TextInputType.visiblePassword,
                        onSubmitted: (text) {
                          print("Submited Text : $text");
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'XXXX XXXX XXXX XXXX',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                          prefixIcon: Container(
                            height: 20,
                            width: 20,
                            child: Image.asset("assets/images/card.jpg"),
                          ),
                        ),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expiry date",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: date1,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                      keyboardType: TextInputType.visiblePassword,
                                      onSubmitted: (text) {
                                        print("Submited Text : $text");
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '00',
                                        hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                                      ),
                                      textAlign: TextAlign.center,
                                      onChanged: (text) {
                                        print(text);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: date2,
                                      style: TextStyle(color: Colors.black, fontSize: 20),
                                      keyboardType: TextInputType.visiblePassword,
                                      onSubmitted: (text) {
                                        print("Submited Text : $text");
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '00',
                                        hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                                      ),
                                      textAlign: TextAlign.center,
                                      onChanged: (text) {
                                        print(text);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expiry date",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: TextField(
                                controller: cvv_number,
                                style: TextStyle(color: Colors.black, fontSize: 20),
                                keyboardType: TextInputType.visiblePassword,
                                onSubmitted: (text) {
                                  print("Submited Text : $text");
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '000',
                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 17,letterSpacing: 3),
                                ),
                                textAlign: TextAlign.center,
                                onChanged: (text) {
                                  print(text);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // #name
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: name,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        keyboardType: TextInputType.visiblePassword,
                        onSubmitted: (text) {
                          print("Submited Text : $text");
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                // #Surname
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Surname",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500)),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: TextField(
                        controller: surname,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                        keyboardType: TextInputType.visiblePassword,
                        onSubmitted: (text) {
                          print("Submited Text : $text");
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Surname',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        onChanged: (text) {
                          print(text);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            MaterialButton(
              height: 50,
              color: Colors.white,
              onPressed: () {
                setState(() {
                    _apiPostCreate(post());
                    Navigator.pushReplacementNamed(context, Home_Page.id);
                });
              },
              child: Text("Add",style: TextStyle(color: Colors.blue),),
            ),
          ],
        ),
      ),
    );
  }
}


