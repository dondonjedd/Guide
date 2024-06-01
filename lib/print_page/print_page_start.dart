import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PrintPageStart extends StatelessWidget {
  const PrintPageStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Print Page Example',
            ),
          ],
        ),
      ),
      body: ListView(
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
      floatingActionButton: FloatingActionButton(isExtended: true, onPressed: () {}, child: const Text('Print')),
    );
  }
}
