import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:restful_api/services/user_service.dart';

import 'models/user.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  UserService userService = UserService();

  List<Data> userList = [];
  Data? userData;

  Future<List<Data>> getUserList() async {
    final response = await userService.getUserList(
      currentPage: 2,
    );

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final List list = payLoad['data'];
      userList = list.map((item) => Data.fromJson(item)).toList();
    }

    return userList;
  }

  Future<Data> getUserById() async {
    final response = await userService.getUserById(
      '3',
    );

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final user = payLoad['data'];
      userData = Data.fromJson(user);
    }

    return userData!;
  }

  @override
  Widget build(BuildContext context) {
    getUserById();

    return Scaffold(
      appBar: AppBar(
        title: const Text('R E S T API - D I O'),
        centerTitle: true,
      ),
      body: FutureBuilder<Data>(
        future: getUserById(), // async work
        builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${userData!.firstName}'),
                  Text('${userData!.lastName}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// list of user
// future: getUserList(),

// ------------------------
// return ListView.builder(
// shrinkWrap: true,
// itemCount: userList.length,
// itemBuilder: (context, index) {
// return Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 1, horizontal: 4),
// child: Card(
// child: ListTile(
// onTap: () {
// print(userList[index].id);
// },
// title: Text(
// '${userList[index].firstName} ${userList[index].lastName}'),
// leading: CircleAvatar(
// backgroundImage:
// NetworkImage(userList[index].avatar!),
// ),
// ),
// ),
// );
// })
