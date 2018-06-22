import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:invest/shared/utils/authentication.dart';

const String testDevice = 'YOUR_DEVICE_ID';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter FB Seed',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Firebase Seed'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    birthday: new DateTime.now(),
    childDirected: true,
    gender: MobileAdGender.male,
  );

  BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    _bannerAd = createBannerAd()..load();
    _bannerAd
      ..load()
      ..show();
  }

  BannerAd createBannerAd() {
    return new BannerAd(
      adUnitId: "ca-app-pub-4308663574155703/3839360241",
      size: AdSize.banner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("BannerAd event $event");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Flutter Firebase seed',
              ),
              StreamBuilder(
                stream: Firestore.instance.collection('settings').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return const Text('Loading..');
                  return Text(snapshot.data.documents[0]['version']);
                },
              ),
              MaterialButton(
                child: Text(
                  'Get started',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: _goToLoginScreen,
              ),
            ],
          ),
        ));
  }

  void _goToLoginScreen() async {
    //TODO: Navigate to Login screen
//    final firebaseUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
//        email: "kaushik11091@gmail.com", password: "google");
//    print("Firebase login test");
//    print(firebaseUser);
    print(await googleSignIn().toString());
  }
}
