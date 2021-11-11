import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'constants.dart';
import 'datetime_picker_widget.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({Key? key, required this.price}) : super(key: key);
  final String price;

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  late Razorpay razerPay;
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    razerPay = Razorpay();
    razerPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razerPay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razerPay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    razerPay.clear();
    super.dispose();
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_FSajwnc9EyY9NM",
      "amount": num.parse(widget.price) * 100,
      "name": 'Booking the hotel',
      'description': 'Pay the money',
      'prefill': {'email': 'Nikhil', 'contact': '123456789'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razerPay.open(options);
    } catch (e) {
      print(e);
    }
  }

  void handlerPaymentSuccess(PaymentSuccessResponse response) {
    print('Payment Success');
  }

  void handlerPaymentError(PaymentFailureResponse response) {
    print('Payment Error');
  }

  void handlerExternalWallet(ExternalWalletResponse response) {
    print('Wallet gateway successful');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.background,
      appBar: AppBar(
        title: Text(
          'Payment Gateway',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.textColor),
        ),
        backgroundColor: Constants.buttonColor,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  "Check-In Time",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Constants.textColor),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  "Check-Out Time",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Constants.textColor),
                )),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  openCheckout();
                },
                style: ElevatedButton.styleFrom(primary: Constants.buttonColor),
                child: Text('Pay Now',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Constants.textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
