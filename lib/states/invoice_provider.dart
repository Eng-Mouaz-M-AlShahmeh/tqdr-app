// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tqdr/models/invoice.dart';
import 'package:tqdr/models/invoice_order_link.dart';
import 'package:tqdr/models/store.dart';
import 'package:tqdr/utils/api.dart';
import 'package:tqdr/widgets/inquiry_info_modal.dart';

class InvoiceProvider extends ChangeNotifier {

  int _loading = 0;
  int get loading => _loading;
  setLoadingState(int val) {
    _loading = val;
    notifyListeners();
  }

  String? _invoiceOrderId;
  String? get invoiceOrderId => _invoiceOrderId;
  setInvoiceOrderId(String? val) {
    _invoiceOrderId = val;
    notifyListeners();
  }

  InvoiceModel _inquiryInvoice = InvoiceModel();
  InvoiceModel get inquiryInvoice => _inquiryInvoice;
  getInquiryInvoice(BuildContext context, String? id) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().invoiceInquiry(context, id).then((value) {
        if(value != null) {
          setLoadingState(0);
          _inquiryInvoice = InvoiceModel.fromJson(value);
          inquiryInfo(context,_inquiryInvoice.remainingAmount,_inquiryInvoice.id.toString());
          notifyListeners();
          return;
        } else {
          setLoadingState(0);
          return;
        }
      });
    });
  }

  String? _link;
  String? get link => _link;
  setLink(String? val) {
    _link = val;
    notifyListeners();
  }

  InvoiceOrderLinkModel _invoiceOrderLink = InvoiceOrderLinkModel();
  InvoiceOrderLinkModel get invoiceOrderLink => _invoiceOrderLink;
  getInvoiceOrderLink(BuildContext context, String? link) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().invoiceLink(context, link).then((value) {
        if(value != null) {
          setLoadingState(0);
          _invoiceOrderLink = InvoiceOrderLinkModel.fromJson(value);
          notifyListeners();
          Navigator.pushReplacementNamed (
            context,
            '/payments/link/pay',
          );
          return;
        } else {
          setLoadingState(0);
          return;
        }
      });
    });
  }

  String _amount = '';
  String get amount => _amount;
  setAmount(String val) {
    _amount = val;
    notifyListeners();
  }

  String _phone = '';
  String get phone => _phone;
  setPhone(String val) {
    _phone = val;
    notifyListeners();
  }

  String _store = '';
  String get store => _store;
  setStore(String val) {
    _store = val;
    notifyListeners();
  }

  Map<String, dynamic> _orderNumber = {};
  Map<String, dynamic> get orderNumber => _orderNumber;
  setOrderNumber(String key, String val) {
    _orderNumber.addEntries([MapEntry(key, val)]);
    notifyListeners();
  }

  List _inputs = [];
  List get inputs => _inputs;

  int _i = 1;
  int get i => _i;

  add(int val) {
    _i = val + 1;
    _inputs.add(_i);
    notifyListeners();
  }

  remove(int val) {
    _inputs.remove(val);
    notifyListeners();
  }

  invoiceOrderPay(
      BuildContext context,
      String? amount,
      String? phone,
      String? store,
      Map orderNumber,
      ) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().invoicePay(
        context, amount, phone, store, orderNumber,
      ).then((value) async {
        if (value != null) {
          setLoadingState(0);
          setSelectedStoreName('');
          _inputs = [];
          _i = 1;
          _amount = '';
          _phone = '';
          _store = '';

          notifyListeners();
          await Fluttertoast.showToast(
            msg: '$value',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 15.0,
          );
          Navigator.pushReplacementNamed (
            context,
            '/success',
          );
          return;
        } else {
          setLoadingState(0);
          return;
        }
      });
    });
  }


  String? _storesKeySearch;
  String? get storesKeySearch => _storesKeySearch;
  setStoresKeySearch(String? val) {
    _storesKeySearch = val;
    notifyListeners();
  }

  final List<StoreModel> _storesSearch = [];
  List<StoreModel> get storesSearch => _storesSearch;
  List _storesSearchData = [];
  getStoresSearchList(BuildContext context, String? searchKey) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().getSearchStores(context, searchKey).then((value) {
        _storesSearch.clear();
        if(value != null) {
          setLoadingState(0);
          _storesSearchData = value;
          for(var e in _storesSearchData) {
            _storesSearch.add(StoreModel.fromJson(e));
          }
          notifyListeners();
          return;
        } else {
          setLoadingState(0);
          return;
        }
      });
      Navigator.pushReplacementNamed (
        context,
        '/home/stores',
      );
    });
  }

  String? _selectedStoreName;
  String? get selectedStoreName => _selectedStoreName;
  setSelectedStoreName(String? val) {
    _selectedStoreName = val;
    notifyListeners();
  }

  StoreModel _selectedStore = StoreModel();
  StoreModel get selectedStore => _selectedStore;
  setSelectedStore(StoreModel storeModel) {
    _selectedStore = storeModel;
    notifyListeners();
  }

  final List<StoreModel> _stores = [];
  List<StoreModel> get stores => _stores;
  List _storesData = [];
  getStoresList(BuildContext context) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().getAllStores(context).then((value) {
        _stores.clear();
        if(value != null) {
          setLoadingState(0);
          _storesData = value;
          for(var e in _storesData) {
            _stores.add(StoreModel.fromJson(e));
          }
          notifyListeners();
          return;
        } else {
          setLoadingState(0);
          return;
        }
      });
    });
  }





}
