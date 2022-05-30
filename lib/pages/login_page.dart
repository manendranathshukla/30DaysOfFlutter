import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changedButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "assets/images/login.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Welcome $name",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: () async {
                    setState(() {
                      changedButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changedButton ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.shade500,
                        // shape:
                        //     changedButton ? BoxShape.circle : BoxShape.rectangle,

                        borderRadius:
                            BorderRadius.circular(changedButton ? 50 : 8)),
                    child: changedButton
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                  ),
                )

                // ElevatedButton(
                //     onPressed: () =>
                //         {Navigator.pushNamed(context, MyRoutes.homeRoute)},
                //     style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                //     child: Text("Login"))
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
