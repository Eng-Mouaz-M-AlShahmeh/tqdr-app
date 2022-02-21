// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/models/store.dart';
import 'package:tqdr/states/app_provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/button.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/close_app_modal.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _paymentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var invoiceProvider = context.read<InvoiceProvider>();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final TextEditingController _amountController =
        TextEditingController(text: invoiceProvider.amount);
    _amountController.value = _amountController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: invoiceProvider.amount.length),
      ),
    );

    final TextEditingController _phoneController =
        TextEditingController(text: invoiceProvider.phone);
    _phoneController.value = _phoneController.value.copyWith(
      selection: TextSelection.fromPosition(
        TextPosition(offset: invoiceProvider.phone.length),
      ),
    );

    return WillPopScope(
      onWillPop: () => onCloseApp(context),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: _scaffoldKey,
          endDrawer: SizedBox(
            width: width * 0.8,
            height: height,
            child: const MainDrawer(),
          ),
          appBar: AppBar(
            backgroundColor: appTheme.primaryColor,
            title: Text(
              '',
              style: appTheme.textTheme.headline4,
            ),
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
          body: Container(
            color: const Color(0xffeaeaea),
            child: Form(
              key: _paymentKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: width,
                      height: height*0.85,
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                          color: Color(0xfff0ad4e),
                          width: 3.0,
                        )),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/hero.jpg'),
                          fit: BoxFit.cover,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: height*0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'تسوق أونلاين بسهولة وأمان',
                                  style: pluss,
                                ),
                              ],
                            ),
                            SizedBox(height: height*0.05),
                            Consumer<InvoiceProvider>(
                                builder: (context, amount, child) {
                              return SizedBox(
                                height: height*0.08,
                                child: TextFormField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                                  decoration: textInputDecoration.copyWith(
                                    labelText: 'المبلغ',
                                  ),
                                  onChanged: (val) {
                                    invoiceProvider.setAmount(val);
                                  },
                                  validator: (String? val) {
                                    if (val!.isEmpty) {
                                      return 'هذا الحقل مطلوب!';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              );
                            }),
                            SizedBox(height: height*0.02),
                            Container(
                              height: height*0.08,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Consumer<InvoiceProvider>(
                                      builder: (context, store, child) {
                                    return Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              'اختر المتجر',
                                              style: appTheme.textTheme.headline5,
                                              textAlign: TextAlign.center,
                                            ),
                                            value: store.selectedStoreName,
                                            onChanged: (String? newValue) {
                                              if (newValue == '0') {
                                                store.setSelectedStoreName(
                                                    newValue!);
                                                invoiceProvider.setStore(
                                                    '${store.selectedStoreName}');
                                              } else {
                                                store.setSelectedStoreName(
                                                    newValue!);
                                                invoiceProvider.setStore(
                                                    '${store.selectedStoreName}');
                                              }
                                            },
                                            items: <DropdownMenuItem<String>>[
                                              DropdownMenuItem<String>(
                                                value: '',
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      'اختر متجر',
                                                      style: appTheme
                                                          .textTheme.headline5,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              )

                                            ] + store.stores
                                                .map((StoreModel map) {
                                              return DropdownMenuItem<String>(
                                                value: map.id.toString(),
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      map.storeName.toString(),
                                                      style: appTheme
                                                          .textTheme.headline5,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                            SizedBox(height: height*0.02),
                            SizedBox(
                              height: height*0.08,
                              child: TextFormField(
                                controller: _phoneController,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [FilteringTextInputFormatter(RegExp("[0-9]"), allow: true)],
                                decoration: textInputDecoration.copyWith(
                                  labelText: 'رقم الجوال',
                                  hintText: '05xxxxxxxx',
                                ),
                                onChanged: (val) {
                                  invoiceProvider.setPhone(val);
                                },
                                validator: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'هذا الحقل مطلوب!';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: height*0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Tooltip(
                                  message: 'للدفع بأكثر من رقم طلب',
                                  textStyle: appTheme.textTheme.headline4,
                                  child: OutlinedButton(
                                    onPressed: () async {
                                      invoiceProvider.add(invoiceProvider.i);
                                    },
                                    style: buttonSubmit.copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                          const Color(0xff5486e7)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                        height: height*0.07,
                                        child: Center(
                                          child: Text(
                                            '+',
                                            style: plus,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: SizedBox(
                                    height: height*0.08,
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
                                      onChanged: (val) =>
                                          invoiceProvider.setOrderNumber('0', val),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height*0.02),
                            Consumer<InvoiceProvider>(
                                builder: (context, inputs, child) {
                              return (inputs.inputs == []) ||
                                      (inputs.inputs.isEmpty)
                                  ? Container()
                                  : SizedBox(
                                      height: MediaQuery.of(context).size.height*0.15,
                                      child: ListView.builder(
                                        itemCount: inputs.inputs.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                OutlinedButton(
                                                  onPressed: () async {
                                                    inputs.remove(
                                                        inputs.inputs[index]);
                                                  },
                                                  style: buttonSubmit.copyWith(
                                                    backgroundColor:
                                                        MaterialStateProperty.all(
                                                            const Color(
                                                                0xff862a2a)),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5.0),
                                                    child: SizedBox(
                                                      height: height*0.07,
                                                      child: Center(
                                                        child: Text(
                                                          '-',
                                                          style: plus,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10.0),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: height*0.08,
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
                                            pay.store,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.84,
                      decoration:  const BoxDecoration(
                        border: Border(
                    bottom: BorderSide(
                    color: Color(0xfff0ad4e),
              width: 3.0,
            )),),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'كيف نعمل',
                                style: appTheme.textTheme.headline2,
                              ),
                            ],
                          ),
                          Container(
                            width: width*0.3,
                            height: height*0.15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    ExactAssetImage('assets/images/paycashb.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ادفع عند أقرب مزود خدمة وخذ إيصال',
                                style: appTheme.textTheme.headline3,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '(سعر الخدمة 5 ريال تخصم مباشرة من المبلغ)',
                                style: infoSubTitle,
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.01),
                          Container(
                            width: width*0.3,
                            height: height*0.15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/formb.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'قم بتعبئة البيانات ',
                                style: appTheme.textTheme.headline3,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '(رقم الطلب - المبلغ - المتجر - رقم الجوال)',
                                style: infoSubTitle,
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.009),
                          Container(
                            width: width*0.3,
                            height: height*0.15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage('assets/images/smsb.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'استلم رسالة تنفيذ طلبك',
                                style: appTheme.textTheme.headline3,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.01),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'مزودو الخدمة',
                              style: appTheme.textTheme.headline2,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 5),
                                  child: Container(
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
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      itemCount: sp.sps.length,
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
                                              style: appTheme.textTheme.headline5,
                                            ),
                                            title: Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    '${sp.sps[index].storeName}',
                                                    style: appTheme
                                                        .textTheme.headline5,
                                                  ),
                                                ),
                                                const SizedBox(width: 50),
                                                Expanded(
                                                  child: Text(
                                                    '${sp.sps[index].nighborhood}',
                                                    style: appTheme
                                                        .textTheme.headline5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            trailing: TextButton.icon(
                                              onPressed: () {
                                                _launchLocation(
                                                    '${sp.sps[index].locationURL}');
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
                                ),
                              ],
                            );
                    }),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'شركاؤنا',
                          style: appTheme.textTheme.headline2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Consumer<InvoiceProvider>(builder: (context, store, child) {
                      return store.loading == 1
                          ? const Center(
                              child: SizedBox(
                              width: 15,
                              height: 15,
                              child: CircularProgressIndicator(
                                color: Color(0xff0e307e),
                              ),
                            ))
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: store.stores.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            store.setSelectedStore(
                                                store.stores[index]);
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
                                                    width: width * 0.30,
                                                    height: height * 0.15,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                200.0),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${store.stores[index].logo}'),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '${store.stores[index].storeName}',
                                                  style: appTheme
                                                      .textTheme.headline3,
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
                                  ),
                                ),
                              ],
                            );
                    }),
                    const SizedBox(height: 20.0),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 10,
                      color: const Color(0xfff0ad4e),
                    ),
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

void _launchLocation(String? url) async {
  if (await canLaunch(url!)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
