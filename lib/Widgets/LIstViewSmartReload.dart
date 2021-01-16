import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/LoginHistoryModel.dart';
import 'package:flutter_app/Utils/CircularProgress.dart';
import 'package:flutter_app/WebService/RestFullApi.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListViewSmartReload extends StatefulWidget {
  @override
  _ListViewSmartReloadState createState() => _ListViewSmartReloadState();
}

class _ListViewSmartReloadState extends State<ListViewSmartReload> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  LoginHistory loginHistory;
  var selectedId, page = 0, token = '';

  void sharedMethod(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
    print(sharedPreferences.getString('token'));
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 100));
    _fetchDataMethod();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      page += 1;
      RestFullApi.loginHistoryMethod(page.toString(), token).then((onValue) => loginHistory.data.loginHistory.addAll(onValue.data.loginHistory));
      _refreshController.loadComplete();
    });
  }

  void _fetchDataMethod() {
    sharedMethod(token);
    RestFullApi.loginHistoryMethod('1', token).then((onValue) => setState(() => loginHistory = onValue));
  }

  Widget _smartReload() {
    return SmartRefresher(
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropMaterialHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text('push to reload');
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text("Load Failed!Click retry!");
          } else if (mode == LoadStatus.canLoading) {
            body = Text("release to load more");
          } else {
            body = Text("No more Data");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: ListView.builder(
        itemCount: loginHistory == null ? 0 : loginHistory.data.loginHistory.length,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => InkWell(
          onTap: () => setState(() => selectedId = index),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            height: selectedId == index ? 120.0 : 100.0,
            width: 50.0,
            margin: const EdgeInsets.all(5.0),
            color: selectedId == index ? Colors.red : Colors.green,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(loginHistory.data.loginHistory[index].lastLogin.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          height: size.height - 300.0, width: size.width, child: loginHistory == null || loginHistory.data.loginHistory == null ? CircularProgress() : _smartReload()),
    );
  }
}
