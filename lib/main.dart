import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  // التأكد من تهيئة الإضافات قبل تشغيل التطبيق
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RaqqaApp());
}

class RaqqaApp extends StatelessWidget {
  const RaqqaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الرقة Vercel',
      debugShowCheckedModeBanner: false, // إخفاء علامة التصحيح
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    // إعداد وحدة التحكم في WebView وربطها بالرابط الخاص بك
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // السماح بتشغيل السكربتات
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // يمكن إضافة شريط تحميل هنا
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )
      ..loadRequest(Uri.parse('https://raqqa-v6cd.vercel.app/')); // رابط موقعك
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // استخدام SafeArea لضمان عدم تداخل الموقع مع شريط الحالة أو النوتش
      body: SafeArea(
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
