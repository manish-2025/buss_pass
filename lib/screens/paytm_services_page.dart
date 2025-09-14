import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaytmServicesPage extends StatelessWidget {
  const PaytmServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: TextField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
            // border: OutlineInputBorder(),
            border: InputBorder.none,
            labelText: '',
            hintText: 'Search for content',
          ),
          autofocus: true,
          keyboardType: TextInputType.text,
          onChanged: (value) {
            print("Text changed: $value");
          },
          onSubmitted: (value) {
            print("Submitted: $value");
          },
        ),
        // title: Text(
        //   'Search For Contacts',
        //   style: TextStyle(
        //     color: Colors.grey[600],
        //     fontSize: 18,
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recents Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recents',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF00BCD4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Ahmedabad AMTS',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.north_east, size: 16, color: Colors.grey[600]),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Recent Services Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Recent Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceItem(
                        Icons.directions_bus,
                        'City Bus\nTickets',
                        Color(0xFF4A90E2),
                      ),
                      _buildServiceItem(
                        Icons.flight,
                        'Travel\nBookings',
                        Color(0xFFE74C3C),
                      ),
                      _buildServiceItem(
                        Icons.lightbulb,
                        'Electricity\nBill Paym...',
                        Color(0xFFF39C12),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Quick Actions Row
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction(Icons.receipt_long, 'My Orders'),
                  _buildQuickAction(Icons.help_outline, 'Help & Support'),
                  _buildQuickAction(Icons.info_outline, 'Paytm Guide'),
                ],
              ),
            ),

            SizedBox(height: 12),

            // Popular Services Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  // First Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceItem(
                        Icons.train,
                        'Metro',
                        Color(0xFF8B4513),
                      ),
                      _buildServiceItem(
                        Icons.currency_rupee,
                        'Personal\nLoan',
                        Color(0xFF00BCD4),
                      ),
                      _buildServiceItem(
                        Icons.train,
                        'Train\nTickets',
                        Color(0xFF4A90E2),
                      ),
                      _buildServiceItem(
                        Icons.credit_score,
                        'Free Credit\nScore',
                        Color(0xFFFF6B35),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildServiceItem(
                        Icons.person_add,
                        'Referral\nCode',
                        Color(0xFF2ECC71),
                      ),
                      _buildServiceItem(
                        Icons.local_gas_station,
                        'FASTag\nRecharge',
                        Color(0xFF27AE60),
                      ),
                      _buildServiceItem(
                        Icons.flight,
                        'Flights',
                        Color(0xFF3498DB),
                      ),
                      _buildServiceItem(
                        Icons.account_balance,
                        'Mutual\nFunds',
                        Color(0xFF16A085),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(IconData icon, String title, Color iconColor) {
    return GestureDetector(
      onTap: () {
        // Handle service tap
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 30, color: iconColor),
          ),
          SizedBox(height: 8),
          Container(
            width: 80,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
                height: 1.2,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // Handle quick action tap
      },
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 24, color: Colors.grey[600]),
          ),
          SizedBox(height: 8),
          Container(
            width: 100,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Status Bar Widget (for demonstration)
class StatusBarWidget extends StatelessWidget {
  const StatusBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '10:48:31',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Icon(Icons.bluetooth, size: 16, color: Colors.black),
                SizedBox(width: 4),
                Icon(
                  Icons.signal_cellular_4_bar,
                  size: 16,
                  color: Colors.black,
                ),
                SizedBox(width: 4),
                Icon(Icons.wifi, size: 16, color: Colors.black),
                SizedBox(width: 4),
                Text(
                  '43%',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
                Icon(Icons.battery_3_bar, size: 16, color: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
