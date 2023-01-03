// ignore_for_file: public_member_api_docs

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDF_factura extends StatelessWidget {
  static const String routeName = '/pdf';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => PDF_factura('pdf'),
        settings: RouteSettings(name: routeName));
  }

  const PDF_factura(this.title, {Key? key}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Container(
            // color: Colors.black12,
            child: pw.Container(
                padding: const pw.EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10.0),
                alignment: pw.Alignment.center,
                //color: Colors.white,
                margin:
                    pw.EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                child: pw.Column(children: [
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Cliente', style: pw.Theme.of(context).header1),
                        pw.Text(
                          'Galvin Golden',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('CI:' + '9814089',
                            style: pw.Theme.of(context).header1),
                        //Text('9814089')
                      ]),
                  pw.SizedBox(
                    height: 40.0,
                  ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Items',
                          style: pw.Theme.of(context).header1,
                        ),
                        //Text('9814089')
                      ]),
                  pw.SizedBox(
                    height: 30.0,
                  ),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      children: [
                        pw.Text(
                          'Producto:',
                          style: pw.Theme.of(context).header1,
                        ),
                        //Text('9814089')
                      ]),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Hp Laptop',
                            style: pw.Theme.of(context).header1),
                        pw.Text(
                          'Bs.4360',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                  pw.Divider(thickness: 0.5),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Cantidad',
                            style: pw.Theme.of(context).header1),
                        pw.Text(
                          '1',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                  pw.Divider(thickness: 0.5),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Subtotal',
                            style: pw.Theme.of(context).header1),
                        pw.Text(
                          'Bs.4360',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                  pw.Divider(thickness: 0.5),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Costo de Envio',
                            style: pw.Theme.of(context).header1),
                        pw.Text(
                          'Bs.150',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                  pw.SizedBox(height: 20.0),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('Pago:' + 'Tigo Money',
                            style: pw.Theme.of(context).header1),
                      ]),
                  pw.SizedBox(height: 20.0),
                  pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      children: [
                        pw.Text(
                          'Total:',
                          style: pw.Theme.of(context).header1,
                        ),
                        pw.SizedBox(width: 90.0),
                        pw.Text(
                          'Bs.4510',
                          style: pw.Theme.of(context).header1,
                        )
                      ]),
                ])),
          );
        },
      ),
    );

    return pdf.save();
  }
}
