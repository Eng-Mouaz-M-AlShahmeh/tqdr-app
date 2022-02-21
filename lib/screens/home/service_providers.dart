// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/app_provider.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';
import 'package:url_launcher/url_launcher.dart';

class SPsScreen extends StatelessWidget {
  SPsScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
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
          //backgroundColor: appTheme.primaryColor,
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, width*0.1, 0),
            child: Text(
              'مزودو الخدمة',
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
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xffececec),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' نتائج بحثك عن   ${appProvider.spsKeySearch}',
                        style: searchResText,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Consumer<AppProvider>(builder: (context, sp, child) {
                    return sp.loading == 1
                        ? const Center(
                            child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                              color: Color(0xff0e307e),
                            ),
                          ))
                        : Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xff0e307e),
                                  ),
                                  child: ListTile(
                                    leading: Text(
                                      '#',
                                      style: appTheme.textTheme.headline4,
                                    ),
                                    title: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'الاسم',
                                            style: appTheme.textTheme.headline4,
                                          ),
                                        ),
                                        const SizedBox(width: 50),
                                        Expanded(
                                          child: Text(
                                            'الحي',
                                            style: appTheme.textTheme.headline4,
                                          ),
                                        ),
                                      ],
                                    ),
                                    trailing: Text(
                                      'الخريطة',
                                      style: appTheme.textTheme.headline4,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: ListView.builder(
                                    itemCount: sp.spsSearch.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: (index % 2 != 0)
                                              ? const Color(0xffececec)
                                              : const Color(0xffd4d4d4),
                                        ),
                                        child: ListTile(
                                          leading: Text(
                                            '${index + 1}',
                                            style: appTheme.textTheme.headline3,
                                          ),
                                          title: Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  '${sp.spsSearch[index].storeName}',
                                                  style: appTheme
                                                      .textTheme.headline3,
                                                ),
                                              ),
                                              const SizedBox(width: 50),
                                              Expanded(
                                                child: Text(
                                                  '${sp.spsSearch[index].nighborhood}',
                                                  style: appTheme
                                                      .textTheme.headline3,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: TextButton.icon(
                                            onPressed: () {
                                              _launchLocation(
                                                  '${sp.spsSearch[index].locationURL}');
                                            },
                                            icon: const Icon(
                                              Icons.location_on,
                                              color: Color(0xff0e307e),
                                            ),
                                            label: const Text(''),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _launchLocation(String? url) async {
  if (await canLaunch(url!)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
