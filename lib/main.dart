import 'dart:async';

import 'package:coding_dojo_app/bottomnav_page.dart';
import 'package:coding_dojo_app/consumable_store.dart';
import 'package:coding_dojo_app/globalvars.dart';
import 'package:coding_dojo_app/homepage.dart';
import 'package:coding_dojo_app/new_onboarding/new_onboarding_1_page.dart';
import 'package:coding_dojo_app/new_onboarding/new_onboarding_2_page.dart';
import 'package:coding_dojo_app/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartlook/smartlook.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF0F1010),
  ));

  // For play billing library 2.0 on Android, it is mandatory to call
  // [enablePendingPurchases](https://developer.android.com/reference/com/android/billingclient/api/BillingClient.Builder.html#enablependingpurchases)
  // as part of initializing the app.
  InAppPurchaseConnection.enablePendingPurchases();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

const List<String> _kProductIds = <String>[
  'premium_membership',
  // 'lifetime_joy',
  // 'test_1',
  // 'test_2',
  // 'test_3',
  // 'test_4',
];

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _onBoardingSeen = -1;

  final InAppPurchaseConnection _connection = InAppPurchaseConnection.instance;
  StreamSubscription<List<PurchaseDetails>> _subscription;
  // List<String> _notFoundIds = [];
  List<ProductDetails> _products = [];
  List<PurchaseDetails> _purchases = [];
  List<String> _consumables = [];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String _queryProductError;

  Future<void> checkIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _onSeen = (prefs.getBool('onBoardingSeen') ?? false);
    print(_onSeen);
    if (_onSeen) {
      setState(() {
        _onBoardingSeen = 1;//redirect to homepage
      });
      // if onboarding is already seen (for users that have already bought the app),
      // check if the session variable is set
      // if no, then set it
      bool _temp=await prefs.getBool('isPremiumUser');
      print("temp="+_temp.toString());
      if(_temp!=false){ // null mhanje adhi kadhich set nahi zhalay
        print("premium is null");
        await prefs.setBool('isPremiumUser', true);
      }
      //return 1;
    }
    else {
      setState(() {
        _onBoardingSeen = 0;//redirect to onboarding
      });

      // check if user had bought premium before
      int _output = await initStoreInfo();
      if(_output==1){
        await prefs.setBool('isPremiumUser', true);
      }
      else{
        await prefs.setBool('isPremiumUser', false);
      }

      //return 0;
    }

    // check if logged in

    GlobalVariables.isPremiumUser=await prefs.getBool('isPremiumUser');
    print("global premium="+GlobalVariables.isPremiumUser.toString());
  }

  Future<int> initStoreInfo() async {
    final bool isAvailable = await _connection.isAvailable();
    int _output = -1;
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = [];
        _purchases = [];
        // _notFoundIds = [];
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      _output = -1;
      return -1;
    }
    print("erere");
    ProductDetailsResponse productDetailResponse = await _connection.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        // _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      _output = -1;
      return -1;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = [];
        // _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = [];
        _purchasePending = false;
        _loading = false;
      });
      _output = -1;
      return -1;
    }

    final QueryPurchaseDetailsResponse purchaseResponse = await _connection.queryPastPurchases();
    if (purchaseResponse.error != null) {
      // handle query past purchase error..
    }
    final List<PurchaseDetails> verifiedPurchases = [];
    for (PurchaseDetails purchase in purchaseResponse.pastPurchases) {
      if (await _verifyPurchase(purchase)) {
        verifiedPurchases.add(purchase);
      }
    }
    // print("verifiedPurchases="+verifiedPurchases[0].productID);
    List<String> consumables = await ConsumableStore.load();
    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _purchases = verifiedPurchases;
      // _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = consumables;
      _purchasePending = false;
      _loading = false;
    });

    Map<String, PurchaseDetails> purchases =
    Map.fromEntries(_purchases.map((PurchaseDetails purchase) {
      if (purchase.pendingCompletePurchase) {
        InAppPurchaseConnection.instance.completePurchase(purchase);
      }
      return MapEntry<String, PurchaseDetails>(purchase.productID, purchase);
    }));

    for(int i=0;i<_products.length;i++){
      ProductDetails productDetails = _products[i];
      PurchaseDetails previousPurchase = purchases[productDetails.id];
      if(previousPurchase!=null){
        print("premium");
        _output = 1; // premium user
      }
      else{
        print("not premium");
        _output = 0; // free user
      }
    }

    print("~~~~~~~~~~~~~~~~~~~` OUTPUT IS ~~~~~~~~~~~~~~~~~~~");
    print(_output);
    return _output;
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  @override
  void initState() {
    super.initState();

    SetupOptions options = (
        new SetupOptionsBuilder('18fa044eddad9f22dbaab640c99448c079d744c5')
    ).build();
    // Smartlook.setupAndStartRecording(options);

    new Timer(new Duration(milliseconds: 200), () {
      checkIntroSeen();
    });
  }

  @override
  void dispose() {
    // _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(_onBoardingSeen == -1) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Builder(
            builder: (context) => Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.red[300])))
            ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: (_onBoardingSeen==0) ? OnBoardingPage() : HomePage(),//(_isLoggedIn==false)?SignupPage()
      home: (_onBoardingSeen==0) ? NewOnboarding1Page() : BottomNavPage(),
    );
  }
}

