import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:restful_api/services/user_service.dart';
import 'models/user.dart';
import 'UserDetailsPage.dart'; // Import the UserDetailsPage

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserService userService = UserService();
  late Future<List<Data>> _userListFuture;
  bool isLoading = false;

  List<Data> userListData = [];

  @override
  void initState() {
    super.initState();
    _userListFuture = getUserList();
  }

  Future<List<Data>> getUserList() async {
    isLoading = true;
    setState(() {});
    final response = await userService.getItemList(currentPage: 2);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final List list = payLoad['data'];
      return list.map((item) => Data.fromJson(item)).toList();
    }
    isLoading = false;
    setState(() {});

    return [];
  }

  Future<Data?> getUserById(String userId) async {
    final response = await userService.getUserById(userId);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final user = payLoad['data'];
      return Data.fromJson(user);
    }
    return null;
  }

  Future deleteUser(String userId) async {
    try {
      userListData.removeWhere((element) => element.id.toString() == userId);
      print(userListData.length);
      setState(() {});

      final response = await userService.deleteUser(userId);
      if (response.statusCode == 200) {
        return 'Deletion successful';
      } else {
        print('not Success');
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('R E S T API - D I OS'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Data>>(
        future: _userListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
                child: Text('Error fetching or no data found!'));
          } else {
            userListData = snapshot.data!;

            return ListView.builder(
              itemCount: userListData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                  child: Card(
                    child: ListTile(
                        onTap: () async {
                          Data? userDetails = await getUserById(
                              userListData[index].id.toString());
                          if (userDetails != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UserDetailsPage(user: userDetails),
                              ),
                            );
                          } else {
                            // Handle when user details are null
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text('User details not available')),
                            );
                          }
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userListData[index].avatar!),
                        ),
                        title: Text(
                          '${userListData[index].firstName!}',
                        ),
                        subtitle: Text(
                          '${userListData[index].email!}',
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            deleteUser(userListData[index].id.toString());
                          },
                          icon: const Icon(Icons.delete),
                        )),
                  ),
                );
              },
            );
          }
        },
      ),

      // floatingActionButton: ElevatedButton( // Adding the ElevatedButton
      //   onPressed: () async {
      //     Data? userDetails = await getUserById('3'); // Change user ID here
      //     if (userDetails != null) {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => UserDetailsPage(user: userDetails),
      //         ),
      //       );
      //     } else {
      //       // Handle when user details are null
      //       ScaffoldMessenger.of(context).showSnackBar(
      //         SnackBar(content: Text('User details not available')),
      //       );
      //     }
      //   },
      //   child: Text('Fetch User 1 Details'), // Button text
      // ),
    );
  }
}
