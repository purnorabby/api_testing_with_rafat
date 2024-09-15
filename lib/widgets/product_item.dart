import 'package:api_practice1/models/product.dart';
import 'package:api_practice1/screens/update_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)),
      tileColor: Colors.white30,
      title:  Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(product.productCode),
           Text(product.productPrice),
           Text(product.quantity),
           Text(product.totalPrice),
           Divider(
          ),
          ButtonBar(

            children: [
              TextButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return UpdateproductScreen();
                    }));
              },
                  icon: Icon(Icons.edit),
                  label:const Text('Edit')),
              TextButton.icon(onPressed: (){},

                  icon: Icon(Icons.delete,color: Colors.red,), label: const Text('Delete',style:TextStyle(
                      color:Colors.red),)),
            ],
          ),

        ],
      ),
    );
  }
}