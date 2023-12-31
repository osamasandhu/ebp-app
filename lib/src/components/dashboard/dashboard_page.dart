import 'dart:developer';

import 'package:epb_app/src/base/app_assets.dart';
import 'package:epb_app/src/base/app_theme.dart';
import 'package:epb_app/src/utils/app_utils.dart';
import 'package:epb_app/src/views/dashboard_views/my_invest_view.dart';
import 'package:epb_app/src/widgets/app_layout_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  var _pages = <Widget>[];

  var _selectedIndex = 0;

  Widget getImage(String image, int index) {
    if (image.endsWith('.png')) {
      return Image.asset(
        image,
        color: _selectedIndex == index ? Colors.white : AppColors.orangeColor,
        height: 32,
        width: 32,
      );
    }
    return SvgPicture.asset(
      image,
      color: _selectedIndex == index ? Colors.white : AppColors.orangeColor,
    );
  }

  Widget _imgVerticalTab({
    required String url,
    required String title,
    required int i,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ListTile(
        onTap: () {
          _selectedIndex = i;
          setState(() {});
        },
        leading: img(i: i, url: url),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: _selectedIndex == i ? FontWeight.bold : FontWeight.w500,
            color: _selectedIndex == i ? Colors.white : AppColors.orangeColor,
          ),
        ),
      ),
    );
  }

  var _width = 0.0;
  var _height = 0.0;

  bool get _isPlasmaScreen => _width > 1800 && _height > 1000;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AppLayoutBuilder((context, deviceType, width, height) {
      _width = width;
      _height = height;
      _pages = [
        MyInvestView(
          parentDeviceType: deviceType,
          screenSize: Size(_width, _height),
        ),
        const Center(child: Text('Add Money')),
        const Center(child: Text('Withdraw')),
        const Center(child: Text('Networks')),
        const Center(child: Text('Transactions')),
        const Center(child: Text('Add Money')),
        const Center(child: Text('Withdraw')),
        const Center(child: Text('Networks')),
        const Center(child: Text('Transactions')),
        const Center(child: Text('Networks')),
        const Center(child: Text('Transactions')),
        const Center(child: Text('Add Money')),
        const Center(child: Text('Withdraw')),
        const Center(child: Text('Networks')),
        const Center(child: Text('Transactions')),
      ];

      return Scaffold(
        body: deviceType == DeviceType.web
            ? Row(children: [
                SizedBox(
                  width: _isPlasmaScreen ? 440 : 220,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.menu, color: AppColors.orangeColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.asset(
                          AppAssets.appIcon,
                          width: 220,
                          height: 50,
                        ),
                      ),
                      16.height,
                      Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            height: _isPlasmaScreen ? size.height - 89 : null,
                            decoration: const BoxDecoration(
                              color: AppColors.blueColor,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                _imgVerticalTab(
                                  url: AppAssets.dashboard,
                                  title: "Dashboard",
                                  i: 0,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.profile,
                                  title: "Profile",
                                  i: 1,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.addMoney,
                                  title: "Add Money",
                                  i: 2,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.myInvest,
                                  title: "My Invest",
                                  i: 3,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.plan,
                                  title: "Plan",
                                  i: 4,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.withdraw,
                                  title: "Withdraw",
                                  i: 5,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.transaction,
                                  title: "Transaction",
                                  i: 6,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.achieve,
                                  title: "Achievement",
                                  i: 7,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.networkTree,
                                  title: "Network Tree",
                                  i: 8,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.network,
                                  title: "Network",
                                  i: 9,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.profit,
                                  title: "Profit",
                                  i: 10,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.support,
                                  title: "Support",
                                  i: 11,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.password,
                                  title: "Change Password",
                                  i: 12,
                                ),
                                _imgVerticalTab(
                                  url: AppAssets.logout,
                                  title: "Logout",
                                  i: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(width: 1, color: AppColors.blueColor),
                Expanded(flex: 4, child: _pages[_selectedIndex]),
              ])
            : _pages[_selectedIndex],
        bottomNavigationBar:
            deviceType == DeviceType.mobile || deviceType == DeviceType.tab
                ? BottomNavigationBar(
                    unselectedItemColor: Colors.white,
                    selectedItemColor: AppColors.orangeColor,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedIndex,
                    backgroundColor: const Color(0xff0B3167),
                    unselectedLabelStyle: const TextStyle(
                      color: AppColors.orangeColor,
                      fontSize: 13,
                    ),
                    selectedLabelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    onTap: _onItemTapped,
                    items: [
                      BottomNavigationBarItem(
                        icon: img(url: AppAssets.myInvest, i: 0),
                        label: 'My Invest',
                      ),
                      BottomNavigationBarItem(
                        icon: img(url: AppAssets.addMoney, i: 1),
                        label: 'Add Money',
                      ),
                      BottomNavigationBarItem(
                        icon: img(url: AppAssets.withdraw, i: 2),
                        label: 'Withdraw',
                      ),
                      BottomNavigationBarItem(
                        icon: img(url: AppAssets.network, i: 3),
                        label: 'Networks',
                      ),
                      BottomNavigationBarItem(
                        icon: img(url: AppAssets.transaction, i: 4),
                        label: 'Transaction',
                      ),
                    ],
                  )
                : null,
      );
    });
  }

  Widget img({required String url, required int i}) {
    return SvgPicture.asset(
      url,
      color: i == _selectedIndex ? Colors.white : AppColors.orangeColor,
    );
  }
}

extension Print on Object {
  void printOnConsole() => log(toString());
}
