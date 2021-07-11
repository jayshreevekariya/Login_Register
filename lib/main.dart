import 'package:flutter/material.dart';
import 'package:login_register/divider.dart';
import 'package:login_register/register.dart';
//import 'package:login_register/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        tabBarTheme: TabBarTheme(labelColor: Colors.black),
   ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double btnheight = 50;
  double btnwidth = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 50,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(2.5, 0.0),
            colors: [
              Color(0xffF3AA6A),
              Color(0xffF3487F),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    displayImage(),
                    tabControllerAndDesign(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayImage() {
    return Image.asset(
      'assets/images/happy_customer.png',
      height: 150,
      width: 200,
      fit: BoxFit.contain,
    );
  }

  Widget tabControllerAndDesign(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xffB46355),
            ),
            child: displayTab(),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.595,
            child: displayTabBarView(context),
          )
        ],
      ),
    );
  }

  Widget displayTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        loginView(context),
        Registration(),
      ],
    );
  }

  Widget loginFields() {
    return Container(
      child: SizedBox(
        height: 225,
        child: Stack(
          children: [
            Container(
              height: 200,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Container(
                child: Column(
                  children: [
                    emailField(),
                    DividerWidget(),
                    paaswordField(),
                  ],
                ),
              ),
            ),
            loginBtn(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail_outline,
            size: 30,
            color: Colors.black,
          ),
          hintText: 'E-mail Address',
          border: InputBorder.none),
    );
  }

  Widget paaswordField() {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.lock_sharp,
          size: 30,
          color: Colors.black,
        ),
        hintText: 'Password',
        border: InputBorder.none,
        suffixIcon: Icon(
          Icons.remove_red_eye,
          color: Colors.black,
        ),
      ),
      obscureText: true,
    );
  }

  Widget loginBtn() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: btnheight,
        width: btnwidth,
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
              "LOGIN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginView(BuildContext context) {
    return Column(
      children: [
        loginFields(),
        gapBetweenComponent(gapHeight: 20),
        forgetPassword(),
        gapBetweenComponent(),
        divider(context),
        gapBetweenComponent(),
        socialMediaBtns(),
      ],
    );
  }

  Widget gapBetweenComponent({double gapHeight: 18}) {
    return SizedBox(
      height: gapHeight,
    );
  }

  Widget forgetPassword() {
    return Container(
      child: Text(
        "Forget Password?",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
          decoration: TextDecoration.underline,
          decorationThickness: 1.5,
        ),
      ),
    );
  }

  Widget divider(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 1.5,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white10,
                  Colors.white,
                ],
              ),
            ),
          ),
          Text(
            "Or",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Container(
            height: 1.5,
            width: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white10,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialMediaBtns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        fbBtn(),
        googleBtn(),
      ],
    );
  }

  Widget fbBtn() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "f",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        onPrimary: Colors.blue,
        primary: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }

  Widget googleBtn() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        "G",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        onPrimary: Colors.blue,
        primary: Colors.white,
        shape: CircleBorder(),
      ),
    );
  }

  Widget displayTab() {
    return TabBar(
      labelStyle: tabTextStyle(),
      unselectedLabelStyle: tabTextStyle(),
      // labelColor: Colors.black,
      unselectedLabelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xffB46355), width: 3.0),
          color: Colors.white),
      tabs: [
        Tab(
          child: Container(
            child: Text(
              "Login",
            ),
          ),
        ),
        Tab(
          child: Text(
            "Register",
          ),
        ),
      ],
    );
  }

  TextStyle tabTextStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
    );
  }
}
