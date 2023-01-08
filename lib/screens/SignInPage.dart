import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/home_page.dart';
import 'package:movies_app/screens/ForgotPass.dart';
import 'package:movies_app/screens/SignUpPage.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});



  @override
  Widget build(BuildContext context) {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/Images/signIn.jpeg")
                        )
                    ),
                  ),
                ),
                Text('Welcome',
                  textScaleFactor: 1.5,
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                //Sign In Fields

                Padding(
                  padding: EdgeInsets.fromLTRB(5, 30, 5, 5),
                  child: TextField(

                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.emailAddress ,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Enter your email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _emailController,

                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextField(
                    cursorColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      hintText: "Enter your password",
                      prefixIcon: Icon(Icons.lock_sharp),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    controller: _passController,

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
                        },
                        child: Text('Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight:FontWeight.bold,
                        ),),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed:()async{
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passController.text,
                          );
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

                        } on FirebaseAuthException catch (e) {
                          String error = "";
                          if (e.code == 'user-not-found') {
                            error += "No user found for that email.";
                          } else if (e.code == 'wrong-password') {
                            error += "Wrong password provided for that user.";
                          }
                          else if(e.code=='invalid-email'){
                            error += "Invalid email";
                          }

                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              content: Text(error),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(ctx).pop();
                                  },
                                  child: Container(
                                    color: Colors.lightBlueAccent,
                                    padding: const EdgeInsets.all(14),
                                    child: const Text("Ok", style: TextStyle(color: Colors.black ),),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      } ,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(200, 50),
                        backgroundColor: Colors.lightBlueAccent,
                        elevation: 10,  // Elevation
                        shadowColor: Colors.grey[300], //
                        foregroundColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                      child: Text("Sign In",
                        style: TextStyle(fontSize: 20),)),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                      text: TextSpan(
                          text: "Do not have an account?",
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 20
                          ),
                          children: [
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()..onTap=() {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage()));
                                }
                            )
                          ]
                      )),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    side: BorderSide(color: Colors.white, width: 3, ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                    onPressed: () async{
                    final googleAccount = await GoogleSignIn().signIn();
                    if(googleAccount!=null){
                      final googleAuth = await googleAccount.authentication;
                      if(googleAuth.accessToken!=null && googleAuth.idToken!=null){
                        try{
                          String? name = googleAccount.displayName;
                          String? imageUrl = googleAccount.photoUrl;
                          String email = googleAccount.email;

                          await FirebaseAuth.instance.signInWithCredential(
                            GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken,
                            ),
                          );
                        } on FirebaseException catch(error){
                          print(error.message);
                        } catch(error){
                          //handle error
                        }
                      }
                      else{

                      }
                    }
                    },

                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Image(
                            image: AssetImage("assets/Images/google_logo.jpeg"),
                            height: 25.0,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ),

            ]
        ),
          ),

        ),
      ),
    );
  }
}
