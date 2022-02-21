// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';

class StoresScreen extends StatelessWidget {
  StoresScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var invProvider = context.read<InvoiceProvider>();
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
            padding: EdgeInsets.fromLTRB(0, 0, width * 0.1, 0),
            child: Text(
              'شركاؤنا',
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
                          labelText: 'ابحث عن شريك',
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
                          invProvider.setStoresKeySearch(val);
                        },
                        onFieldSubmitted: (val) {
                          invProvider.getStoresSearchList(
                              context, invProvider.storesKeySearch);
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' نتائج بحثك عن ${invProvider.storesKeySearch}',
                        style: searchResText,
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.62,
                    child: Consumer<InvoiceProvider>(
                      builder: (context, store, child) {
                        return store.loading == 1
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
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount:
                                              (MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.portrait)
                                                  ? 2
                                                  : 3),
                                  itemCount: store.storesSearch.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        store.setSelectedStore(
                                            store.storesSearch[index]);
                                        Navigator.pushReplacementNamed(
                                          context,
                                          '/payments/partner',
                                        );
                                      },
                                      child: Card(
                                        color: const Color(0xfff5f5f5),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: SizedBox(
                                                width: width * 0.25,
                                                height: height * 0.12,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    image: DecorationImage(
                                                      image: store.storesSearch[
                                                                      index]
                                                                  .logo ==
                                                              null
                                                          ? const ExactAssetImage(
                                                              'assets/images/store_img.png')
                                                          : NetworkImage(
                                                                  '${store.storesSearch[index].logo}')
                                                              as ImageProvider,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              store.storesSearch[index]
                                                  .storeName!,
                                              style:
                                                  appTheme.textTheme.headline3,
                                            ),
                                            const SizedBox(height: 5),
                                            // Text(
                                            //   '${store.stores[index].description}',
                                            //   style: appTheme.textTheme.headline5,
                                            // ),
                                            // const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
