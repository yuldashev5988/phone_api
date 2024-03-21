import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:phone_api/model.dart';
import 'package:phone_api/service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var logger = Logger();
  List items = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    void getData() {
      ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
          .then((response) => logger.i(response));
    }

    void getCatagory() {
      ProductService.GET_CATAGORY(ProductService.GET_CATEGORIES_API,
              ProductService.paramsGetCatagory())
          .then((response) => logger.i(response));
    }

    void parsingCategory() {
      ProductService.GET_CATAGORY(ProductService.GET_CATEGORIES_API,
              ProductService.paramsGetCatagory())
          .then((response) => {
                setState(() {
                  items = ProductService.parsingResponse(response!);
                }),
              });
    }

    void parsingData() {
      ProductService.GET(ProductService.GET_API, ProductService.paramsGet())
          .then((response) => {
                setState(() {
                  logger.w(response);
                  items = ProductService.parsingResponse(response!);
                }),
              });
    }

    void initState() {
      // TODO: implement initState
      super.initState();
      parsingData();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Gadgets".toUpperCase()),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  getData();
                },
                icon: Icon(Icons.download)),
            IconButton(
                onPressed: () {
                  getCatagory();
                },
                icon: Icon(Icons.category))
          ],
        ),
        body: RefreshIndicator(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return categor(items[index]);
                }),
            onRefresh: () async {
              parsingData();
            }));
  }

  Widget categor(Product product) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 100,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.id.toString()),
          SizedBox(
            height: 20,
          ),
          Text(product.brand.toString().toUpperCase()),
          SizedBox(
            height: 20,
          ),
          Text(product.category.toString().toUpperCase()),
          SizedBox(
            height: 20,
          ),
          Text(product.price.toString().toUpperCase()),
          SizedBox(
            height: 20,
          ),
          Text(product.stock.toString().toUpperCase()),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            width: 350,
            child: Image(image: NetworkImage(product.thumbnail)),
          )
        ],
      ),
    );
  }
}
