import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:norwayfinalcustomer/API/API.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Color/color.dart';
import 'package:norwayfinalcustomer/foodModule/Widget/Component/Style/style.dart';
import '../../global.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: FoodStoreProfile())));
  }
}

class FoodStoreProfile extends StatefulWidget {
  @override
  _FoodStoreProfileState createState() => _FoodStoreProfileState();
}

class _FoodStoreProfileState extends State<FoodStoreProfile> {


  var indexdel;
  var clickstatus=true;
  @override
  Widget dialogBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: Container(
                height: MediaQuery.of(context).size.height / 1.8,
                width: MediaQuery.of(context).size.width,
                child: Column(


                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[100],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 8, 8),
                        child: Text('Addresses',
                            style: TextStyle(
                                fontFamily: 'monm', letterSpacing: 1.5)),
                      ),
                    ),
                    addresslist(),

                  ],
                )),
          );
        });
  }
  showAlertDialoglogin() {
    // set up the buttons
    Widget no = FlatButton(
      child: Container(
          height: 40,
          width: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("No", style: TextStyle(color: Colors.green)))),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yes = FlatButton(

      child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 40,
          width: 80,

          child: Center(child: Text("yes", style: TextStyle(color: Colors.white)))),
      onPressed: () {
        Navigator.pop(context);
        API.deleteuserloc(deluserlocAPI+indexdel.id.toString());
        waittodelete();


      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),

      title: Text("Are You Sure You Want To Delete! ", style: TextStyle(color: Colors.green[300], fontSize: 14)),
      actions: [
        no,
        yes,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  Widget addresslist(){
    return Container(
      height: MediaQuery.of(context).size.height/2.5,
      child: ListView.builder(
        itemCount: globaluserlocation.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.location_on,color: Colors.green,),
                        SizedBox(width: 10,),
                        Container(
                          height: 20,
                          child: Text(
                            globaluserlocation[index].title,
                            style: new TextStyle(
                                fontFamily: 'monm', fontSize: 16),
                          ),
                        ),
                        Spacer(),
                        InkWell(child: Icon(Icons.cancel,color: Colors.red,),
                          onTap: (){
                            setState(() {
                              indexdel= globaluserlocation[index];
                            });
                            Navigator.pop(context);
                            showAlertDialoglogin();



                          },
                        )
                      ]
                  ),
                ),
                SizedBox(height: 10,)
              ],
            );
          }
      ),
    );
  }

  waittodelete()async{
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {

        });
        i = 0;
      } else {
        waittodelete();
      }
    });

  }

  PickedFile _image;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _userphoneController = TextEditingController();
  final TextEditingController _userpassController = TextEditingController();

  var indicatorvisible = false;
  var i = 0;

  String _time = "Not set";

  @override
  void initState() {
    super.initState();
  }

  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 100.0,
      maxHeight: 100.0,
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 100.0,
      maxHeight: 100.0,
    );

    setState(() {
      _image = image;
    });
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[50],
            resizeToAvoidBottomPadding: false,
            body: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            child: Text('My Profile', style: AppFonts.monmbold20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height/1.4
                    ,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                width: size.width,
                                height: size.height / 5.1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12, 8, 12, 4),
                                        child: Text('Profile Image',
                                            style: AppFonts.monmgrey),
                                      ),
                                    ),
                                    Spacer(),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: size.width / 3,
                                          height: size.height / 8,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                16, 0, 8, 0),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: _image != null
                                                    ? Image.file(
                                                        File(_image.path),
                                                        fit: BoxFit.fill,
                                                      )
                                                    : userimage != null
                                                        ? Image.network(
                                                            userimage, fit: BoxFit.fill,)
                                                        : Image.asset(
                                                            "assets/profile1.png")),
                                          ),
                                        ),
                                        Container(
                                          width: size.width / 1.55,
                                          height: size.height / 10,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  InkWell(
                                                    child: Icon(
                                                      Icons.photo_camera,
                                                      color:
                                                          AppColors.lightgreenColor,
                                                    ),
                                                    onTap: () {
                                                      _imgFromCamera();
                                                    },
                                                  ),
                                                  Spacer(),

                                                  InkWell(
                                                    child: Icon(
                                                      Icons.upload_file,
                                                      color:
                                                      AppColors.lightgreenColor,
                                                    ),
                                                    onTap: () {
                                                      _imgFromGallery();
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(' Camera',
                                                      style:
                                                          AppFonts.monmyellow),
                                                  Spacer(),
                                                  Text(' Gallery',
                                                      style:
                                                          AppFonts.monmyellow),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: size.height / 1.2,
                              width: size.width / 1,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 8),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    /*Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: Text('STORE INFO',
                                          style: AppFonts.monmgrey),
                                    ),*/
                                    Container(
                                      height: size.height / 10,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(' Name', style: AppFonts.monm),
                                          Container(
                                            height: 40,
                                            child: TextField(
                                              controller: _usernamecontroller,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintStyle: AppFonts.monrblack,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: username == null
                                                    ? 'Omar'
                                                    : username,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        dialogBox();
                                      },
                                      child: Container(
                                        height: size.height / 10,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text('Address',
                                                style: AppFonts.monm),
                                            Container(
                                                height: 20,
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'Current Location',
                                                      style: AppFonts.monm,
                                                    ),
                                                    Spacer(),
                                                    Icon(Icons
                                                        .keyboard_arrow_down)
                                                  ],
                                                )),
                                            Divider(
                                              thickness: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: size.height / 8.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Phone Number',
                                              style: AppFonts.monm),
                                          Container(
                                            child: TextField(
                                              controller: _userphoneController,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                    fontFamily: 'monr',
                                                    color: Colors.black),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: userphone == null
                                                    ? '+920888121232'
                                                    : userphone,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: size.height / 8.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Password',
                                              style: AppFonts.monm),
                                          Container(
                                            child: TextField(
                                              controller: _userpassController,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                hintStyle: TextStyle(
                                                    fontFamily: 'monr',
                                                    color: Colors.black),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: userpass == null
                                                    ? '**********'
                                                    : userpass,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: size.height / 8.9,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Email Address',
                                              style: AppFonts.monm),
                                          Container(
                                            height: size.height / 13.4,
                                            child: TextField(
                                              readOnly: true,
                                              style: AppFonts.monm,
                                              decoration: InputDecoration(
                                                hintStyle: AppFonts.monm,
                                                prefixIcon: Icon(
                                                  Icons.email,
                                                  size: 18,
                                                  color: AppColors.lightgreenColor,
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: Colors.grey[300],
                                                )),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                  color: AppColors.yellowColor,
                                                )),
                                                hintText: useremail == null
                                                    ? 'akbbokers@email'
                                                    : useremail,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  indicatorshow(indicatorvisible),
                  InkWell(
                    child: Container(
                      width: size.width,
                      height: size.height / 12,
                      color: AppColors.lightgreenColor,
                      child: Center(
                        child: Text(' Update info', style: AppFonts.monmwhit16),
                      ),
                    ),
                    onTap: () {
                      if(clickstatus)
                        {
                          clickstatus=false;
                          var name, pass, phone;
                          var image;
                          if (_usernamecontroller.text != "") {
                            name = _usernamecontroller.text;
                          } else {
                            name = username;
                          }
                          if (_userphoneController.text != "") {
                            phone = _userphoneController.text;
                          } else {
                            phone = userphone;
                          }
                          if (_userpassController.text != "") {
                            pass = _userpassController.text;
                          } else {
                            pass = null;
                          }
                          if (_image != null) {
                            image = _image;
                          } else {
                            image = null;
                          }

                          API.profileedit(editprofileAPI + userid.toString(), name,
                              pass, phone, image);
                          waittoupdate();
                        }



                    },
                  ),
                ],
              ),
            )));
  }

  waittoupdate() async {
    if (i == 0) {
      setState(() {
        indicatorvisible = true;
        //indicator();
      });
    }
    await Future.delayed(const Duration(seconds: 1), () {
      if (API.success == 'true') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        clickstatus=true;
        Navigator.pop(context);
      } else if (API.success == 'error') {
        setState(() {
          indicatorvisible = false;
        });
        i = 0;
        clickstatus=true;
      } else {
        waittoupdate();
      }
    });
  }
}
