// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/button.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';

class LinkScreen extends StatelessWidget {
  LinkScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _paymentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var invoiceProvider = context.read<InvoiceProvider>();

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
          title: Text(
            'الدفع عبر الرابط',
            style: appTheme.textTheme.headline4,
          ),
          leading: InkWell(
            onTap: () => returnHome(context),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('assets/images/logo-w.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
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
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _paymentKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                      keyboardType: TextInputType.url,
                      decoration: textInputDecoration.copyWith(
                        labelText: 'الرابط',
                        suffixIcon: Icon(
                          Icons.link,
                          color: appTheme.primaryColor,
                        ),
                      ),
                      onChanged: (val) {
                        invoiceProvider.setLink(val);
                      },
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'هذا الحقل مطلوب!';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(height: 10.0),
                  Consumer<InvoiceProvider>(builder: (context, linkPay, child) {
                    return linkPay.loading == 1
                        ? OutlinedButton(
                            onPressed: () async {},
                            style: buttonSubmit.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: const Center(
                                child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                color: Color(0xffffffff),
                              ),
                            )))
                        : OutlinedButton(
                            onPressed: () async {
                              if (!_paymentKey.currentState!.validate()) {
                                return;
                              } else {
                                linkPay.getInvoiceOrderLink(
                                    context, linkPay.link);
                              }
                            },
                            style: buttonSubmit.copyWith(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'التالي',
                                  style: appTheme.textTheme.headline4,
                                ),
                              ),
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
