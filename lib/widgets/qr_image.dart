// Developed by: Eng Mouaz M. Al-Shahmeh
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// //import 'package:tqdr_app/states/invoice_provider.dart';
//
// Future<File> qrImage(BuildContext context, String text) async {
//   final qrValidationResult = QrValidator.validate(
//     data: text,
//     version: QrVersions.auto,
//     errorCorrectionLevel: QrErrorCorrectLevel.L,
//   );
//   final QrCode qrCode = qrValidationResult.qrCode!;
//   final painter = QrPainter.withQr(
//     qr: qrCode,
//     color: const Color(0xFF000000),
//     gapless: true,
//     embeddedImageStyle: null,
//     embeddedImage: null,
//   );
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   final ts = DateTime.now().millisecondsSinceEpoch.toString();
//   String path = '$tempPath/$ts.png';
//   Future<void> writeToFile(ByteData data, String path) async {
//     final buffer = data.buffer;
//     await File(path).writeAsBytes(
//         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//   }
//   final picData = await painter.toImageData(480, format: ImageByteFormat.png);
//   await writeToFile(picData!, path);
//   return File(path);
// }
// Future<File> qrImageZaqat(BuildContext context) async {
//   //var invoiceProvider = context.read<InvoiceProvider>();
//   BytesBuilder bytesBuilder = BytesBuilder();
//   // 1. Seller Name
//   bytesBuilder.addByte(1);
//   List<int> sellerNameBytes = utf8.encode('مؤسسة تقدر');
//   bytesBuilder.addByte(sellerNameBytes.length);
//   bytesBuilder.add(sellerNameBytes);
//   // 2. VAT Registration
//   bytesBuilder.addByte(2);
//   List<int> vatRegistrationBytes = utf8.encode('000000000000000');
//   bytesBuilder.addByte(vatRegistrationBytes.length);
//   bytesBuilder.add(vatRegistrationBytes);
//   // 3. TimeStamp
//   bytesBuilder.addByte(3);
//   List<int> timeStampBytes = utf8.encode('${DateTime.now()}');
//   bytesBuilder.addByte(timeStampBytes.length);
//   bytesBuilder.add(timeStampBytes);
//   // 4. Invoice total (with VAT)
//   bytesBuilder.addByte(4);
//   //List<int> totalWithVATBytes = utf8.encode(invoiceProvider.amountInvoiceNew!);
//   // bytesBuilder.addByte(totalWithVATBytes.length);
//   // bytesBuilder.add(totalWithVATBytes);
//
//   // 5. VAT total
//   bytesBuilder.addByte(5);
//   List<int> vatBytes = utf8.encode('0.00'); /// TODO:: double.tryParse(invoiceProvider.amountInvoiceNew!)*0.15
//   bytesBuilder.addByte(vatBytes.length);
//   bytesBuilder.add(vatBytes);
//
//   Uint8List qrCodeAsBytes = bytesBuilder.toBytes();
//   Base64Encoder base64encoder = const Base64Encoder();
//   String text = base64encoder.convert(qrCodeAsBytes);
//
//   final qrValidationResult = QrValidator.validate(
//     data: text,
//     version: QrVersions.auto,
//     errorCorrectionLevel: QrErrorCorrectLevel.L,
//   );
//   final QrCode qrCode = qrValidationResult.qrCode!;
//   final painter = QrPainter.withQr(
//     qr: qrCode,
//     color: const Color(0xFF000000),
//     gapless: true,
//     embeddedImageStyle: null,
//     embeddedImage: null,
//   );
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   final ts = DateTime.now().millisecondsSinceEpoch.toString();
//   String path = '$tempPath/$ts.png';
//   Future<void> writeToFile(ByteData data, String path) async {
//     final buffer = data.buffer;
//     await File(path).writeAsBytes(
//         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//   }
//   final picData = await painter.toImageData(480, format: ImageByteFormat.png);
//   await writeToFile(picData!, path);
//   return File(path);
// }
//
// Future<File> qrImageZaqatSelected(BuildContext context) async {
//
//  // var invoiceProvider = context.read<InvoiceProvider>();
//
//   BytesBuilder bytesBuilder = BytesBuilder();
//   // 1. Seller Name
//   bytesBuilder.addByte(1);
//   List<int> sellerNameBytes = utf8.encode('مؤسسة تقدر');
//   bytesBuilder.addByte(sellerNameBytes.length);
//   bytesBuilder.add(sellerNameBytes);
//
//   // 2. VAT Registration
//   bytesBuilder.addByte(2);
//   List<int> vatRegistrationBytes = utf8.encode('000000000000000');
//   bytesBuilder.addByte(vatRegistrationBytes.length);
//   bytesBuilder.add(vatRegistrationBytes);
//
//   // 3. TimeStamp
//   bytesBuilder.addByte(3);
//   List<int> timeStampBytes = utf8.encode('${DateTime.now()}');
//   bytesBuilder.addByte(timeStampBytes.length);
//   bytesBuilder.add(timeStampBytes);
//
//   // 4. Invoice total (with VAT)
//   bytesBuilder.addByte(4);
//   // List<int> totalWithVATBytes = utf8.encode(invoiceProvider.selectedInvoice!.amount!);
//   // bytesBuilder.addByte(totalWithVATBytes.length);
//   // bytesBuilder.add(totalWithVATBytes);
//
//   // 5. VAT total
//   bytesBuilder.addByte(5);
//   List<int> vatBytes = utf8.encode('0.00'); /// TODO:: double.tryParse(invoiceProvider.amountInvoiceNew!)*0.15
//   bytesBuilder.addByte(vatBytes.length);
//   bytesBuilder.add(vatBytes);
//
//   Uint8List qrCodeAsBytes = bytesBuilder.toBytes();
//   Base64Encoder base64encoder = const Base64Encoder();
//   String text = base64encoder.convert(qrCodeAsBytes);
//
//   final qrValidationResult = QrValidator.validate(
//     data: text,
//     version: QrVersions.auto,
//     errorCorrectionLevel: QrErrorCorrectLevel.L,
//   );
//   final QrCode qrCode = qrValidationResult.qrCode!;
//   final painter = QrPainter.withQr(
//     qr: qrCode,
//     color: const Color(0xFF000000),
//     gapless: true,
//     embeddedImageStyle: null,
//     embeddedImage: null,
//   );
//   Directory tempDir = await getTemporaryDirectory();
//   String tempPath = tempDir.path;
//   final ts = DateTime.now().millisecondsSinceEpoch.toString();
//   String path = '$tempPath/$ts.png';
//   Future<void> writeToFile(ByteData data, String path) async {
//     final buffer = data.buffer;
//     await File(path).writeAsBytes(
//         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//   }
//   final picData = await painter.toImageData(480, format: ImageByteFormat.png);
//   await writeToFile(picData!, path);
//   return File(path);
// }