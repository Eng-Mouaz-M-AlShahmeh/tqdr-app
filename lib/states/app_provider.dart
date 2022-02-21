// Developed by: Eng Mouaz M. Al-Shahmeh
import 'package:flutter/material.dart';
import 'package:tqdr/models/service_provider.dart';
import 'package:tqdr/utils/api.dart';

class AppProvider extends ChangeNotifier {

  int _loading = 0;
  int get loading => _loading;
  setLoadingState(int val) {
    _loading = val;
    notifyListeners();
  }

  final List<ServiceProviderModel> _sps = [];
  List<ServiceProviderModel> get sps => _sps;
  List _spsData = [];
  getSPsList(BuildContext context) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().getAllServiceProviders(context).then((value) {
        _sps.clear();
        if(value != null) {
          setLoadingState(0);
          _spsData = value;
          for(var e in _spsData) {
            _sps.add(ServiceProviderModel.fromJson(e));
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

  String? _spsKeySearch;
  String? get spsKeySearch => _spsKeySearch;
  setSPsKeySearch(String? val) {
    _spsKeySearch = val;
    notifyListeners();
  }

  final List<ServiceProviderModel> _spsSearch = [];
  List<ServiceProviderModel> get spsSearch => _spsSearch;
  List _spsSearchData = [];
  getSPsSearchList(BuildContext context, String? keySearch) {
    setLoadingState(1);
    Future.delayed(const Duration(milliseconds: 0), () {
      Api().getAllServiceProvidersSearch(context, keySearch).then((value) {
        _spsSearch.clear();
        if(value != null) {
          setLoadingState(0);
          _spsSearchData = value;
          for(var e in _spsSearchData) {
            _spsSearch.add(ServiceProviderModel.fromJson(e));
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
        '/home/servProvs',
      );
    });
  }

}
