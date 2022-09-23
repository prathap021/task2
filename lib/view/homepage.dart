import 'package:flutter/material.dart';
import 'package:sample/services/api.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final userpassword = TextEditingController();
  bool obskey = true;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    userpassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Image.asset(
                        "asset/new.jpeg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    // height: 40,
                    width: double.infinity,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 12),
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email Address';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: 'Username or phone number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    // height: 40,
                    width: double.infinity,
                    child: TextFormField(
                      obscureText: obskey,
                      style: const TextStyle(fontSize: 12.0),
                      controller: userpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {});
                              obskey = !obskey;
                            },
                            child: Icon(obskey
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          username = email.text.trim();
                          password = userpassword.text.trim();
                        });
                        if (_formKey.currentState!.validate()) {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Processing Data')),
                          // );
                          postdata();
                        }
                      },
                      child: const Center(
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.yellow),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Guest LogIn",
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: Text("OR"),
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.yellow),
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
