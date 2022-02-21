// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => returnHome(context),
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height,
          child: const MainDrawer(),
        ),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xfff0ad4e),
                  width: 3.0,
                ),
              ),
              color: Color(0xff0e307e),
            ),
          ),
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, width*0.1, 0),
            child: Text(
              'من نحن',
              style: appTheme.textTheme.headline4,
            ),
          ),
          leading: InkWell(
            onTap: () => returnHome(context),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: width * 0.3,
                height: height * 0.1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/logo-w.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          leadingWidth: width * 0.3,
          actions: [
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: InkWell(
                onTap: () => _scaffoldKey.currentState!.openEndDrawer(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/menu.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: InkWell(
                  onTap: () {
                    _launchWebURLTQDR();
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/logo.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffececec),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '''تقدر هي أول منصة رقمية سعودية تعود ملكيتها لمؤسسة تقدر للوساطة التجارية متخصصة في توفير خدمة الدفع الكاش لجميع مشترياتك  الرقمية عن طريق ربط الزبائن بالمتاجر والتطبيقات عبر شبكة مزودو خدمة تقدر المنتشرين في الرياض حالياً وجميع مناطق المملكة العربية  السعودية قريباً.

    رسالتنا ربط الناس بالمتاجر والتطبيقات من خلال تقديم حلول دفع مبدعة ذكية سهلة وآمنة بكل احترافية وحب.

    رؤيتنا أن نكون خيار الدفع كاش الأول للمدفوعات الرقمية في المملكة العربية السعودية.

    The first Saudi platform owned by TQDR commercial brokerage specialized inn providing cash payments services for all your online purchases through linked the customer with stores and apps via service providers network. We are
    located in Riyadh currently and soon we will be in all other regions of the kingdom of Saudi Arabia.

    Our mission is to link people with stores and apps through providing creative, smart, easy and secure payment solutions professionally and friendly.

    Our vision is to be the first cash payment option for online payments in Saudi Arabia. ''',
                      style: appTheme.textTheme.headline3,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xff0e307e),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURLFacebook();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/facebookw.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURLTwitter();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/twitterw.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURLInstagram();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/instagramw.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _launchWhatsApp();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/whatsappw.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          launch(_emailLaunchUri.toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    ExactAssetImage('assets/images/emailw.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffececec),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/home/join',
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/join.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'انضم إلينا ',
                              style: categoryText,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/home/privacy',
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/privacy.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'سياسة الخصوصية ',
                              style: categoryText,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),



              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffececec),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/home/terms',
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/terms.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'شروط الخدمة ',
                              style: categoryText,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        width: 10,
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/home/faqs',
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(
                                        'assets/images/faqs.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'الأسئلة الشائعة ',
                              style: categoryText,
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () => _launchWebURLTQDR(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'جميع الحقوق محفوظة \u00a9 ${DateTime.now().year} - تقدر للوساطة التجارية ',
                        style: categoryText,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15.0),

              InkWell(
                onTap: () {
                  _launchWebURL();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'المطور ',
                      style: categoryText,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image:
                            ExactAssetImage('assets/images/developer.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15.0),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 10,
                color: const Color(0xfff0ad4e),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _launchWebURLTQDR() async {
  const url = 'https://tqdr.com.sa/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchWebURL() async {
  const url = 'https://alraedaah.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURLFacebook() async {
  const url = 'https://www.facebook.com/tqdrpaysa.tqdr';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURLTwitter() async {
  const url = 'https://twitter.com/tqdrpaysa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURLInstagram() async {
  const url = 'https://instagram.com/tqdrpaysa';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchWhatsApp() async {
  var link = const WhatsAppUnilink(
    phoneNumber: '+966566293256',
    text: 'تطبيق تقدر - الدعم الفني',
  );
  await launch('$link');
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'info@tqdr.com.sa',
    queryParameters: {'subject': 'تطبيق تقدر'});
