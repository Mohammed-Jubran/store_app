import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/get_all_products.dart';
import 'package:store_app/view/widgets/custom_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "New Trend",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              FontAwesomeIcons.cartPlus,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: AllProductsService().getAllProducts(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Padding(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 65),
              child: GridView.builder(
                clipBehavior: Clip.none,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,

                ),
                itemBuilder: (context, index) {
                  return const CustomCard();
                },
              ),
            );
          }
          if(snapshot.hasError){
            return  Center(child:Text('${snapshot.error}'));
          }
          else{
            return  const Center(child:CircularProgressIndicator());
          }
        },
      )
    );
  }
}
