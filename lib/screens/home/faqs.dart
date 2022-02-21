// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/styles/theme.dart';
import 'package:tqdr/widgets/drawer.dart';
import 'package:tqdr/widgets/return_home.dart';

class FaqsScreen extends StatelessWidget {
  FaqsScreen({Key? key}) : super(key: key);
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
          //backgroundColor: appTheme.primaryColor,
          title: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, width*0.05, 0),
            child: Text(
              'الأسئلة الشائعة',
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
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: const Color(0xffececec),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      '''-انا تاجر وأريد أن أضيف خدمة اقدر عندي في الموقع الالكتروني والتطبيق ؟

نرجوا التواصل معنا واتساب على الرقم 0566293256 أو مراسلتنا على الايميل info@tqdr.com.sa 

-سعر الخدمة كم؟

سعر الخدمة ٥ ريال تدفع مرة واحدة فقط.

-هل أستطيع الدفع بإيصال واحد عند أكثر من متجر ؟

نعم تستطيع طالما توفر رصيد وكان المتجر أحد شركاء تقدر .

-هل أستطيع الدفع بأكثر من إيصال في عميلة الدفع الواحدة ؟ 

نعم في حالة رصيدك لايكفي للدفع بإيصال واحد فنعم تستطيع الدفع بأكثر من إيصال .

-هل الدفع يتم عن طريق موقع وتطبيق تقدر فقط ؟

لا تستطيع الدفع عند موقع وتطبيق التاجر الشريك كما تستطيع الدفع عبر موقع وتطبيق تقدر .

***************************************************************************************************

- I am a merchant and I want to add a service that I can appreciate in the website and application?

Please contact us on WhatsApp at 0566293256 or email us at info@tqdr.com.sa

- How much is the service price?

The price of the service is 5 riyals, to be paid only once.

- Can I pay with one receipt at more than one store?

Yes, you can, as long as you have enough credit and the store is one of the partners.

- Can I pay more than one receipt in one payment transaction?

Yes, if your balance is not enough to pay with one receipt, then yes, you can pay with more 
than one receipt.

- Is the payment made through a website and application only?

You cannot pay at the partner merchant’s website and application, as you can pay through 
TQDR website and application.
                      ''',
                      style: appTheme.textTheme.headline3,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
