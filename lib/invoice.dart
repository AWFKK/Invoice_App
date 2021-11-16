
import 'package:invoice_app/customer.dart';
import 'package:invoice_app/supplier.dart';

class Invoice {
  final InvoiceInfo? info;
  final Supplier? supplier;
  final Customer? customer;
  final List<InvoiceItem>? items;

  const Invoice({
     this.info,
     this.supplier,
     this.customer,
     this.items,
  });
}

class InvoiceInfo {
  final String? description;
  final String number;
  final DateTime? date;
  final DateTime? dueDate;

  const InvoiceInfo({
     this.description,
     required this.number,
     this.date,
     this.dueDate,
  });
}

class InvoiceItem {
  final String? description;
  final DateTime? date;
  final int? quantity;
  final double? vat;
  final double? unitPrice;

  const InvoiceItem({
     this.description,
     this.date,
     this.quantity,
     this.vat,
     this.unitPrice,
  });
}
