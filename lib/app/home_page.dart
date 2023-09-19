import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;
  bool circularTime = true;
  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() {
        setState(() {
          circularTime = !circularTime;
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .5,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cliente.png'),
                  fit: BoxFit.contain),
            ),
          ),
          Visibility(
            visible: circularTime,
            child: CircularProgressIndicator(
              value: controller.value,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Obrigado pela parceira e confiança',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
