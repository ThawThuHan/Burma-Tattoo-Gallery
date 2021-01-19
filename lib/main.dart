import 'package:burma_tattoo_gallery/api/firebase_helper.dart';
import 'package:burma_tattoo_gallery/models/shopCategory_modal.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'services/ad_manager.dart';
import 'welcome_splash.dart';
import 'homepage.dart';
import 'models/categories_model.dart';
import 'api/api_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider.value(
          initialData: <ShopCategoryModal>[],
          value: FireHelper.getShopCategory(),
          lazy: false,
        )
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder<List<CategoryModel>>(
            future: ApiCall.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CategoryModel> categories = snapshot.data;
                return MyHomePage(categories);
              }
              return WelcomeSplash();
            }),
      ),
    );
  }
}
