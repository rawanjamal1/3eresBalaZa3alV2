import 'package:flutter/material.dart';
import 'components/table_card.dart';

class Seating extends StatefulWidget {
  final int guests;
  final int seats;
  final int tables;

  const Seating({
    super.key,
    required this.guests,
    required this.seats,
    required this.tables,
  });

  @override
  State<Seating> createState() => _SeatingState();
}

class _SeatingState extends State<Seating> {
  int selectedTable = 1;

  Widget counter(String label, int value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF123B45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            '$value',
            style: const TextStyle(color: Color(0xFFD8B982), fontSize: 25),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFFC8D2D6), fontSize: 12),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D202B),
      appBar: AppBar(
        title: const Text('قاعة العرس'),
        backgroundColor: const Color(0xFF123B45),
        foregroundColor: const Color(0xFFD8B982),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'كل واحد إلو مطرح!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'ElMessiri',
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color: Color(0xFFF6F0E7),
                  ),
                ),

                const Text(
                  'اختار طاولة وبلّش وزّع المعازيم',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFFD8B982)),
                ),

                const SizedBox(height: 20),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    counter('المعازيم', widget.guests),
                    counter('الطاولات', widget.tables),
                    counter('الكراسي', widget.seats),
                  ],
                ),

                const SizedBox(height: 20),

                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = (constraints.maxWidth / 200)
                          .floor()
                          .clamp(1, 5)
                          .toInt();

                      final cardWidth = (constraints.maxWidth / columns - 12)
                          .clamp(0.0, 200.0)
                          .toDouble();

                      return ListView.builder(
                        itemCount: (widget.tables / columns).ceil(),
                        itemBuilder: (context, row) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (
                                  int index = row * columns;
                                  index < (row + 1) * columns &&
                                      index < widget.tables;
                                  index++
                                )
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: SizedBox(
                                      width: cardWidth,
                                      height: 190,
                                      child: TableCard(
                                        number: index + 1,
                                        seats: widget.seats,
                                        selected: selectedTable == index + 1,
                                        onTap: () {
                                          setState(() {
                                            selectedTable = index + 1;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  'اخترت طاولة رقم $selectedTable',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color(0xFFD8B982),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
