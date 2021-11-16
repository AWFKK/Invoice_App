import 'package:flutter/material.dart';
import 'package:invoice_app/customer.dart';
import 'package:invoice_app/invoice.dart';
import 'package:invoice_app/pdf_invoice_design.dart';
import 'package:invoice_app/pdf_save_path.dart';
import 'package:invoice_app/supplier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Invoice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice"),
      ),
      body: Center(
        child: InkWell(
          onTap: () async {
            final date = DateTime.now();
            final dueDate = date.add(Duration(days: 7));

            final invoice = Invoice(
              supplier: Supplier(
                name: 'Faiz',
                address: 'Karachi, Pakistan',
                paymentInfo: 'https://paypal.me/sarahfieldzz',
              ),
              customer: Customer(
                name: 'Naveed.',
                address: 'Karachi Pakistan',
              ),
              info: InvoiceInfo(
                date: date,
                dueDate: dueDate,
                description: 'My description...',
                number: '${DateTime.now().year}-9999',
              ),
              items: [
                InvoiceItem(
                  description: 'Coffee',
                  date: DateTime.now(),
                  quantity: 3,
                  vat: 0.19,
                  unitPrice: 5.99,
                ),
                InvoiceItem(
                  description: 'Water',
                  date: DateTime.now(),
                  quantity: 8,
                  vat: 0.19,
                  unitPrice: 0.99,
                ),
                InvoiceItem(
                  description: 'Orange',
                  date: DateTime.now(),
                  quantity: 3,
                  vat: 0.19,
                  unitPrice: 2.99,
                ),
                InvoiceItem(
                  description: 'Apple',
                  date: DateTime.now(),
                  quantity: 8,
                  vat: 0.19,
                  unitPrice: 3.99,
                ),
                InvoiceItem(
                  description: 'Mango',
                  date: DateTime.now(),
                  quantity: 1,
                  vat: 0.19,
                  unitPrice: 1.59,
                ),
                InvoiceItem(
                  description: 'Blue Berries',
                  date: DateTime.now(),
                  quantity: 5,
                  vat: 0.19,
                  unitPrice: 0.99,
                ),
                InvoiceItem(
                  description: 'Lemon',
                  date: DateTime.now(),
                  quantity: 4,
                  vat: 0.19,
                  unitPrice: 1.29,
                ),
              ],
            );

            final pdfFile = await PdfInvoicePage.generate(invoice,'0123');

            Pdf.openFile(pdfFile);

          },
          child: Container(
            height: 50,
            width: 150,
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Text("Invoice", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}
