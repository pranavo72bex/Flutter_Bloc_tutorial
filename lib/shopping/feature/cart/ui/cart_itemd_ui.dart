import 'package:bloc_example/shopping/feature/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';

import '../../home/model/home_product_data_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    required this.productDataModel,
    required this.cartBloc,
  });
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.red[100],
      child: SizedBox(
        width: double.infinity - 50,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              //CircleAvatar
              const SizedBox(
                height: 10,
              ), //SizedBox
              Text(
                productDataModel.name,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ), //Text
              const SizedBox(
                height: 10,
              ), //SizedBox
              Text(
                productDataModel.price.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[900],
                  fontWeight: FontWeight.w500,
                ), //Textstyle
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    ); //Card
  }
}
