import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyAccountPage(),
  ));
}

class MyAccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Center(
        child: MyAccountForm(),
      ),
    );
  }
}

class MyAccountForm extends StatefulWidget {
  @override
  _MyAccountFormState createState() => _MyAccountFormState();
}

class _MyAccountFormState extends State<MyAccountForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 150,
          backgroundColor: Colors.purpleAccent,
          backgroundImage: NetworkImage(
              'https://cdn2.iconfinder.com/data/icons/avatars-60/5985/12-Delivery_Man-512.png'),
        ),
        TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            labelText: 'Nama',
          ),
        ),
        TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextFormField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
