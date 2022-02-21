// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/app_provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/home_buttons_list.dart';
import 'package:tqdr/widgets/return_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    var invProvider = context.read<InvoiceProvider>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
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
        //backgroundColor: const Color(0xff0e307e),
        title: const Text(''),
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            onTap: () => returnHome(context),
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
          InkWell(
            onTap: () {
              _launchWhatsApp();
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/whatsappw.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xffe8e8e8),
          border: Border(
              bottom: BorderSide(
                color: Color(0xfff0ad4e),
                width: 3.0,
              )),
          // image: DecorationImage(
          //   image: ExactAssetImage('assets/images/hero.jpg'),
          //   fit: BoxFit.cover,
          //   alignment: Alignment.topLeft,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: textInputDecoration.copyWith(
                    labelText: 'ابحث في أقرب مزود خدمة',
                    suffixIcon: const Icon(Icons.search),
                  ),
                  validator: (String? val) {
                    if (val!.isEmpty) {
                      return 'هذا الحقل مطلوب!';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    appProvider.setSPsKeySearch(val);
                  },
                  onFieldSubmitted: (val) {
                    appProvider.getSPsSearchList(
                        context, appProvider.spsKeySearch);
                  },
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: ListView.builder(
                  itemCount: homeButtonsListDrawer.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15.0,0,15.0,5),
                      // child: Container(
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20.0),
                        //   color: const Color(0xff170f6a),
                        // ),
                        child: ListTile(
                          onTap: () {
                            if( homeButtonsListDrawer[index]['screenRoute'] =='/home/servProvs' ) {
                              appProvider.setSPsKeySearch('');
                              appProvider.getSPsSearchList(context, '');
                            } else if( homeButtonsListDrawer[index]['screenRoute'] =='/home/stores' ) {
                              invProvider.setStoresKeySearch('');
                              invProvider.getStoresSearchList(context, '');
                            }
                            Navigator.pushReplacementNamed(
                              context,
                              '${homeButtonsListDrawer[index]['screenRoute']}',
                            );
                          },
                          title: Text(
                            '${homeButtonsListDrawer[index]["buttonTitle"]}',
                            style: noDeleteButtonText,
                          ),
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage(
                                    'assets/images/${homeButtonsListDrawer[index]['iconName']}'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      // ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'v 1.0.0',
                    style: tableHeaderSub,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 40,
        //color: const Color(0xff0e307e),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xfff0ad4e),
              width: 3.0,
            ),
          ),
          color: Color(0xff0e307e),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _launchURLFacebook();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/facebookw.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURLTwitter();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/twitterw.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _launchURLInstagram();
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image:
                              ExactAssetImage('assets/images/instagramw.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
