import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

// ------------------ LOGIN PAGE ------------------

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Dashboard"),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => SendMoneyPage(),
                transitionsBuilder: (_, animation, __, child) {
                  return FadeTransition(opacity: animation, child: child);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// ------------------ SEND MONEY PAGE ------------------

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  bool isFavorite = false;
  String? selectedMethod;
  bool showSuccess = false;

  String? nameError;
  String? amountError;

  List<String> paymentMethods = ["M-Pesa", "Airtel Money", "Bank"];

  void validateAndSend() {
    setState(() {
      nameError = nameController.text.isEmpty ? "Enter recipient name" : null;

      if (amountController.text.isEmpty) {
        amountError = "Enter amount";
      } else if (double.tryParse(amountController.text) == null ||
          double.parse(amountController.text) <= 0) {
        amountError = "Enter a valid amount";
      } else {
        amountError = null;
      }

      if (nameError == null && amountError == null) {
        showSuccess = true;
        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            showSuccess = false;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Send Money")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Recipient Name",
                errorText: nameError,
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Amount",
                errorText: amountError,
              ),
            ),
            SizedBox(height: 10),

            DropdownButton<String>(
              hint: Text("Select Payment Method"),
              value: selectedMethod,
              isExpanded: true,
              items: paymentMethods.map((method) {
                return DropdownMenuItem(
                  value: method,
                  child: Text(method),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedMethod = value;
                });
              },
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Mark as Favorite"),
                Switch(
                  value: isFavorite,
                  onChanged: (value) {
                    setState(() => isFavorite = value);
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            SendButton(
              title: "Send Money",
              onTap: validateAndSend,
            ),

            SizedBox(height: 20),

            AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              opacity: showSuccess ? 1 : 0,
              child: Text(
                "✔ Transaction Successful",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ------------------ CUSTOM WIDGET ------------------

class SendButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SendButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(title, style: TextStyle(fontSize: 16)),
    );
  }
}
