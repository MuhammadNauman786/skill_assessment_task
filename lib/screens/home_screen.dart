

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_assessment_task/providers/auth_provider.dart';
import 'package:skill_assessment_task/providers/locale_provider.dart';
import 'package:skill_assessment_task/screens/welcome_screen.dart';

import '../utils/app_theme.dart';
import '../utils/constants.dart';
import '../utils/localization.dart';
import '../widgets/bottom_navigation_bar/bar.dart';
import '../widgets/bottom_navigation_bar/item.dart';
import 'categories_screen.dart';
import 'home_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      tabController = TabController(length: 5, vsync: this);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, locale, child1) {
        return Consumer<AuthProvider>(
          builder: (context, authProvider, child2) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0.0,
                leadingWidth: 28.0,
                leading: Image.asset(
                  "assets/images/map-marker-Regular.png",
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(stringsOf(context)!.shipping_in, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff07052A),
                      fontWeight: FontWeight.bold
                    ),),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(color: orange)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(stringsOf(context)!.ch_location, style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: orange
                        )
                        ),
                      ),
                    ),
                  ],
                ),
                actions: [
                  InkWell(
                    onTap: (){
                      if(locale.locale.name == LOCALE.en.name){
                        locale.setLocale(LOCALE.ar);
                      }else{
                        locale.setLocale(LOCALE.en);
                      }
                    },
                    child: Image.asset(
                      "assets/images/heart.png",
                    ),
                  ),

                ],
              ),
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  const HomeContent(),
                  Center(child: Text(stringsOf(context)!.order, style: Theme.of(context).textTheme.bodyMedium,),),
                  const Center(child: Text('Basket')),
                  Center(child: Text(stringsOf(context)!.chat, style: Theme.of(context).textTheme.bodyMedium,),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(stringsOf(context)!.profile, style: Theme.of(context).textTheme.bodyMedium,),
                      IconButton(onPressed: (){
                        FirebaseAuth.instance.signOut();
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const WelcomeScreen()), (route) => false);
                      }, icon: const Icon(Icons.logout)),
                    ],
                  ),
                ],
              ),
              bottomNavigationBar: ConvexAppBar(
                initialActiveIndex: 0,
                // disableDefaultTabController: true,
                height: 80.0,
                top: -16,
                style: TabStyle.fixedCircle,
                // controller: tabController,
                onTap: (index){
                  if(index != 2){
                    tabController.animateTo(index);
                  }
                  else{
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CategoriesScreen()));
                  }
                  setState(() {
                    if (index != 2) {
                      currentIndex = index;
                    }
                  });
                },

                items: <TabItem<Widget>>[
                  TabItem(icon: currentIndex == 0? Image.asset(
                    "assets/images/home-Filled.png",
                  ) : Image.asset(
                    "assets/images/home-Regular.png",
                  ), title: stringsOf(context)!.home,),
                  TabItem(icon: currentIndex == 1? Image.asset(
                    "assets/images/package-Filled.png",
                  ) : Image.asset(
                    "assets/images/package-Regular.png",
                  ), title: stringsOf(context)!.order),
                  TabItem(icon:  Image.asset(
                    "assets/images/shopping-basket-Filled.png",
                  ), ),
                  TabItem(icon: currentIndex == 3? Image.asset(
                    "assets/images/comment-dots-Filled.png",
                  ) :  Image.asset(
                    "assets/images/comment-dots-Regular.png",
                  ), title: stringsOf(context)!.chat),
                  TabItem(icon: currentIndex == 4? Image.asset(
                    "assets/images/user-Filled.png",
                  ) :  Image.asset(
                    "assets/images/user-Regular.png",
                  ), title: stringsOf(context)!.profile),
                ],
                gradient: linearGradient,
                cornerRadius: 16.0,
              ),
            );
          }
        );
      }
    );
  }
}


