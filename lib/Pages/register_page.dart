import 'package:flutter/material.dart';
import 'package:debtstiny/Components/button.dart';
import 'package:debtstiny/Components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String selectedRadio = ''; // Variable to track the selected radio button value



  final TextEditingController nameController = TextEditingController();
  final TextEditingController nricPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void signUpUser() {
    // Implement sign up logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFFD3F4E3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Center(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'lib/Images/logo-s.png',
                    width: 200,
                    height: 200,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF052C51),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Let’s begin your journey with us!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                  ),
                ),

                child: Padding(
                padding: EdgeInsets.all(10),
    child: ListView(
    shrinkWrap: true,
    children: <Widget>[
    MyTextField(
    controller: nameController,
    hintText: 'Name',
    obscureText: false,
    ),
    SizedBox(height: 10),
    Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
    children: [
    Radio(
    value: 'NRIC',
    groupValue: selectedRadio,
    onChanged: (value) {
    setState(() {
    selectedRadio = value.toString();
    });
    },
    ),
    Text('NRIC'),
    SizedBox(width: 20),
    Radio(
    value: 'Password',
    groupValue: selectedRadio,
    onChanged: (value) {
    setState(() {
    selectedRadio = value.toString();
    });
    },
    ),
    Text('Password'),
    ],
    ),
    ),
    SizedBox(height: 10),
    MyTextField(
    controller: nricPasswordController,
    hintText: selectedRadio == 'NRIC' ? 'NRIC' : 'Passport',
    obscureText: true,
    ),
    SizedBox(height: 10),
                      MyTextField(
                        controller: phoneNumberController,
                        hintText: 'Phone Number',
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        controller: emailController,
                        hintText: 'Email',
                        obscureText: false,
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                          'Use 12 or more characters with a mix of letters, numbers & symbols',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: 'Confirm Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 10),
                      SizedBox(height: 30),
                      Button(
                        onTap: signUpUser,
                        text: 'Submit',
                      ),
                      SizedBox(height: 50),

                        ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}