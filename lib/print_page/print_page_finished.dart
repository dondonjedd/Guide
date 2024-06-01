import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPageFinished extends StatelessWidget {
  PrintPageFinished({super.key});

  //Create a global key to identify which widget to print
  final GlobalKey<State<StatefulWidget>> printKey = GlobalKey();

  Future screenToPdf() async {
    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWrapper.fromKey(
        key: printKey,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Container(alignment: pw.Alignment.center, padding: const pw.EdgeInsets.all(48), child: pw.Image(image));
          }));

      return await doc.save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Print/Save Scrollable Widget as PDF',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: printKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://preview.redd.it/made-a-transparent-version-of-captain-pikachu-2nd-photo-v0-dornqikn58wa1.png?width=640&crop=smart&auto=webp&s=f7e95e21d60aa51aec3d2d3d04e1345526108332',
              ),
              Image.network(
                'https://pokemon.gishan.cc/static/i/pokemon/bulbasaur.png',
              ),
              Image.network(
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ef45805e-2d89-4ef2-a3cf-942815707282/dgoalqn-6e50271a-c150-41cb-b193-19525671e9c7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2VmNDU4MDVlLTJkODktNGVmMi1hM2NmLTk0MjgxNTcwNzI4MlwvZGdvYWxxbi02ZTUwMjcxYS1jMTUwLTQxY2ItYjE5My0xOTUyNTY3MWU5YzcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.MMk9IY_pbFPpW-_WrQvwV7hooXn3T3jlA6qE_oT_1GE',
              ),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 200,
        child: FloatingActionButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            isExtended: true,
            onPressed: () {
              screenToPdf();
            },
            child: const Text('Print or Save')),
      ),
    );
  }
}
