import 'package:flutter/material.dart';

void main() => runApp(const XitVirexApp());

const neon = Color(0xFF087CFF);
const bright = Color(0xFF00B7FF);
const panel = Color(0xFF080D18);

class XitVirexApp extends StatelessWidget {
  const XitVirexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XIT VIREX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: neon, brightness: Brightness.dark),
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String duration = 'يوم واحد';
  final keyController = TextEditingController();
  String status = 'أدخل مفتاحك ثم اضغط تفعيل المفتاح';
  final durations = ['ساعة واحدة', 'يوم واحد', 'مدى الحياة'];

  @override
  void dispose() {
    keyController.dispose();
    super.dispose();
  }

  void activate() {
    final key = keyController.text.trim();
    setState(() {
      status = key.isEmpty
          ? 'يرجى إدخال المفتاح أولاً'
          : 'تم استلام المفتاح. يلزم ربط سيرفر التحقق لتأكيد التفعيل.';
    });
  }

  void showInfo(String title, String body) {
    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: panel,
        title: Text(title, textAlign: TextAlign.center),
        content: Text(body, textAlign: TextAlign.center),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('حسناً'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned.fill(child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(center: Alignment(0, -0.45), radius: 1.0,
                    colors: [Color(0xFF061A3B), Colors.black, Colors.black]),
                ),
              )),
              Positioned.fill(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(18, 14, 18, 26),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.settings, color: bright),
                            onPressed: () => showInfo('الإعدادات', 'إعدادات التطبيق ستضاف في النسخة القادمة.'),
                          ),
                          const Spacer(),
                          const Text('XIT VIREX', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 2, color: bright)),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.language, color: bright),
                            onPressed: () => showInfo('اللغة', 'الواجهة الحالية باللغة العربية.'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Container(
                        width: 190, height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [BoxShadow(color: neon.withOpacity(.42), blurRadius: 35)],
                        ),
                        child: Image.asset('assets/dragon_logo.png', fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 8),
                      const Text('XIT VIREX', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w900, letterSpacing: 2, color: bright, shadows: [Shadow(color: neon, blurRadius: 20)])),
                      const Text('PATCH CONTROL CENTER', style: TextStyle(fontSize: 11, letterSpacing: 3, color: Colors.white70)),
                      const SizedBox(height: 22),
                      const Panel(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.verified, color: bright, size: 30),
                            SizedBox(width: 12),
                            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text('مرحباً بك في XIT VIREX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              SizedBox(height: 4),
                              Text('لوحة تحكم ومركز تفعيل', style: TextStyle(color: Colors.white60, fontSize: 12)),
                            ]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Panel(
                        child: Column(
                          children: [
                            const Text('اختر المدة', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                            const SizedBox(height: 12),
                            Row(
                              children: durations.map((d) => Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 4),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(14),
                                    onTap: () => setState(() => duration = d),
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 180),
                                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                                      decoration: BoxDecoration(
                                        color: duration == d ? neon.withOpacity(.25) : const Color(0xFF0A1220),
                                        border: Border.all(color: duration == d ? bright : Colors.blueGrey.shade800, width: duration == d ? 1.7 : 1),
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: duration == d ? [BoxShadow(color: neon.withOpacity(.25), blurRadius: 12)] : [],
                                      ),
                                      child: Column(children: [
                                        Icon(d == 'ساعة واحدة' ? Icons.access_time : d == 'يوم واحد' ? Icons.calendar_month : Icons.all_inclusive,
                                          color: duration == d ? bright : Colors.white70, size: 26),
                                        const SizedBox(height: 8),
                                        Text(d, textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: duration == d ? Colors.white : Colors.white70)),
                                      ]),
                                    ),
                                  ),
                                ),
                              )).toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Panel(
                        child: Column(
                          children: [
                            const Text('مفتاح التفعيل', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                            const SizedBox(height: 12),
                            Row(children: [
                              Expanded(child: TextField(
                                controller: keyController,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'أدخل المفتاح هنا',
                                  filled: true, fillColor: Colors.black,
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: neon)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: neon.withOpacity(.6))),
                                ),
                              )),
                              const SizedBox(width: 8),
                              IconButton.filled(
                                style: IconButton.styleFrom(backgroundColor: const Color(0xFF101D35), foregroundColor: bright),
                                onPressed: () => showInfo('نسخ', 'يمكن إضافة نسخ/لصق مباشر عند تجهيز النسخة النهائية.'),
                                icon: const Icon(Icons.content_paste),
                              ),
                            ]),
                            const SizedBox(height: 12),
                            SizedBox(width: double.infinity, child: FilledButton.icon(
                              style: FilledButton.styleFrom(
                                backgroundColor: neon, padding: const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              ),
                              onPressed: activate,
                              icon: const Icon(Icons.check_circle_outline),
                              label: const Text('تفعيل المفتاح', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            )),
                            const SizedBox(height: 10),
                            Text(status, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white60, fontSize: 12)),
                            const SizedBox(height: 3),
                            Text('المدة المختارة: $duration', style: const TextStyle(color: bright, fontSize: 12)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 3, childAspectRatio: 1.12, crossAxisSpacing: 9, mainAxisSpacing: 9,
                        children: [
                          ActionTile(icon: Icons.notifications, title: 'الإشعارات', onTap: () => showInfo('الإشعارات', 'لا توجد إشعارات حالياً.')),
                          ActionTile(icon: Icons.note_alt, title: 'ملاحظات', onTap: () => showInfo('ملاحظات', 'قسم الملاحظات قيد التجهيز.')),
                          ActionTile(icon: Icons.share, title: 'مشاركة', onTap: () => showInfo('مشاركة التطبيق', 'ميزة مشاركة التطبيق ستضاف لاحقاً.')),
                          ActionTile(icon: Icons.info, title: 'معلومات', onTap: () => showInfo('معلومات', 'XIT VIREX\\nالإصدار 1.0')),
                          ActionTile(icon: Icons.star, title: 'عن التطبيق', onTap: () => showInfo('عن التطبيق', 'XIT VIREX - مركز التحكم.')),
                          ActionTile(icon: Icons.support_agent, title: 'الدعم', onTap: () => showInfo('الدعم الفني', 'أضف رابط أو حساب الدعم عند تجهيز السيرفر.')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text('POWERED BY XIT VIREX', style: TextStyle(letterSpacing: 2, color: Colors.white38, fontSize: 11)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Panel extends StatelessWidget {
  final Widget child;
  const Panel({super.key, required this.child});
  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity, padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: panel.withOpacity(.92), borderRadius: BorderRadius.circular(18),
      border: Border.all(color: neon.withOpacity(.7)),
      boxShadow: [BoxShadow(color: neon.withOpacity(.12), blurRadius: 16)],
    ),
    child: child,
  );
}

class ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  const ActionTile({super.key, required this.icon, required this.title, required this.onTap});
  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(15), onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: panel, borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.blueGrey.shade800),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(icon, color: bright, size: 27),
        const SizedBox(height: 7),
        Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
      ]),
    ),
  );
}
