import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/app_theme.dart';

class LoadingProductsWidget extends StatelessWidget {
  const LoadingProductsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width < 500 ?2 : 4,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.all(Spacings.xsmall),
          // childAspectRatio: 1.0,
          shrinkWrap: true,
          children: List.generate(10, (index) {
            return AspectRatio(
              aspectRatio: 3.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.width/2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Spacings.normal),
                          color: Colors.black
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Spacings.xsmall),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Spacings.xsmall),
                          color: Colors.black
                      ),
                      height: Spacings.small,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: Spacings.xsmall),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Spacings.xsmall),
                          color: Colors.black
                      ),
                      height: Spacings.small,
                      width: 100.0,
                    ),
                  ),
                ],
              ),
            );
          },),
        ),
      ),
    );
  }
}