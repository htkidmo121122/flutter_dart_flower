import 'package:flutter/material.dart';
import 'package:health_care/mainpage.dart';
import 'package:health_care/screens/signin_screen/signin_screen.dart';
import 'package:health_care/screens/signup_screen/signup_screen.dart';
import 'package:health_care/screens/splash_screen/components/splash_content.dart';
import '../../constants.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"image": "assets/images/splash_screen.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SizedBox(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) =>
                        SplashContent(image: splashData[index]["image"]),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end, // Đẩy các nút xuống dưới
                      children: <Widget>[
                        //nút đăng ký
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignUpScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            minimumSize: Size(double.infinity,
                                50), // Set kích thước tối thiểu
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            minimumSize: Size(double.infinity, 50), // Set kích thước tối thiểu
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: kPrimaryColor, width: 1),
                            ),
                          ),
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "or connect with",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.facebook, color: Colors.blue),
                              iconSize: 40,
                              onPressed: () {
                                // Handle Facebook login
                              },
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              icon: Icon(Icons.email, color: Colors.red),
                              iconSize: 40,
                              onPressed: () {
                                // Handle Gmail login
                              },
                            ),
                            
                          ],
                        ),
                        const SizedBox(height: 16),
                        // const Text(
                        //   "",
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Mainpage.routeName),
                          child: const Text(
                            "No thanks! Later",
                            style: TextStyle(
                                fontSize: 16,
                                color: kPrimaryLightColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 30), // Thêm khoảng cách bên dưới
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
