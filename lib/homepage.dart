import 'package:admob_flutter/admob_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'screens/tattoo_gallery.dart';
import 'items.dart';
import 'models/categories_model.dart';
import 'screens/shopaddress.dart';
import 'screens/show_categories.dart';
import 'services/ad_manager.dart';

class MyHomePage extends StatefulWidget {
  final List<CategoryModel> categories;

  MyHomePage(this.categories);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  InterstitialAd newInterAd;

  @override
  void initState() {
    Admob.initialize();
    newInterAd = AdManager.myInterstitial;
    newInterAd.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Burma Tattoo Gallery",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text('Burma Tattoo Gallery'),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/App Logo.png'),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShowCategories(widget.categories)),
                );
              },
              child: Text(
                'Categories',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) {
                      return SimpleDialog(
                        title: Text('HELP'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 8.0),
                            child: Text(
                              'If you want to Ad about your Tattoo\'s Shop in Our app. You can contact us.',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          SimpleDialogOption(
                            onPressed: () {
                              _launchURL('tel:09777400744');
                            },
                            child: Text(
                              'Contact Us',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              child: Text(
                'Help',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: carouselImages.map((e) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  image: DecorationImage(
                    image: AssetImage(e),
                    fit: BoxFit.cover,
                  ),
                ),
                // child: Image.asset(e),
              );
            }).toList(),
            options: CarouselOptions(
              autoPlay: true,
              // aspectRatio: 2.0,
              // enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          buildLabel("Categories"),
          buildCategory(widget.categories
              .map((e) => buildLabelWithImage(
                    e.name,
                    e.imgUrl,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TattooGallery(
                            id: e.id.toString(),
                            title: e.name,
                          ),
                        ),
                      );
                    },
                  ))
              .toList()),
          buildLabel("Shops"),
          buildCategory(shopsCatagories
              .map((e) => buildLabelWithImage(
                    e.name,
                    e.image,
                    onTap: () {
                      newInterAd.show();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShopAddress(
                                  city: e.name,
                                )),
                      );
                    },
                    isImageFile: true,
                  ))
              .toList()),
          AdmobBanner(
            adUnitId: AdManager.bannerAdUnitId,
            adSize: AdmobBannerSize.FULL_BANNER,
          ),
          buildLabel("About Us"),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: "App Developed By Teambes Lab",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    TextSpan(
                      text: "\ncopyright @ 2020 Teambeslab,",
                      style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    )
                  ]),
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL('https://www.facebook.com/teambeslab2020/');
                  },
                  child: buildCustomIcon(
                    label: "Facebook",
                    icon: FontAwesomeIcons.facebookF,
                    color: Colors.blue,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  buildCategory(List<Widget> children) {
    return SizedBox(
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView(
          children: children,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  GestureDetector buildLabelWithImage(String name, String imgUrl,
      {Function onTap, bool isImageFile = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 8.0, right: 4.0),
        width: 200.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: isImageFile
                ? AssetImage(imgUrl)
                : CachedNetworkImageProvider(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
              child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          )),
        ),
      ),
    );
  }

  buildCustomIcon({String label, IconData icon, Color color}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 26.0,
              backgroundColor: Colors.black26,
              child: FaIcon(
                icon,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
