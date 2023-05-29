import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../modals/card_item_modal.dart';
import '../utils/app_theme.dart';
import '../utils/localization.dart';
import '../widgets/card_item.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/favorite_merc_card.dart';
import '../widgets/title_with_contect.dart';
import 'categories_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    List<CardItemModal>? restaurantProducts1 = [
      CardItemModal("assets/images/restaurantPics/pngwing 3.png", stringsOf(context)!.open_now),
      CardItemModal("assets/images/restaurantPics/pngwing 1.png", stringsOf(context)!.burger),
      CardItemModal("assets/images/restaurantPics/pizza.png", stringsOf(context)!.pizza),
      CardItemModal("assets/images/restaurantPics/pngwing 4.png", stringsOf(context)!.loc_flv),
    ];
    List<CardItemModal>? restaurantProducts2 = [
      CardItemModal("assets/images/restaurantPics/frying-shrimp 1.png", stringsOf(context)!.sea_food),
      CardItemModal("assets/images/restaurantPics/fine dining 1.png", stringsOf(context)!.dining),
      CardItemModal("assets/images/restaurantPics/pngwing 5.png", stringsOf(context)!.indian),
      CardItemModal("assets/images/restaurantPics/pngaaa 1.png", stringsOf(context)!.desert),
    ];
    List<CardItemModal>? storeProducts = [
      CardItemModal("assets/images/storesPic/pngwing 12.png", stringsOf(context)!.well),
      CardItemModal("assets/images/storesPic/pngwing 13.png", stringsOf(context)!.gift),
      CardItemModal("assets/images/storesPic/pngwing 14.png", stringsOf(context)!.fashion),
      CardItemModal("assets/images/storesPic/toppng 1.png", stringsOf(context)!.life),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacings.normal),
            child: TextField(
              autofocus: false,
              decoration: InputDecoration(
                  prefixIcon: Image.asset("assets/images/search.png"),
                  hintText: stringsOf(context)!.search_shop,
                  hintStyle: Theme.of(context).textTheme.bodySmall),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: CarouselSlider(
              items: [
                CustomCard(
                  backgroundColor: darkPurple,
                ),
                CustomCard(
                  backgroundColor: darkRed,
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/images/Mask group.png",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: AspectRatio(
                                    aspectRatio: 1.1,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Spacings.xsmall),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            stringsOf(context)!.off,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(color: orange),
                                          ),
                                          Text(
                                            stringsOf(context)!.on_any,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                    color: darkBlue,
                                                    fontWeight:
                                                        FontWeight.bold),
                                            maxLines: 1,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: Spacings.xsmall),
                                            child: CustomButton(
                                              width: double.infinity,
                                              height: 30.0,
                                              child: Padding(
                                                padding: EdgeInsets.all(
                                                    Spacings.xsmall),
                                                child: Text(
                                                  stringsOf(context)!.order_now,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(color: white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Spacings.xxxsmall,
                                          ),
                                          Flexible(
                                              child: Text(
                                            stringsOf(context)!.valid_util,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            maxLines: 1,
                                          )),
                                        ],
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Image.asset(
                                      "assets/images/Pizza.png",
                                      fit: BoxFit.contain,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CustomCard(
                  backgroundColor: darkGreen,
                ),
              ],
              options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.3,
                  enlargeCenterPage: false,
                  initialPage: 1),
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: AspectRatio(
                          aspectRatio: 1.0,
                          child: CustomCard(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoriesScreen()));
                            },
                            backgroundColor: lightGreen,
                            child: TitleWithContent(
                              title: stringsOf(context)!.food_delivery,
                              content: stringsOf(context)!.food_stat,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 2.0,
                                      child: Image.asset(
                                        "assets/images/tomato 1.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: AspectRatio(
                                      aspectRatio: 0.9,
                                      child: Image.asset(
                                        "assets/images/food 1.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))),
                  Expanded(
                      child: AspectRatio(
                          aspectRatio: 1.0,
                          child: CustomCard(
                            backgroundColor: lightPurple,
                            child: TitleWithContent(
                              title: stringsOf(context)!.store,
                              content: stringsOf(context)!.store_stat,
                              child: Expanded(
                                  child: AspectRatio(
                                aspectRatio: 2.0,
                                child: Image.asset(
                                    "assets/images/shopping-bag1.png"),
                              )),
                            ),
                          ))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: CustomCard(
                        backgroundColor: lightBlue,
                        child: TitleWithContent(
                          title: stringsOf(context)!.courier,
                          content: stringsOf(context)!.courier_stat,
                          child: Expanded(
                              child: AspectRatio(
                            aspectRatio: 2.0,
                            child: Image.asset("assets/images/parcel 1.png"),
                          )),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      AspectRatio(
                          aspectRatio: 2.0,
                          child: CustomCard(
                            backgroundColor: lightRed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TitleWithContent(
                                    title: stringsOf(context)!.discount,
                                    content: stringsOf(context)!.discount_stat,
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                    child: AspectRatio(
                                  aspectRatio: 2.0,
                                  child: Image.asset(
                                      "assets/images/discounts 1.png"),
                                )),
                              ],
                            ),
                          )),
                      AspectRatio(
                          aspectRatio: 2.0,
                          child: CustomCard(
                            backgroundColor: lightGreen,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TitleWithContent(
                                    title: stringsOf(context)!.membership,
                                    content: stringsOf(context)!.member_stat,
                                    child: Container(),
                                  ),
                                ),
                                Expanded(
                                    child: AspectRatio(
                                  aspectRatio: 0.5,
                                  child: Image.asset(
                                      "assets/images/subscription 1.png"),
                                )),
                              ],
                            ),
                          )),
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: Spacings.normal,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Spacings.xsmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      stringsOf(context)!.fav_merch,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      stringsOf(context)!.view_all,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: orange),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Spacings.normal,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FavoriteMerchCard(
                      imagePath: "assets/images/Rectangle 5918.png",
                      title: stringsOf(context)!.english_tea,
                      subTitle: stringsOf(context)!.english_tea_stat,
                      discount: stringsOf(context)!.off_ex,
                    ),
                    FavoriteMerchCard(
                      imagePath: "assets/images/Rectangle 5919.png",
                      title: stringsOf(context)!.imtiaz,
                      subTitle: stringsOf(context)!.imtiaz_stat,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Spacings.xsmall, vertical: Spacings.xxlarge),
                child: Row(
                  children: [
                    Text(
                      stringsOf(context)!.restaurants,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: restaurantProducts1.map((e) => CardItem(image: e.imagePath!, name: e.name!,)).toList(),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: restaurantProducts2.map((e) => CardItem(image: e.imagePath!, name: e.name!,)).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Spacings.xsmall, vertical: Spacings.xxlarge),
                child: Row(
                  children: [
                    Text(
                      stringsOf(context)!.store,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: storeProducts.map((e) => CardItem(image: e.imagePath!, name: e.name!,)).toList(),
                ),
              ),
              SizedBox(
                height: 100.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}


