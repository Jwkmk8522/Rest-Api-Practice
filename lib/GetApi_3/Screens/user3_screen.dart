import 'package:api_practice/GetApi_3/Services/user3_services.dart';
import 'package:flutter/material.dart';

class User3Screen extends StatefulWidget {
  const User3Screen({super.key});

  @override
  State<User3Screen> createState() => _User3ScreenState();
}

class _User3ScreenState extends State<User3Screen> {
  @override
  Widget build(BuildContext context) {
    User3Services api = User3Services();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Api User3 (Complex Json)'),
        backgroundColor: Colors.blue[100],
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: api.getApi(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Loading ...'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: api.userList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        color: Colors.pink[100],
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Text(
                                  'Introduction',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ReUseAbleRow(
                                    title: 'Number',
                                    value:
                                        snapshot.data![index].id!.toString()),
                                ReUseAbleRow(
                                    title: 'Name',
                                    value:
                                        snapshot.data![index].name!.toString()),
                                ReUseAbleRow(
                                    title: 'User_Name',
                                    value: snapshot.data![index].username!
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Email',
                                    value: snapshot.data![index].email!
                                        .toString()),
                                const Text(
                                  'Adress',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ReUseAbleRow(
                                    title: 'Adress',
                                    value: snapshot.data![index].address!.city
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Street',
                                    value: snapshot.data![index].address!.street
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Suite',
                                    value: snapshot.data![index].address!.suite
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Zipcode',
                                    value: snapshot
                                        .data![index].address!.zipcode
                                        .toString()),
                                const Text(
                                  'Geo',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ReUseAbleRow(
                                    title: 'Lat',
                                    value: snapshot
                                        .data![index].address!.geo!.lat
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Lag',
                                    value: snapshot
                                        .data![index].address!.geo!.lng
                                        .toString()),
                                const Text(
                                  'Company',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ReUseAbleRow(
                                    title: 'Company Name',
                                    value: snapshot.data![index].company!.name
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'Catch_Phrase',
                                    value: snapshot
                                        .data![index].company!.catchPhrase
                                        .toString()),
                                ReUseAbleRow(
                                    title: 'BS',
                                    value: snapshot.data![index].company!.bs
                                        .toString()),
                              ],
                            )),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class ReUseAbleRow extends StatelessWidget {
  final String title;
  final String value;
  const ReUseAbleRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
