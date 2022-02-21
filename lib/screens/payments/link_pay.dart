// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tqdr/states/invoice_provider.dart';
import 'package:tqdr/styles/button.dart';
import 'package:tqdr/styles/text_field.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';

class LinkPayScreen extends StatelessWidget {
  LinkPayScreen({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _paymentKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var invoiceProvider = context.read<InvoiceProvider>();

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
            title: Text(
              ' الدفع عبر ${invoiceProvider.invoiceOrderLink.storeName} ',
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
                      keyboardType: TextInputType.number,
                      decoration: textInputDecoration.copyWith(
                        labelText: '${invoiceProvider.invoiceOrderLink.storeName}',
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 10.0),

                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: '${invoiceProvider.invoiceOrderLink.amount}',
                      ),
                      enabled: false,
                    ),
                    const SizedBox(height: 10.0),

                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        labelText: '${invoiceProvider.invoiceOrderLink.customerPhone}',
                      ),
                      enabled: false,
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
                              invoiceProvider.add(invoiceProvider.i);
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
                            onChanged: (val) => invoiceProvider
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
                                  invoiceProvider.invoiceOrderLink.amount,
                                  invoiceProvider.invoiceOrderLink.customerPhone,
                                  invoiceProvider.invoiceOrderLink.storeId,
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
