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
  bool isLoading= false;

  @override
  void initState() {
    super.initState();
    _userListFuture = getUserList();
  }

  Future<List<Data>> getUserList() async {
    isLoading = true;
    setState(() {

    });
    final response = await userService.getItemList(currentPage: 1);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final List list = payLoad['data'];
      return list.map((item) => Data.fromJson(item)).toList();
    }
    isLoading = false;
    setState(() {

    });

    return []; // Return an empty list if response is null
  }

  Future<Data?> getUserById(String userId) async {
    final response = await userService.getUserById(userId);

    if (response != null) {
      final payLoad = jsonDecode(response.payload);
      final user = payLoad['data'];
      return Data.fromJson(user);
    }
    return null; // Handle case when response is null
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: const Text('R E S T API - D I O'),
        centerTitle: true,
      ),
      body:




      FutureBuilder<List<Data>>(
        future: _userListFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Error fetching or no data found!'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                  child: Card(
                    child: ListTile(
                      onTap: () async {
                        Data? userDetails = await getUserById(snapshot.data![index].id.toString());
                        if (userDetails != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserDetailsPage(user: userDetails),
                            ),
                          );
                        } else {
                          // Handle when user details are null
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('User details not available')),
                          );
                        }
                      },
                      title: Text(
                        '${snapshot.data![index].firstName!}',
                      ),
                      subtitle:  Text(
                        '${snapshot.data![index].email!}',
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(snapshot.data![index].avatar!),
                      ),
                    ),
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
