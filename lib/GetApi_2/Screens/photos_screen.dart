// import 'package:api_practice/GetApi_2/Screens/detail_screen.dart';
import 'package:api_practice/GetApi_2/Models/photos_modal.dart';
import 'package:api_practice/GetApi_2/Screens/detail_screen.dart';
import 'package:api_practice/GetApi_2/Services/photos_services.dart';

import 'package:flutter/material.dart';

class PhotosScreen extends StatefulWidget {
  const PhotosScreen({super.key});

  @override
  State<PhotosScreen> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  PhotosServices api = PhotosServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Phots Json (Medium)"),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //       // Navigator.of(context).push(MaterialPageRoute(
          //       //     builder: (context) => const User3Screen()));
          //     },
          //     child: const Text('User 3'),
          //   ),
          //   // IconButton(onPressed: (){}, icon: const Icon(Icons.abc))
          // ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<PhotosModels>(
                future: api.getPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Loading...',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 32),
                      ),
                    );
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.photos!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 3,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      imageUrl: snapshot
                                          .data!.photos![index].src!.large
                                          .toString(),
                                    )));
                          },
                          child: Image.network(
                            snapshot.data!.photos![index].src!.tiny.toString(),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     setState(() {
            //       api.loadImage();
            //     });
            //   },
            //   child: const Padding(
            //     padding: EdgeInsets.all(16.0),
            //     child: Text(
            //       'Load More',
            //       style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 30),
            //     ),
            //   ),
            // ),
          ],
        ));
  }
}
