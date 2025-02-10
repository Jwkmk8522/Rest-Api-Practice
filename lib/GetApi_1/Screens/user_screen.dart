import 'package:api_practice/GetApi_1/Services/user_service.dart';
import 'package:api_practice/GetApi_2/Screens/photos_screen.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  UserService api = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Rest Api's Simple"),
          backgroundColor: Colors.blue,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PhotosScreen()));
              },
              child: const Text('See the photos api'),
            )
            // IconButton(onPressed: (){}, icon: const Icon(Icons.abc))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: api.getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                      itemCount: api.postList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(20),
                          elevation: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Item Number :",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                // Text(api.postList[index].id.toString()),
                                Text(snapshot.data![index].id.toString()),
                                const SizedBox(
                                  height: 10,
                                ),
                                // "Title : \n"
                                //"Title : \n"
                                //"Title : \n"
                                const Text("Title : ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                Text(api.postList[index].title.toString()),
                                const SizedBox(
                                  height: 10,
                                ),

                                const Text("Description: ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                Text(api.postList[index].body.toString()),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}
