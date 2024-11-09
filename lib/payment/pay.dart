// ignore_for_file: avoid_print

import 'package:check/payment/key.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class Stripeservice {
  Stripeservice._();
  static final Stripeservice instance = Stripeservice._();

  Future<void> makePayment(int money) async {
    try {
      String? result = await createPaymentIntent(money, "usd");
      if (result == null) {
        print("$result");
        return;
      } else {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                paymentIntentClientSecret: result,
                merchantDisplayName: "Liben Adugna"));
        await processpayment();
      }
    } catch (e) {
      print("Error in makePayment: ${e.toString()}");
    }
  }

  Future<String?> createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": calculateAmount(amount),
        "currency": currency,
      };

      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization":"Bearer $stripeSecretKey", // Ensure this variable is defined in your constants
            "Content-Type": 'application/x-www-form-urlencoded',
          },
        ),
      );

      if (response.data != null) {
        print("Response from Stripe: ${response.data}");
        return response.data['client_secret']; // Return the client secret for further processing
      }
      return null;
    } catch (e) {
      print("Error in createPaymentIntent: ${e.toString()}");
    }
    return null;
  }

  Future<void> processpayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      print(e.toString());
    }
  }

  String calculateAmount(int amount) {
    final calculatedAmount = amount * 100; // Stripe expects amount in cents
    return calculatedAmount.toString();
  }
}

  

Future<void> setup() async {
  Stripe.publishableKey = stripePublishableKey;
}
