

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: EditProfilePage(),
        //SettingsUI()
        // HomePage()
      //  MyHomePage1(),
        );
  }
}

class MyHomePage1 extends StatefulWidget {
  @override
  _MyHomePage1State createState() => _MyHomePage1State();
}

class _MyHomePage1State extends State<MyHomePage1> {
  

  bool istextfeildShow = false;
  TextEditingController fblinkcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSocialButton(
                        icon: FontAwesomeIcons.facebookSquare,
                        color: Color(0xFF0075FC),
                        onClicked: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Please Enter Facebook Link'),
                            duration: const Duration(seconds: 1),
                          ));

                          share(SocialMedia.facebook);
                        }),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          istextfeildShow = !istextfeildShow;
                        });
                      },
                      child: Text(fblinkcontroller.text.isNotEmpty
                          ? 'Edit'
                          : istextfeildShow == false
                              ? 'Add'
                              : 'Submit'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSocialButton(
                      icon: FontAwesomeIcons.twitter,
                      color: Color(0xFF1da1f2),
                      onClicked: () => share(SocialMedia.twitter),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          istextfeildShow = !istextfeildShow;
                        });
                      },
                      child: Text(fblinkcontroller.text.isNotEmpty
                          ? 'Edit'
                          : istextfeildShow == false
                              ? 'Add'
                              : 'Submit'),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildSocialButton(
                      icon: FontAwesomeIcons.linkedin,
                      color: Color(0xFF0072b1),
                      onClicked: () => share(SocialMedia.linkedln),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          istextfeildShow = !istextfeildShow;
                        });
                      },
                      child: Text(fblinkcontroller.text.isNotEmpty
                          ? 'Edit'
                          : istextfeildShow == false
                              ? 'Add'
                              : 'Submit'),
                    )
                  ],
                )
              ],
            ),
            istextfeildShow == true
                ? TextField(
                    controller: fblinkcontroller,
                    decoration: InputDecoration(hintText: 'Enter FB Link'),
                  )
                : Container(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future share(SocialMedia platform) async {
    final urls = {
      SocialMedia.facebook: (fblinkcontroller.text),
      SocialMedia.twitter: ('twitter shareable link'),
      SocialMedia.linkedln: ('face book linkedln link')
    };
    final url = urls[platform]!;
    await launchUrl(Uri.parse(url));
  }
}

enum SocialMedia { facebook, twitter, linkedln }

Widget buildSocialButton(
        {required IconData icon,
        Color? color,
        required Function() onClicked}) =>
    InkWell(
      child: Container(
        width: 60,
        height: 60,
        child: Center(child: FaIcon(icon, color: color, size: 40)),
      ),
      onTap: onClicked,
    );



class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? _image;

  final _picker = ImagePicker();
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  bool isUpdate = false;
  bool showPassword = false;
  bool isInfo = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Accont',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.green,
        //   ),
        //   onPressed: () {},
        // ),
        actions: [ IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.green,
            ),
            onPressed: () {
            setState(() {
                  isUpdate=true; 
            });
        
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SettingsPage())
               //   );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              // Text(
              //   "Edit Profile",
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 10))
                        ],
                        shape: BoxShape.circle,

                        // image: DecorationImage(
                        //     fit: BoxFit.cover,
                        //     image:
                        //     //  NetworkImage(
                        //     //   "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                        //     // )
                      ),
                      child: _image != null
                          ? Center(
                              child: Container(
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ))))
                          : Center(
                              child: Container(
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
                                ),
                              ),
                            )
                              // const Text('Please select an image')

                              ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: 
                        isUpdate? Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child:
                          
                          isUpdate? GestureDetector(
                            onTap: () {
                              _openImagePicker;
                              print(_openImagePicker());
                            },
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                            ),
                          ):Container(),
                        ):Container(),
                )],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isInfo = true;
                      });
                    },
                    child: Text(
                      'Numini Info',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isInfo
                              ? Colors.black
                              : Colors.black.withOpacity(0.2)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isInfo = false;
                      });

                      print(isInfo);
                    },
                    child: Text(
                      'Social Info',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isInfo == false
                            ? Colors.black
                            : Colors.black.withOpacity(0.2),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Column(
                children: [
                  isInfo == true
                      ? Column(
                          children: [
                            buildTextField(
                                "Full Name", "Abdul Rahim", false, false),
                                 buildTextField(
                                "Email", "rahimsr983@gmail.com", false, false),
                            buildTextField(
                                "Joining date", "13/06/2022", false, false),
                            buildTextField(
                                "Date Of Birth", "12/11/1996", false),
                            //  buildTextField("Password", "********", true),
                            buildTextField('Nid ', 'Nid Number', false),
                            buildTextField("Location",
                                "Mogbazer, Dhaka,Bangladesh", false, false),
                            // SizedBox(
                            //   height: 5,
                            // ),
                         isUpdate?   Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                               
                                MaterialButton(
                                  onPressed: () {
                                    setState(() {
                                      isUpdate = false;
                                    });
                                  },
                                  color: Colors.green,
                                  padding: EdgeInsets.symmetric(horizontal: 50),
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                  'Save',
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 2.2,
                                        color: Colors.white),
                                  ),
                                )
                              ],
                            ):Container(),
                          ],
                        )
                      : MyHomePage1(),
                ],
              ),
              // isInfo == false ? MyHomePage1() : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField,
      [readonly = false]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: TextField(
        readOnly: isUpdate ? readonly : true,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      showPassword
                          ? Icons.remove_red_eye
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Content settings"),
            buildAccountOptionRow(context, "Social"),
            buildAccountOptionRow(context, "Language"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 50,
            ),
            Center(
              child: RaisedButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.black)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}


