import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/category_product_provider.dart';
import '../utils/app_theme.dart';
import '../utils/localization.dart';
import '../widgets/loading_products_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    var categoryProductProduct = context.read<CategoryProductProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if(categoryProductProduct.categoryProducts == null){
        if (context.mounted) {
          categoryProductProduct.getCategoryProducts();
        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProductProvider>(
      builder: (context, productProvider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(stringsOf(context)!.food_drinks, style: Theme.of(context).textTheme.titleMedium,),
                RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: stringsOf(context)!.deliver, style: Theme.of(context).textTheme.bodyMedium,),
                        TextSpan(text: stringsOf(context)!.to, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: orange),),
                      ]
                    )
                ),
              ],
            ),
            actions: [
              Image.asset("assets/images/search.png"),
            ],
          ),
          body: productProvider.isLoading?
          const LoadingProductsWidget()
              : productProvider.categoryProducts == null && !productProvider.isLoading? Container() : GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 500 ?2 : 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.all(Spacings.xsmall),
          // childAspectRatio: 1.0,
          shrinkWrap: true,
          children: List.generate(productProvider.categoryProducts!.length, (index) {
            return AspectRatio(
              aspectRatio: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: cardDecoration,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Spacings.normal),
                        child: CachedNetworkImage(imageUrl: productProvider.categoryProducts![index].image,placeholder: (context, str) {
                          return const Center(child: Icon(Icons.photo_outlined, color: Colors.grey, size: 60.0,));
                        },
                         fit: BoxFit.contain,
                          height: MediaQuery.of(context).size.width/2,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Spacings.normal),
                    child: Text(productProvider.categoryProducts![index].title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xff2CA66F), fontWeight: FontWeight.bold), maxLines: 3,),
                  )
                ],
              ),
            );
          },),
        ),
        );
      }
    );
  }
}


