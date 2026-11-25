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
  final guestController = TextEditingController();

  late final List<List<String>> guestsByTable;

  @override
  void initState() {
    super.initState();

    guestsByTable = List.generate(widget.tables, (index) => <String>[]);
  }

  @override
  void dispose() {
    guestController.dispose();
    super.dispose();
  }

  void addGuest() {
    final name = guestController.text.trim();

    final currentGuests = guestsByTable[selectedTable - 1];

    int totalSeated = 0;

    for (final table in guestsByTable) {
      totalSeated += table.length;
    }

    if (name.isEmpty) {
      showMessage('اكتب اسم المعزوم أول شي!');
      return;
    }
    for (int i = 0; i < guestsByTable.length; i++) {
      for (final guest in guestsByTable[i]) {
        if (guest.toLowerCase() == name.toLowerCase()) {
          showMessage(
            'هالمعزوم قاعد عالطاولة رقم ${i + 1}، بدّك تقعده مطرحين؟ 😂',
          );
          return;
        }
      }
    }
    if (currentGuests.length >= widget.seats) {
      showMessage('الطاولة فلّت! اختار طاولة تانية.');
      return;
    }

    if (totalSeated >= widget.guests) {
      showMessage('كل المعازيم صار عندن مطرح!');
      return;
    }

    setState(() {
      currentGuests.add(name);
    });

    guestController.clear();
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message, textDirection: TextDirection.rtl)),
    );
  }

  Widget guestPanel() {
    final currentGuests = guestsByTable[selectedTable - 1];

    return Center(
      child: Container(
        width: 450,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF123B45),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xFFD8B982)),
        ),
        child: Column(
          children: [
            Text(
              'معازيم الطاولة $selectedTable',
              style: const TextStyle(
                fontFamily: 'ElMessiri',
                fontWeight: FontWeight.w500,
                fontSize: 25,
                color: Color(0xFFD8B982),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: guestController,
              style: const TextStyle(color: Color(0xFFF6F0E7)),
              decoration: InputDecoration(
                labelText: 'اسم المعزوم الكامل',
                labelStyle: const TextStyle(color: Color(0xFFD8B982)),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Color(0xFFD8B982),
                ),
                filled: true,
                fillColor: const Color(0xFF0D202B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onSubmitted: (value) {
                addGuest();
              },
            ),

            const SizedBox(height: 15),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: addGuest,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD8B982),
                  foregroundColor: const Color(0xFF0D202B),
                  padding: const EdgeInsets.all(16),
                ),
                child: const Text(
                  'احجزله كرسي',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),

            const SizedBox(height: 20),

            if (currentGuests.isEmpty)
              const Text(
                'بعد ما حدا قعد عهالطاولة.',
                style: TextStyle(color: Color(0xFFC8D2D6)),
              ),

            for (int i = 0; i < currentGuests.length; i++)
              Card(
                color: const Color(0xFF0D202B),
                child: ListTile(
                  leading: const Icon(Icons.person, color: Color(0xFF27B7B2)),
                  title: Text(
                    currentGuests[i],
                    style: const TextStyle(color: Color(0xFFF6F0E7)),
                  ),
                  trailing: Text(
                    '${i + 1}',
                    style: const TextStyle(color: Color(0xFFD8B982)),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: AppBar(
                      primary: false,
                      title: const Text('قاعة العرس'),
                      backgroundColor: const Color(0xFF123B45),
                      foregroundColor: const Color(0xFFD8B982),
                    ),
                  ),

                  const SizedBox(height: 15),
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

                  LayoutBuilder(
                    builder: (context, constraints) {
                      final columns = (constraints.maxWidth / 200)
                          .floor()
                          .clamp(1, 5)
                          .toInt();

                      final cardWidth = (constraints.maxWidth / columns - 12)
                          .clamp(0.0, 200.0)
                          .toDouble();
                      final rowCount = (widget.tables / columns).ceil();
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: rowCount + 1,
                        itemBuilder: (context, row) {
                          if (row == rowCount) {
                            return guestPanel();
                          }
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
                                        occupied: guestsByTable[index].length,
                                        selected: selectedTable == index + 1,
                                        onTap: () {
                                          if (selectedTable != index + 1) {
                                            guestController.clear();

                                            setState(() {
                                              selectedTable = index + 1;
                                            });
                                          }
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
      ), // SafeArea
    ); // Scaffold
  }
}
