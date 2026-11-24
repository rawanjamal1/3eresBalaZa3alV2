import 'package:flutter/material.dart';

class Setup extends StatelessWidget {
  const Setup({super.key});
  Widget numberInput(String label, IconData icon) {
    return TextField(
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Color(0xFFF6F0E7)),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFFD8B982)),
        prefixIcon: Icon(icon, color: Color(0xFFD8B982)),
        filled: true,
        fillColor: const Color(0xFF0D202B),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFF526B74)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xFFD8B982), width: 2),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D202B),
      appBar: AppBar(
        title: const Text('هندسة المعازيم'),
        backgroundColor: const Color(0xFF123B45),
        foregroundColor: const Color(0xFFD8B982),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: 450,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    const Icon(
                      Icons.assignment_outlined,
                      size: 65,
                      color: Color(0xFFD8B982),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'خلّينا نحسبها صح!',
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                        fontWeight: FontWeight.w500,
                        fontSize: 38,
                        color: Color(0xFFF6F0E7),
                      ),
                    ),

                    const Text(
                      'أول خطوة لعرس بلا مشاكل.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'ElMessiri',
                        fontWeight: FontWeight.w500,
                        fontSize: 22,
                        color: Color(0xFFD8B982),
                      ),
                    ),

                    const SizedBox(height: 30),

                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: const Color(0xFF123B45),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: const Color(0xFFD8B982)),
                      ),
                      child: Column(
                        children: [
                          numberInput(
                            'قديه عدد يلي رح يشرّفونا؟',
                            Icons.people_outline,
                          ),

                          const SizedBox(height: 20),

                          numberInput(
                            'كم كرسي بكل طاولة؟',
                            Icons.chair_outlined,
                          ),

                          const SizedBox(height: 25),

                          const Text(
                            'عدد الطاولات المطلوبة',
                            style: TextStyle(
                              color: Color(0xFFC8D2D6),
                              fontSize: 16,
                            ),
                          ),

                          const Text(
                            '—',
                            style: TextStyle(
                              fontSize: 38,
                              color: Color(0xFFD8B982),
                            ),
                          ),

                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD8B982),
                                foregroundColor: const Color(0xFF0D202B),
                                disabledBackgroundColor: const Color(
                                  0xFF887653,
                                ),
                                disabledForegroundColor: const Color(
                                  0xFFF6F0E7,
                                ),
                                padding: const EdgeInsets.all(18),
                              ),
                              child: const Text(
                                'وزّع قبل ما يزعلوا',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
