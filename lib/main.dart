import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Flex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clickedIndex = 0;
  final List<String> _demoImages = [
    'https://pop.h-cdn.co/assets/15/23/1024x512/landscape-1433360107-nasa-spacesuit.jpg',
    'https://img.freepik.com/premium-photo/astronaut-space-suit-with-planet-him_662214-91984.jpg',
    'https://i.pinimg.com/originals/c6/4c/72/c64c728a70cb8082dd29f3332d33c885.jpg',
    'https://png.pngtree.com/background/20231016/original/pngtree-reflective-astronaut-helmet-mirrors-stars-and-galaxies-in-space-exploration-3d-picture-image_5577065.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEEEA),
      body: SizedBox(
        height: 380.0,
        child: ListView.builder(
          itemCount: _demoImages.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _clickedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: _clickedIndex == index ? 500.0 : 80.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ]),
                margin: const EdgeInsets.all(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        _demoImages[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (_clickedIndex == index)
                      Positioned(
                        bottom: 10.0,
                        left: 10.0,
                        child: Container(
                          height: 40,
                          width: 30,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.3),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (_clickedIndex == index)
                      Positioned(
                        bottom: 30.0,
                        left: 50.0,
                        child: Text(
                          'New Technologies'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    if (_clickedIndex == index)
                      const Positioned(
                        bottom: 10.0,
                        left: 50.0,
                        child: Text(
                          'lorem ipsum dolor sit amet',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
