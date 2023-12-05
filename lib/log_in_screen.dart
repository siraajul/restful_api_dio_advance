import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restful_api/style.dart';

import 'home.dart';
import 'models/user.dart';
import 'services/user_service.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final nameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  UserService userService = UserService();
//Create User
  Future createUser(String userName, String userJob) async {
    final response = await userService.createUser(userName, userJob);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final user = Person.fromJson(payLoad);
      print(user.name);
      print(user.job);
      // return user;
    }
    return null; // Handle case when response is null
  }
//Update User
  Future updateUser(String userName, String userJob, String userId) async {
    final response = await userService.updateUser(userName, userJob, userId);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final user = Person.fromJson(payLoad);
      print(user.name);
      print(user.job);
      // return user;
    }
    return null; // Handle case when response is null
  }
  Future deleteUser(String userId) async {
    final response = await userService.deleteUser(userId);

    if (response != null) {
      // final payLoad = jsonDecode(response.payload);
      // final user = Person.fromJson(payLoad);
      print('User Deleted');
      // return user;
    }
    return null; // Handle case when response is null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'A P I - LOG IN',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter Your Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: addressCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                    hintText: 'Enter Your address'),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  nameCtrl.text = '';
                  addressCtrl.text = '';
                },
                style: LogInButton,
                child: const Text('GET')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {}, style: GetButton, child: const Text('POST')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await deleteUser('4');
                },
                style: GetButton,
                child: const Text('Delete')),
            //--------------------------Print Text On Screen------------------------------------
            const SizedBox(
              height: 32,
            ),
            /*Text('My name: $name'),
            const SizedBox(
              height: 8,
            ),
            Text('My address: $address'),
*/
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                style: GetButton,
                child: const Text('Next Page')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await createUser(nameCtrl.text, addressCtrl.text);
                },
                style: GetButton,
                child: const Text('Create User')),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  await updateUser(nameCtrl.text, addressCtrl.text,'2');
                },
                style: GetButton,
                child: const Text('Update User')),
          ],
        ),
      ),
    );
  }
}
