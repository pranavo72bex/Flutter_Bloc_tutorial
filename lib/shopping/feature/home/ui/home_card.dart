import 'package:bloc_example/shopping/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

import '../model/home_product_data_model.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
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
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductWishListButtonClickedEvent(
                          clicketProduct: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        HomeProductCartButtonClickedEvent(
                          clicketProduct: productDataModel,
                        ),
                      );
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  )
                ],
              )
            ],
          ), //Column
        ), //Padding
      ), //SizedBox
    ); //Card
  }
}
