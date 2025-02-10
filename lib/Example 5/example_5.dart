import 'dart:convert';

import 'package:api_practice/Example%205/Modal/products_modal.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Example5 extends StatefulWidget {
  const Example5({Key? key}) : super(key: key);

  @override
  _Example5State createState() => _Example5State();
}

class _Example5State extends State<Example5> {
  Future<ProductsModals> getProductsApi() async {
    //create your own api
    final response = await http.get(
        Uri.parse('https://webhook.site/7bdd1bc9-0c8a-457a-aa23-31f9e7346888'));
    var dat = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModals.fromJson(dat);
    } else {
      return ProductsModals.fromJson(dat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Example 5'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<ProductsModals>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(snapshot
                                    .data!.data![index].shop!.name
                                    .toString()),
                                subtitle: Text(snapshot
                                    .data!.data![index].shop!.shopemail
                                    .toString()),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data!.data![index].shop!.image
                                      .toString()),
                                ),
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height * .3,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot
                                        .data!.data![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  .25,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          snapshot
                                                              .data!
                                                              .data![index]
                                                              .images![position]
                                                              .url
                                                              .toString()))),
                                            ),
                                            Positioned(
                                              bottom: 50,
                                              right: 20,
                                              child: Text(
                                                  'RS ${snapshot.data!.data![index].price}'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                              Icon(snapshot.data!.data![index].inWishlist! ==
                                      false
                                  ? Icons.favorite
                                  : Icons.favorite_outline)
                            ],
                          );
                        });
                  } else {
                    return Text('Loading');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
