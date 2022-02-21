// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/styles/theme.dart';

Future<bool> inquiryInfo(BuildContext context, String? remainingAmount, String? invoiceId) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'الاستعلام عن الرصيد',
        style: unitText,
        textAlign: TextAlign.right,
      ),
      content: Text(
        ' المبلغ المتبقي في الإيصال رقم $invoiceId هو $remainingAmount ريال. ',
        style: imageButtonText,
        textAlign: TextAlign.right,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'حسناً',
                    style: categoryText,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ) ??
      false;
}
