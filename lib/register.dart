import 'package:flutter/material.dart';
import 'package:login_register/divider.dart';

class Registration extends StatefulWidget {
  Registration({Key key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  DateTime date = DateTime.now();
  int genderValue = 0;
  bool valuePrivacy = false;

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: signUpFields(
                              hinttxt: "First Name",
                              prefixIcon: iconProperty(iconData: Icons.person)),
                        ),
                        Expanded(
                          child: signUpFields(
                              hinttxt: "Last Name",
                              prefixIcon: iconProperty(iconData: Icons.person)),
                        ),
                      ],
                    ),
                    DividerWidget(),
                    Row(
                      children: [
                        Expanded(
                          flex: 5,
                          child: TextField(
                            decoration: InputDecoration(
                              // hintText: "Birthdate",
                              hintText: date == null
                                  ? "Birthdate"
                                  : date.day.toString() +
                                      "/" +
                                      date.month.toString() +
                                      "/" +
                                      date.year.toString(),

                              hintStyle: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFF73735d),
                              ),
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                          ),
                        ),
                        Flexible(
                          child: GestureDetector(
                            onTap: () {
                              selectTimePicker(context);
                            },
                            child: Icon(
                              Icons.calendar_today,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DividerWidget(),
                    gender(),
                    DividerWidget(),
                    //   DropdownButton(items: items),
                    // DividerWidget(),
                    signUpFields(
                        hinttxt: "Mobile No.",
                        prefixIcon:
                            iconProperty(iconData: Icons.contact_phone)),
                    DividerWidget(),
                    signUpFields(
                        hinttxt: "Password",
                        prefixIcon: iconProperty(iconData: Icons.lock)),
                    DividerWidget(),
                    signUpFields(
                        hinttxt: "Confirm Password",
                        prefixIcon: iconProperty(iconData: Icons.lock)),
                    DividerWidget(),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: Color(0xffF3487F),
                            value: this.valuePrivacy,
                            onChanged: (bool value) {
                              setState(() {
                                this.valuePrivacy = value;
                              });
                            }),
                        Text(
                          "Accept Privacy Policy",
                          style: TextStyle(
                            color: Color(0xFF73735d),
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffF3487F),
                              Color(0xffF3AA6A),
                            ],
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextField signUpFields({
    String hinttxt,
    Widget prefixIcon,
    Widget suffixIcon,
  }) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hinttxt,
        hintStyle: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF73735d),
        ),
        border: InputBorder.none,
      ),
    );
  }

  Icon iconProperty({@required IconData iconData}) {
    return Icon(
      iconData,
      size: 30,
      color: Colors.black,
    );
  }

  Row gender() {
    return Row(
      children: [
        Text(
          "Gender:",
          style: TextStyle(
            color: Color(0xFF73735d),
            fontSize: 18,
          ),
        ),
        Radio<int>(
          value: 0,
          groupValue: genderValue,
          activeColor: Color(0xffF3487F),
          onChanged: (int value) {
            setState(() {
              genderValue = value;
            });
          },
        ),
        Text(
          "F",
          style: TextStyle(
            color: Color(0xFF73735d),
            fontSize: 18,
          ),
        ),
        Radio<int>(
          value: 1,
          groupValue: genderValue,
          activeColor: Color(0xffF3487F),
          onChanged: (int value) {
            setState(() {
              genderValue = value;
            });
          },
        ),
        Text(
          "M",
          style: TextStyle(
            color: Color(0xFF73735d),
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  // Row birthDate(BuildContext context) {
  //   return Row(
  //     children: [
  //       Expanded(
  //         flex: 5,
  //         child: TextField(
  //           decoration: InputDecoration(
  //             // hintText: "Birthdate",
  //             hintText: date == null
  //                 ? "Birthdate"
  //                 : date.day.toString() +
  //                     "/" +
  //                     date.month.toString() +
  //                     "/" +
  //                     date.year.toString(),

  //             hintStyle: TextStyle(
  //               fontSize: 18.0,
  //               color: Color(0xFF73735d),
  //             ),
  //             border: InputBorder.none,
  //           ),
  //           readOnly: true,
  //         ),
  //       ),
  //       Flexible(
  //         child: GestureDetector(
  //           onTap: () {
  //             selectTimePicker(context);
  //           },
  //           child: Icon(
  //             Icons.calendar_today,
  //             size: 30,
  //             color: Colors.black,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
