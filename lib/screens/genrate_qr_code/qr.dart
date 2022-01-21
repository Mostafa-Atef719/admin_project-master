import 'package:admin_project/screens/genrate_qr_code/components/check_in.dart';
import 'package:admin_project/screens/genrate_qr_code/components/check_out.dart';
import 'package:flutter/material.dart';

class QrGenratorV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: "Check In",
              ),
              Tab(
                text: "Check Out",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CheckInTab(),
            CheckOutTab()
          ],
        ),
      ),
    );
  }
}
