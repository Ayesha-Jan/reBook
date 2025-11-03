import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? book;
  String message = "";

  @override
  void initState() {
    super.initState();
    loadBook();
  }

  void loadBook() async {
    final data = await ApiService.getBook();
    setState(() => book = data["book"]);
  }

  void sendRequest() async {
    final res = await ApiService.sendExchangeRequest("Bob");
    setState(() => message = res["message"]);
  }

  void acceptRequest() async {
    final res = await ApiService.acceptExchange();
    setState(() => message = res["message"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ReBook")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (book != null) ...[
              Text("📖 ${book!['title']}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Author: ${book!['author']}"),
              Text("Owner: ${book!['owner']}"),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: sendRequest, child: const Text("Send Request")),
              const SizedBox(height: 10),
              ElevatedButton(onPressed: acceptRequest, child: const Text("Accept Request")),
            ] else
              const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 20),
            Text(message, style: const TextStyle(color: Colors.green)),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const ProfilePage()));
                },
                child: const Text("Go to Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
