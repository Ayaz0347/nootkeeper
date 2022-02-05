import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:notekeeper/screens/note_list.dart';
import 'methods.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  MethodsHandler _methodsHandler = MethodsHandler();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   width: size.width * 0.5,
                  //   height: size.height * 0.07,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      height: size.height * 0.2,
                      width: size.width * 0.6,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                    child: Container(
                        child: const Text("Please Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 10.0),
                    child: Container(
                        width: size.width * 0.8,
                        alignment: Alignment.center,
                        child: const Text(
                            "Manage your tasks, events and much more",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: Container(
                      // height: size.height * 0.1,
                        width: size.width * 0.8,
                        // decoration: BoxDecoration(
                        //   border: Border.all(width: 2,color: Colors.blue),
                        // ),

                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 9.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ),
                            ),
                            hintText: 'Enter Email account',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            //EmailValidator.validate(value!);
                            if (!EmailValidator.validate(
                                _emailController.text)) {
                              return 'Please provide valid email';
                            }
                            return null;
                          },
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      width: size.width * 0.8,
                      child: TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              //  labelText: "Enter Email",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Enter Password"))),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                    child: ElevatedButton(
                      onPressed: () {
                             if(_formKey.currentState!.validate()){
                               _methodsHandler.loginAccount(_emailController.text, _passwordController.text);
                               Navigator.push(context,MaterialPageRoute(builder: (_) => NoteList()));
                             }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: RichText(
                        text: TextSpan(
                            text: 'By continuing you agree to Our app\'s ',
                            style:
                            TextStyle(color: Colors.black, fontSize: 10.0),
                            children: [
                              TextSpan(
                                text: 'term of use ',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                              TextSpan(
                                text: 'and Confirm that you have read our app\'s ',
                                style: TextStyle(
                                  fontSize: 10.0,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy policy',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline),
                              ),
                            ])),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
