// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/button.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class PartnerPayScreen extends StatelessWidget {
  PartnerPayScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _paymentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var partner = context.read<InvoiceProvider>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final TextEditingController _amountController =
    TextEditingController(text: partner.amount);
    _amountController.value = _amountController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: partner.amount.length),
      ),
    );

    final TextEditingController _phoneController =
    TextEditingController(text: partner.phone);
    _phoneController.value = _phoneController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: partner.phone.length),
      ),
    );

    return WillPopScope(
      onWillPop: () => returnHome(context),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
              padding: EdgeInsets.fromLTRB(0, 0, width*0.02, 0),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      ' ${partner.selectedStore.storeName} ',
                      style: appTheme.textTheme.headline4,
                    ),
                  ),
                ],
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
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _paymentKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: const Color(0xffececec),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Padding(
                                padding:
                                const EdgeInsets.all(15.0),
                                child: SizedBox(
                                  width: width * 0.5,
                                  height: height * 0.25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(
                                          100.0),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${partner.selectedStore.logo}'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              InkWell(
                                onTap: () => _launchWebURL('${partner.selectedStore.webUrl}'),
                                child: Text(
                                  partner.selectedStore.storeName != null?'${partner.selectedStore.storeName}':'',
                                  style: vatFinalText,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(height: 10),

                              Text(
                                partner.selectedStore.description != null?'${partner.selectedStore.description}':'',
                                style: appTheme.textTheme.headline5,
                                textAlign: TextAlign.justify,
                              ),
                              const SizedBox(height: 10),

                              InkWell(
                                onTap: () => _launchWhatsApp('${partner.selectedStore.phone}'),
                                child: Text(
                                  partner.selectedStore.phone != null?'${partner.selectedStore.phone}':'',
                                  style: addNewText,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(height: 10),

                              InkWell(
                                onTap: () => _launchEmail('${partner.selectedStore.email}'),
                                child: Text(
                                  partner.selectedStore.email != null?'${partner.selectedStore.email}':'',
                                  style: appTheme.textTheme.headline3,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [

                                  Padding(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () => _launchWebURL(partner.selectedStore.linkedin),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage('assets/images/linkedinb.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () => _launchWebURL(partner.selectedStore.youtube),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage('assets/images/youtubeb.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () => _launchWebURL(partner.selectedStore.facebook),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage('assets/images/facebookb.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                  Padding(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () => _launchWebURL(partner.selectedStore.twitter),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage('assets/images/twitterb.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),



                                  Padding(
                                    padding:
                                    const EdgeInsets.all(2.0),
                                    child: InkWell(
                                      onTap: () => _launchWebURL(partner.selectedStore.instagram),
                                      child: SizedBox(
                                        width: 30,
                                        height: 30,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: ExactAssetImage('assets/images/instagramb.png'),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),

                              const SizedBox(height: 10),


                            ],
                          ),
                        ),
                      ),
                    ),


                    const SizedBox(height: 10.0),

                    Consumer<InvoiceProvider>(
                        builder: (context, amount, child) {
                          return
                            TextFormField(
                              controller: _amountController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                              decoration: textInputDecoration.copyWith(
                                labelText: 'المبلغ',
                              ),
                              onChanged: (val) {
                                partner.setAmount(val);
                              },
                              validator: (String? val) {
                                if (val!.isEmpty) {
                                  return 'هذا الحقل مطلوب!';
                                } else {
                                  return null;
                                }
                              },
                            );
                        }),
                    const SizedBox(height: 10.0),

                    TextFormField (
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                      decoration: textInputDecoration.copyWith(
                        labelText: 'رقم الجوال',
                      ),
                      onChanged: (val) {
                        partner.setPhone(val);
                      },
                      validator: (String? val) {
                        if (val!.isEmpty) {
                          return 'هذا الحقل مطلوب!';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Tooltip(
                          message: 'للدفع بأكثر من رقم طلب',
                          textStyle: appTheme.textTheme.headline4,
                          child: OutlinedButton(
                            onPressed: () async {
                              partner.add(partner.i);
                            },
                            style: buttonSubmit.copyWith(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  const Color(0xff5486e7)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Center(
                                child: Text(
                                  '+',
                                  style: plus,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                            decoration: textInputDecoration.copyWith(
                              labelText: 'رقم الطلب',
                            ),
                            validator: (String? val) {
                              if (val!.isEmpty) {
                                return 'هذا الحقل مطلوب!';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (val) => partner
                                .setOrderNumber('0', val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Consumer<InvoiceProvider>(
                        builder: (context, inputs, child) {
                          return (inputs.inputs == []) || (inputs.inputs.isEmpty)
                              ? Container()
                              : SizedBox(
                            height: 100,
                            child: ListView.builder(
                              itemCount: inputs.inputs.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0, 0, 0, 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () async {
                                          inputs.remove(
                                              inputs.inputs[index]);
                                        },
                                        style: buttonSubmit.copyWith(
                                          backgroundColor:
                                          MaterialStateProperty
                                              .all(const Color(
                                              0xff862a2a)),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(
                                              5.0),
                                          child: Center(
                                            child: Text(
                                              '-',
                                              style: plus,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Expanded(
                                        child: TextFormField(
                                          keyboardType:
                                          TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                                          decoration:
                                          textInputDecoration
                                              .copyWith(
                                            labelText: 'رقم الطلب',
                                          ),
                                          // validator: (val) {},
                                          onChanged: (val) {
                                            inputs.setOrderNumber(
                                                '${inputs.inputs[index]}',
                                                val);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                    Consumer<InvoiceProvider>(
                        builder: (context, pay, child) {
                          return pay.loading == 1
                              ? OutlinedButton(
                              onPressed: () async {},
                              style: buttonSubmit.copyWith(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    const Color(0xfff0ad4e)),
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
                              if (!_paymentKey.currentState!
                                  .validate()) {
                                return;
                              } else {
                                pay.invoiceOrderPay(
                                  context,
                                  pay.amount,
                                  pay.phone,
                                  partner.selectedStore.id.toString(),
                                  pay.orderNumber,
                                );
                              }
                            },
                            style: buttonSubmit.copyWith(
                              backgroundColor:
                              MaterialStateProperty.all(
                                  const Color(0xfff0ad4e)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'إرسال',
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
      ),
    );
  }
}

void _launchWhatsApp(String? phone) async {
  var link = WhatsAppUnilink(
    phoneNumber: '+$phone',
    text: 'تطبيق تقدر',
  );
  await launch('$link');
}

void _launchEmail(String? email) async {
  Uri(
      scheme: 'mailto',
      path: '$email',
      queryParameters: {'subject': 'تطبيق تقدر'}
  );
}

void _launchWebURL(String? urlWeb) async {
  var url = '$urlWeb';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
