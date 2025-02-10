import 'package:api_practice/GetApi_2/Services/photos_services.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String imageUrl;
  const DetailScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    PhotosServices api = PhotosServices();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page '),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: api.getPhotos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Text(
                      'Loading...',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
