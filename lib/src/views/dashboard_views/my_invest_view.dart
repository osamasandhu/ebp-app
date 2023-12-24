import 'package:epb_app/src/base/app_assets.dart';
import 'package:epb_app/src/base/app_theme.dart';
import 'package:epb_app/src/utils/app_utils.dart';
import 'package:epb_app/src/widgets/app_container_widget.dart';
import 'package:epb_app/src/widgets/app_layout_builder.dart';
import 'package:epb_app/src/widgets/gradient_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyInvestView extends StatefulWidget {
  const MyInvestView({
    super.key,
    required this.parentDeviceType,
    required this.screenSize,
  });

  final Size screenSize;
  final DeviceType parentDeviceType;

  @override
  State<MyInvestView> createState() => _MyInvestViewState();
}

class _MyInvestViewState extends State<MyInvestView> {
  late DeviceType _deviceType;
  late Size _screenSize;

  bool get _isMobile => _deviceType.isMobile;

  bool get _isTab => _deviceType.isTab;

  bool get _isWeb => _deviceType.isWeb;

  bool get _isPlasmaScreen {
    return _screenSize.width > 1800 && _screenSize.height > 1000;
  }

  void _init([bool rebuild = false]) {
    _deviceType = widget.parentDeviceType;
    _screenSize = widget.screenSize;
    if (rebuild) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('1st Day', 100, 100, 110),
      _ChartData('2nd Day', 100, 100, 110),
      _ChartData('3rd Day', 100, 100, 110),
      _ChartData('4th Day', 100, 100, 110),
      _ChartData('5th Day', 100, 100, 110),
      _ChartData('6th Day', 100, 100, 110),
      _ChartData('7th Day', 100, 100, 110),
    ];
    _tooltip = TooltipBehavior(enable: true);
    _init();
  }

  @override
  void didUpdateWidget(covariant MyInvestView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init(true);
  }

  PreferredSizeWidget _appBarWidget() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(19, 12, 0, 12),
        child: Image.asset(AppAssets.homeIcon, width: 28, height: 22),
      ),
      title: Text(
        'Dashboard',
        style: GoogleFonts.poppins(
          fontSize: 21,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      actions: [
        Image.asset(
          AppAssets.dashboardActionIcon,
          height: 22,
          width: 22,
        ),
        21.width,
      ],
    );
  }

  Widget getProfileDataWidget(DeviceType deviceType) {
    return Row(children: [
      Expanded(
        flex: 2,
        child: AppContainerWidget(
          padding: EdgeInsets.symmetric(
            horizontal: _isPlasmaScreen ? 50 : 12,
            vertical: _isPlasmaScreen ? 25 : 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                AppAssets.profile,
                height: _isPlasmaScreen ? 120 : null,
              ),
              if (_deviceType.isWeb) ...[
                20.width
              ] else ...[
                6.width,
              ],
              Expanded(
                child: Column(children: [
                  Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SAMEER 07',
                            style: GoogleFonts.poppins(
                              fontSize: _deviceType.isMobile
                                  ? 8
                                  : _deviceType.isTab
                                      ? 10
                                      : _isPlasmaScreen
                                          ? 40
                                          : 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lightBlack,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 4,
                            ),
                            child: getSubTitleWidget('Consultant Manager'),
                          ),
                          getSubTitleWidget('Membership: Daimond'),
                          4.height,
                          getSubTitleWidget(
                            'Upgrade Expires: 31 Dec, 2025',
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!_deviceType.isWeb) ...[
                          Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              AppAssets.settingsIcon,
                              height: _deviceType.isMobile ? 17 : 20,
                              width: 17,
                            ),
                          ),
                        ],
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            bottom: 4,
                          ),
                          child: getTextSpanWidget(
                            title: 'Joined on: ',
                            value: ' 07.06.2021',
                          ),
                        ),
                        getTextSpanWidget(
                          title: 'By user ID: ',
                          value: ' 42245',
                        ),
                      ],
                    ),
                  ]),
                  if (deviceType == DeviceType.mobile) ...[
                    Container(
                      margin: const EdgeInsets.only(
                        top: 3,
                        left: 6,
                        right: 3,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 3,
                            spreadRadius: 0,
                            color: Colors.black.withOpacity(0.16),
                          ),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.orangeColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              6,
                              5,
                              7,
                              4,
                            ),
                            child: Text(
                              'My Refferal link',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          3.width,
                          Expanded(
                            child: Text(
                              'https://ebp.net/b/sdr3545tfs',
                              style: GoogleFonts.poppins(
                                color: const Color(0xFF0B3167),
                                fontSize: 6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B3167),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.fromLTRB(
                              6,
                              5,
                              7,
                              4,
                            ),
                            child: Text(
                              'Copy',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 6,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ]),
              ),
            ],
          ),
        ),
      ),
      if (deviceType != DeviceType.mobile) ...[
        11.width,
        Expanded(
          child: AppContainerWidget(
            padding: EdgeInsets.fromLTRB(
              _isPlasmaScreen ? 50 : 22,
              _isPlasmaScreen ? 28 : 8,
              _isPlasmaScreen ? 50 : 14,
              _isPlasmaScreen ? 25 : 8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    'Referral link',
                    style: GoogleFonts.poppins(
                      fontSize: _deviceType.isTab
                          ? 8
                          : _isPlasmaScreen
                              ? 30
                              : 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  27.width,
                  Expanded(
                    child: Icon(
                      Icons.help,
                      color: AppColors.orangeColor,
                      size: _deviceType.isTab
                          ? 14
                          : _isPlasmaScreen
                              ? 30
                              : 20,
                    ),
                  ),
                  if (_deviceType.isTab) ...[
                    Image.asset(AppAssets.arrowUpIcon, height: 6, width: 6),
                  ],
                ]),
                Padding(
                  padding: _isTab
                      ? const EdgeInsets.symmetric(vertical: 8)
                      : _isPlasmaScreen
                          ? const EdgeInsets.symmetric(vertical: 32)
                          : const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'https://ebp.net/b/sdr3545tfs',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.poppins(
                      color: AppColors.blueColor,
                      fontSize: _deviceType.isTab
                          ? 10
                          : _isPlasmaScreen
                              ? 40
                              : 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(children: [
                  getButton(title: 'Copy', onTap: () {}),
                  10.width,
                  getButton(title: 'Share', onTap: () {}),
                ]),
              ],
            ),
          ),
        ),
      ],
    ]);
  }

  Widget getButton({required String title, required VoidCallback onTap}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_isTab ? 3 : 6),
        ),
        minimumSize: Size.zero,
        backgroundColor: AppColors.orangeColor,
        padding: EdgeInsets.symmetric(
          horizontal: _isTab
              ? 3
              : _isPlasmaScreen
                  ? 12
                  : 8,
          vertical: 7,
        ),
      ),
      onPressed: onTap,
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: _deviceType.isTab
              ? 7
              : _isPlasmaScreen
                  ? 22
                  : 16,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  Widget build(BuildContext context) {
    return switch (_deviceType) {
      DeviceType.mobile => Scaffold(
          appBar: _appBarWidget(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getProfileDataWidget(_deviceType),
                20.height,
                Row(children: [
                  getContainerWidget(
                    isBlueBackground: false,
                    title: 'Current Balance',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'Add Money',
                    icon: AppAssets.dollarCoinIcon,
                    iconHeight: 21,
                    iconWidth: 21,
                  ),
                  10.width,
                  getContainerWidget(
                    title: 'Investment Amount',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'My Invest',
                    icon: AppAssets.dollarBagIcon,
                    iconWidth: 12,
                    iconHeight: 14,
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 22),
                  child: Row(children: [
                    getContainerWidget(
                      title: 'Investment Earning',
                      amount: '\$ 0.00000',
                      onTap: () {},
                      buttonTitle: 'Transfer To Cash',
                      icon: AppAssets.graphIcon,
                      iconHeight: 15,
                      iconWidth: 21,
                    ),
                    10.width,
                    getContainerWidget(
                      title: 'Affiliate Income',
                      amount: '\$ 0.00000',
                      onTap: () {},
                      buttonTitle: 'Transfer To Cash',
                      icon: AppAssets.networkIcon,
                      iconWidth: 16,
                      iconHeight: 14,
                    ),
                  ]),
                ),
                ...getStatsWidget(),
                22.height,
                ...getGraphWidget(),
              ],
            ),
          ),
        ),
      DeviceType.tab => Scaffold(
          appBar: _appBarWidget(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getProfileDataWidget(_deviceType),
                20.height,
                Row(children: [
                  getContainerWidget(
                    isBlueBackground: false,
                    title: 'Current Balance',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'Add Money',
                    icon: AppAssets.dollarCoinIcon,
                    iconHeight: 23,
                    iconWidth: 23,
                  ),
                  10.width,
                  getContainerWidget(
                    title: 'Investment Amount',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'My Invest',
                    icon: AppAssets.dollarBagIcon,
                    iconWidth: 14,
                    iconHeight: 15,
                  ),
                  10.width,
                  getContainerWidget(
                    title: 'Investment Earning',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'Transfer To Cash',
                    icon: AppAssets.graphIcon,
                    iconHeight: 23,
                    iconWidth: 17,
                  ),
                  10.width,
                  getContainerWidget(
                    title: 'Affiliate Income',
                    amount: '\$ 0.00000',
                    onTap: () {},
                    buttonTitle: 'Transfer To Cash',
                    icon: AppAssets.networkIcon,
                    iconWidth: 17,
                    iconHeight: 20,
                  ),
                ]),
                28.height,
                ...getStatsWidget(),
                28.height,
                ...getGraphWidget(),
              ],
            ),
          ),
        ),
      DeviceType.web => Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Row(children: [
                Expanded(
                  child: Text(
                    'Dashboard',
                    style: GoogleFonts.poppins(
                      fontSize: _isPlasmaScreen ? 60 : 33,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlack,
                    ),
                  ),
                ),
                Transform.scale(
                  scale: _isPlasmaScreen ? 2 : 1,
                  child: Image.asset(
                    AppAssets.userCircleIcon,
                    color: AppColors.blueColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 49.0, right: 20),
                  child: Text(
                    'EBP User',
                    style: GoogleFonts.poppins(
                      fontSize: _isPlasmaScreen ? 44 : 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightBlack,
                    ),
                  ),
                ),
              ]),
              27.height,
              getProfileDataWidget(_deviceType),
              20.height,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xffFEEFE4),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                margin: const EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _chipContainer(
                      img: AppAssets.myInvest,
                      title: "My Invest",
                    ),
                    _chipContainer(
                      img: AppAssets.addMoney,
                      title: "Add Money",
                    ),
                    _chipContainer(
                      img: AppAssets.withdraw,
                      title: "Withdraw",
                    ),
                    _chipContainer(img: AppAssets.network, title: "Network"),
                    _chipContainer(
                      img: AppAssets.profit,
                      title: "Profit Log",
                      right: 0,
                    ),
                  ],
                ),
              ),
              Row(children: [
                getContainerWidget(
                  isBlueBackground: false,
                  title: 'Current Balance',
                  amount: '\$ 0.00000',
                  onTap: () {},
                  buttonTitle: 'Add Money',
                  icon: AppAssets.dollarCoinIcon,
                  iconHeight: _isPlasmaScreen ? 60 : 51,
                  iconWidth: _isPlasmaScreen ? 60 : 51,
                ),
                10.width,
                getContainerWidget(
                  title: 'Investment Amount',
                  amount: '\$ 0.00000',
                  onTap: () {},
                  buttonTitle: 'My Invest',
                  icon: AppAssets.dollarBagIcon,
                  iconWidth: _isPlasmaScreen ? 33 : 42,
                  iconHeight: _isPlasmaScreen ? 33 : 42,
                ),
                10.width,
                getContainerWidget(
                  title: 'Investment Earning',
                  amount: '\$ 0.00000',
                  onTap: () {},
                  buttonTitle: 'Transfer To Cash',
                  icon: AppAssets.graphIcon,
                  iconHeight: _isPlasmaScreen ? 45 : 38,
                  iconWidth: _isPlasmaScreen ? 60 : 52,
                ),
                10.width,
                getContainerWidget(
                  title: 'Affiliate Income',
                  amount: '\$ 0.00000',
                  onTap: () {},
                  buttonTitle: 'Transfer To Cash',
                  icon: AppAssets.networkIcon,
                  iconWidth: _isPlasmaScreen ? 48 : 39,
                  iconHeight: _isPlasmaScreen ? 54 : 45,
                ),
              ]),
              28.height,
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: getStatsWidget(),
                ),
                15.width,
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getGraphWidget(),
                  ),
                ),
              ]),
            ]),
          ),
        ),
    };
  }

  List<Widget> getGraphWidget() {
    return [
      Text(
        'Earning Chart:',
        style: GoogleFonts.poppins(
          fontSize: _deviceType.isMobile
              ? 10
              : _deviceType.isTab
                  ? 16
                  : 24,
          fontWeight: FontWeight.bold,
          color: AppColors.lightBlack,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      2.height,
      AppContainerWidget(
        boxShadow: [
          BoxShadow(
            offset: const Offset(3, 6),
            blurRadius: 2.5,
            spreadRadius: 0,
            color: Colors.black.withOpacity(0.31),
          ),
        ],
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
        child: Column(children: [
          SizedBox(
            height: 220,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 300,
                interval: 100,
              ),
              tooltipBehavior: _tooltip,
              series: <CartesianSeries<_ChartData, String>>[
                ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (data, _) {
                    return data.y1 + data.y2 + data.y3;
                  },
                  name: 'Gold',
                  color: AppColors.blueColor,
                ),
                ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) => data.y2,
                  name: 'Silver',
                  color: AppColors.orangeColor,
                ),
                ColumnSeries<_ChartData, String>(
                  dataSource: data,
                  xValueMapper: (_ChartData data, _) => data.x,
                  yValueMapper: (_ChartData data, _) {
                    return data.y1 + data.y2 + data.y3;
                  },
                  name: 'Bronze',
                  color: AppColors.lightBlack,
                ),
              ],
            ),
          ),
          if (_deviceType.isWeb) ...[
            0.height,
          ] else ...[
            9.height,
          ],
          RowDataChart(deviceType: _deviceType),
        ]),
      ),
    ];
  }

  List<Widget> getStatsWidget() {
    final shadow = [
      BoxShadow(
        offset: const Offset(5, 6),
        blurRadius: 3,
        spreadRadius: 0,
        color: Colors.black.withOpacity(0.16),
      ),
    ];
    final description = Text(
      'You Have Complete The Next Rank',
      style: GoogleFonts.poppins(
        fontSize: _deviceType.isMobile
            ? 4
            : _deviceType.isTab
                ? 7
                : 10,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBlack,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
    final progressWidget = GradientCircularProgressIndicator(
      deviceType: _deviceType,
      radius: _deviceType == DeviceType.mobile
          ? 37
          : _deviceType == DeviceType.tab
              ? 66
              : 80,
      strokeWidth: 10,
      gradient: const LinearGradient(
        colors: [
          AppColors.blueColor,
          AppColors.orangeColor,
        ],
        stops: [0.45, 1.0],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
      value: 0.85,
      trackColor: const Color(0xFFF1E6E6),
    );
    final statistics = Text(
      'Statistics:',
      style: GoogleFonts.poppins(
        fontSize: _deviceType.isMobile
            ? 10
            : _deviceType.isTab
                ? 16
                : 24,
        fontWeight: FontWeight.bold,
        color: AppColors.lightBlack,
      ),
    );
    if (_deviceType.isWeb) {
      return [
        statistics,
        AppContainerWidget(
          padding: const EdgeInsets.all(15),
          boxShadow: shadow,
          child: Row(children: [
            Column(children: [
              progressWidget,
              // 19.height,
              Padding(
                padding: const EdgeInsets.only(top: 19, bottom: 20),
                child: description,
              ),
              Row(children: [
                getStatisticsTile(title: 'Total Rewards'),
                15.width,
                getStatisticsTile(
                  title: 'Network Members',
                  isOrangeArrow: false,
                ),
              ])
            ]),
            10.width,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                getStatisticsTile(title: 'Total Withdraw'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35),
                  child: getStatisticsTile(title: 'Total Commision'),
                ),
                getStatisticsTile(title: 'Monthly Incentive'),
                42.height,
                getStatisticsTile(
                  title: 'Total Network Sale',
                  isOrangeArrow: false,
                ),
              ],
            ),
          ]),
        ),
      ];
    }
    return [
      statistics,
      AppContainerWidget(
        padding: const EdgeInsets.fromLTRB(9, 22, 11, 21),
        margin: const EdgeInsets.only(top: 2),
        boxShadow: shadow,
        child: Row(children: [
          Column(children: [
            progressWidget,
            if (_deviceType.isMobile) ...[
              6.height,
            ] else if (_deviceType.isTab) ...[
              14.height,
            ],
            description,
          ]),
          if (_deviceType.isMobile) ...[
            9.width,
          ] else if (_deviceType.isTab) ...[
            30.width,
          ],
          Expanded(
            child: Column(children: [
              /// First Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getStatisticsTile(title: 'Total Commision'),
                  getStatisticsTile(title: 'Total Withdraw'),
                  getStatisticsTile(title: 'Total Rewards'),
                ],
              ),
              if (_deviceType == DeviceType.mobile) ...[
                17.height,
              ] else ...[
                42.height,
              ],

              /// Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getStatisticsTile(title: 'Monthly Incentive'),
                  getStatisticsTile(
                    title: 'Total Network Sale',
                    isOrangeArrow: false,
                  ),
                  getStatisticsTile(
                    title: 'Network Members',
                    isOrangeArrow: false,
                  ),
                ],
              ),
            ]),
          ),
        ]),
      )
    ];
  }

  Widget getStatisticsTile({
    bool isOrangeArrow = true,
    required String title,
    String price = '50,000,000.00',
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: GoogleFonts.poppins(
          fontSize: _deviceType.isMobile
              ? 6
              : _deviceType.isTab
                  ? 11
                  : 11,
          fontWeight: FontWeight.w500,
          color: AppColors.lightBlack,
        ),
      ),
      2.height,
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            isOrangeArrow ? AppAssets.arrowOrange : AppAssets.arrowGreen,
            height: _deviceType.isMobile
                ? 11
                : _deviceType.isTab
                    ? 16
                    : 16,
          ),
          2.width,
          RichText(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            text: TextSpan(
              text: '\$ ',
              style: GoogleFonts.poppins(
                color: AppColors.greenColor,
                fontSize: _deviceType.isMobile
                    ? 8
                    : _deviceType.isTab
                        ? 12
                        : 10,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: price,
                  style: GoogleFonts.poppins(
                    fontSize: _deviceType.isMobile
                        ? 8
                        : _deviceType.isTab
                            ? 12
                            : 10,
                    color: AppColors.blueColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }

  Widget getContainerWidget({
    bool isBlueBackground = true,
    required String title,
    required String amount,
    required VoidCallback onTap,
    required String buttonTitle,
    required String icon,
    required double iconWidth,
    required double iconHeight,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          _isMobile
              ? 10
              : _isTab
                  ? 13
                  : _isPlasmaScreen
                      ? 40
                      : 27,
          _isMobile
              ? 8
              : _isTab
                  ? 12
                  : _isPlasmaScreen
                      ? 41
                      : 28,
          _isMobile
              ? 9
              : _isTab
                  ? 12
                  : _isPlasmaScreen
                      ? 41
                      : 28,
          _isMobile
              ? 10
              : _isTab
                  ? 10
                  : _isPlasmaScreen
                      ? 35
                      : 23,
        ),
        decoration: BoxDecoration(
          color: isBlueBackground ? const Color(0xFF0B3167) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            isBlueBackground
                ? BoxShadow(
                    offset: const Offset(5, 6),
                    blurRadius: 3,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.16),
                  )
                : BoxShadow(
                    offset: const Offset(3, 3),
                    blurRadius: 2.5,
                    spreadRadius: 0,
                    color: Colors.black.withOpacity(0.16),
                  ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getContainerText(title, isBlueBackground),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                    ),
                    child: getContainerText(amount, isBlueBackground),
                  ),
                  SizedBox(
                    height: _deviceType.isWeb ? 18 : 4,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.orangeColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(_isMobile ? 3 : 5),
                      ),
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 3,
                      ),
                    ),
                    onPressed: onTap,
                    child: Text(
                      buttonTitle,
                      style: GoogleFonts.poppins(
                        fontSize: _isMobile
                            ? 8
                            : _isTab
                                ? 12
                                : _isPlasmaScreen
                                    ? 20
                                    : 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: _isMobile
                  ? 28
                  : _isTab
                      ? 31
                      : _isPlasmaScreen
                          ? 80
                          : 70,
              width: _isMobile
                  ? 28
                  : _isTab
                      ? 31
                      : _isPlasmaScreen
                          ? 80
                          : 70,
              decoration: const BoxDecoration(
                color: AppColors.orangeColor,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(4),
              child: Image.asset(icon, height: iconHeight, width: iconWidth),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainerText(String text, bool isBlueBackground) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: GoogleFonts.poppins(
        color: isBlueBackground ? Colors.white : AppColors.lightBlack,
        fontSize: _isMobile
            ? 9
            : _isTab
                ? 12
                : _isPlasmaScreen
                    ? 30
                    : 22,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget getTextSpanWidget({required String title, required String value}) {
    final fontSize = _deviceType.isMobile
        ? 6.0
        : _deviceType.isTab
            ? 8.0
            : _isPlasmaScreen
                ? 30.0
                : 22.0;
    return RichText(
      text: TextSpan(
        text: title,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: AppColors.lightBlack,
        ),
        children: [
          TextSpan(
            text: value,
            style: GoogleFonts.poppins(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: AppColors.lightBlack,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSubTitleWidget(String title) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        color: AppColors.lightBlack,
        fontSize: _deviceType.isMobile
            ? 6
            : _deviceType.isTab
                ? 8
                : _isPlasmaScreen
                    ? 30
                    : 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _chipContainer({
    required String img,
    required String title,
    double? right,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(right: right ?? 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.blueColor,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: _isPlasmaScreen ? 64 : 44,
              height: _isPlasmaScreen ? 64 : 44,
              decoration: BoxDecoration(
                color: AppColors.orangeColor,
                borderRadius: BorderRadius.circular(14),
              ),
              margin: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                img,
                color: Colors.white,
                height: _isPlasmaScreen ? 40 : null,
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: _isPlasmaScreen ? 24 : 12,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}

class RowDataChart extends StatefulWidget {
  const RowDataChart({Key? key, required this.deviceType}) : super(key: key);

  final DeviceType deviceType;

  @override
  State<RowDataChart> createState() => _RowDataChartState();
}

class _RowDataChartState extends State<RowDataChart> {
  late DeviceType _deviceType;

  void _init([bool rebuild = false]) {
    _deviceType = widget.deviceType;
    if (rebuild) setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant RowDataChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init(true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: _deviceType.isMobile
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.spaceAround,
        children: [
          _buildDefineColorChart(color: blueColor, label: 'Membership Earning'),
          _buildDefineColorChart(
            color: orangeColor,
            label: 'Non-Flexi Earning',
          ),
          _buildDefineColorChart(
            color: const Color(0xff383838),
            label: 'Flexi Earning',
          ),
        ],
      ),
    );
  }

  final orangeColor = const Color(0xffFE6D00);
  final blueColor = const Color(0xff0B3167);

  Widget _buildDefineColorChart({required Color color, required String label}) {
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 15,
            width: 15,
            color: color,
          ),
          const SizedBox(width: 3),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
