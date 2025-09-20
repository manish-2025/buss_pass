import 'package:buss_pass/core/assets_images.dart';
import 'package:buss_pass/screens/checkout_screen.dart';
import 'package:buss_pass/screens/paytm_services_page.dart';
import 'package:flutter/material.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class PaytmHomePage extends StatefulWidget {
  const PaytmHomePage({super.key});

  @override
  PaytmHomePageState createState() => PaytmHomePageState();
}

class PaytmHomePageState extends State<PaytmHomePage> {
  final tg = TelegramWebApp.instance;

  final PageController _pageController = PageController();
  final List<String> _banners = [
    AssetsImages().banner1,
    AssetsImages().banner2,
    AssetsImages().banner3,
    AssetsImages().banner4,
    AssetsImages().banner5,
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Auto-slide banners
    Future.delayed(Duration.zero, _autoSlide);
  }

  void _autoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        _currentIndex = (_currentIndex + 1) % _banners.length;
        _pageController.animateToPage(
          _currentIndex,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _autoSlide(); // Repeat
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text("${tg.initDataUnsafe?.user?.first_name}"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi User!',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            Text(
              'Paytm Wallet ₹1,250',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaytmServicesPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _banners.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    // return Image.network(_banners[index], fit: BoxFit.cover);
                    return Image.asset(_banners[index], fit: BoxFit.fill);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            // Money Transfer Section
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Money Transfer',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTransferOption(
                        icon: Icons.qr_code,
                        title: 'Scan & Pay',
                        color: Colors.white,
                      ),
                      _buildTransferOption(
                        icon: Icons.person,
                        title: 'To Mobile',
                        color: Colors.white,
                      ),
                      _buildTransferOption(
                        icon: Icons.account_balance,
                        title: 'To Bank A/c',
                        color: Colors.white,
                      ),
                      _buildTransferOption(
                        icon: Icons.person,
                        title: 'To Self A/c',
                        color: Colors.white,
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildTransferOption(
                        icon: Icons.account_balance_wallet,
                        title: 'Balance &\nHistory',
                        color: const Color.fromARGB(255, 2, 30, 188),
                        bgColor: const Color.fromARGB(255, 206, 232, 249),
                      ),
                      _buildTransferOption(
                        icon: Icons.qr_code,
                        title: 'Receive\nMoney',
                        color: const Color.fromARGB(255, 2, 30, 188),
                        bgColor: const Color.fromARGB(255, 206, 232, 249),
                      ),
                      _buildTransferOption(
                        icon: Icons.add,
                        title: 'Add Scan\nShortcut',
                        color: const Color.fromARGB(255, 2, 30, 188),
                        bgColor: const Color.fromARGB(255, 206, 232, 249),
                      ),
                      _buildTransferOption(
                        icon: Icons.apps,
                        title: 'All UPI\nServices',
                        color: const Color.fromARGB(255, 2, 30, 188),
                        bgColor: const Color.fromARGB(255, 206, 232, 249),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Services Banner
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo[400]!, Colors.purple[600]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Book Travel & Entertainment',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Flights • Trains • Bus • Movies',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.flight_takeoff, color: Colors.white, size: 40),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            SizedBox(height: 100), // Bottom padding for navigation
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CheckoutScreen()),
          );
        },
        // child: Icon(Icons.currency_bitcoin, color: Colors.amber),
        child: Text("Pay"),
      ),
    );
  }

  Widget _buildTransferOption({
    required IconData icon,
    required String title,
    Color? color,
    Color? bgColor,
  }) {
    return GestureDetector(
      onTap: () {
        // Handle tap
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: bgColor ?? const Color.fromARGB(255, 2, 30, 188),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color ?? Colors.white, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
