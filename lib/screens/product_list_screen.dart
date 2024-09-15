import 'dart:convert';

import 'package:api_practice1/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  List<Product>productList=[];

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: productList.length,
            itemBuilder: (context,index){
          return  ProductItem(
            product: productList[index],
          );
        }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 4,);
        },),
      ),
      floatingActionButton:FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context){
                  return const AddNewProductScreen();
                }));
          },
      child:const Icon(Icons.add),
      ),
    );
  }

  Future<void> getProductList()async{
    print('Requesting..');
    Uri uri=Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response=await get(uri);
    print(response);
    print(response.body);
    print(response.statusCode);
    if(response.statusCode==200){
      Map<String,dynamic>jsonResponse=jsonDecode(response.body);
    for(var item in jsonResponse['data']){

      Product product=Product(id: item["_id"],
          productName: item["ProductName"],
          productCode: item["ProductCode"],
          productImage: item["Img"],
          productPrice: item["UnitPrice"],
          quantity: item["Qty"],
          totalPrice: item["TotalPrice"],
          createdAt: item["CreatedDate"]);
      productList.add(product);

    }

    }

    setState(() {});


  }
}


