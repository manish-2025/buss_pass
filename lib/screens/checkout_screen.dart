import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  TextEditingController? controller;
  Razorpay razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: buildBody(context: context)));
  }

  Widget buildBody({required BuildContext context}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(8.0),
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TextField(
          //   controller: controller,
          //   decoration: InputDecoration(border: InputBorder.none),
          // ),
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your Amount",
              prefixIcon: Icon(
                Icons.currency_bitcoin,
                color: Colors.blueAccent,
                size: 30,
              ),
              // suffixIcon: Icon(Icons.check_circle),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.grey, width: 1),
              ),
            ),
          ),
          Text("data1"),
          Text("data2"),
          Text("data3"),
          Text("data4"),
          Text("data5"),
          Text("data6"),
          SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              var options = {
                'key': 'rzp_test_RJpPNf4a0UPFjf',
                'amount': int.parse(
                  (controller?.text.trim() ?? 1000).toString(),
                ),
                'name': 'AMTS.',
                'description': 'By Your Pass',
                'retry': {'enabled': true, 'max_count': 2},
                'send_sms_hash': true,
                'prefill': {
                  'contact': '8888888888',
                  'email': 'test@razorpay.com',
                },
                'external': {
                  'wallets': ['paytm'],
                },
              };
              razorpay.on(
                Razorpay.EVENT_PAYMENT_ERROR,
                handlePaymentErrorResponse,
              );
              razorpay.on(
                Razorpay.EVENT_PAYMENT_SUCCESS,
                handlePaymentSuccessResponse,
              );
              razorpay.on(
                Razorpay.EVENT_EXTERNAL_WALLET,
                handleExternalWalletSelected,
              );
              razorpay.open(options);
            },
            child: Text("Pay 100rs Now"),
          ),
        ],
      ),
    );
  }

  // handlePaymentErrorResponse() {}

  // handleExternalWalletSelected() {}

  // handlePaymentSuccessResponse() {}
  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(
      context,
      "Payment Failed",
      "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}",
    );
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
      context,
      "Payment Successful",
      "Payment ID: ${response.paymentId}",
    );
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
      context,
      "External Wallet Selected",
      "${response.walletName}",
    );
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    // ignore: unused_local_variable
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(title: Text(title), content: Text(message));
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
