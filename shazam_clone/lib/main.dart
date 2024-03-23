import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Stack(
          children: [
            TabBarView(
              children: [
                FirstTab(),
                SecondTab(),
                FirstTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    const songs = [
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ibb.co/MRSqtP8/autumnnight.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            SizedBox(width: 16),
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ],
        ),
        title: Column(
          children: [
            Text("라이브러리"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TabPageSelector(
              color: DefaultTabController.of(context).index == 1
                  ? Colors.blue[300]
                  : Colors.grey[400],
              selectedColor: DefaultTabController.of(context).index == 1
                  ? Colors.white
                  : Colors.blue,
              indicatorSize: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ImageIcon(
                    NetworkImage("https://i.ibb.co/hxNbZ8p/shazam.png"),
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Shazam",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("아티스트",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    size: 25,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("회원님을 위한 재생 목록",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("최근 Shazam",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                )),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 5,
                ),
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  var song = songs[index];
                  String imageUrl = song['imageUrl']!;
                  String title = song['title']!;
                  String artist = song['artist']!;

                  index % 2 == 0;

                  return Container(
                    margin: EdgeInsets.only(
                      left: 4,
                      right: 4,
                      bottom: 4,
                      top: 4,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ]),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(artist,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  )),
                              Spacer(),
                              Image.network(
                                "https://i.ibb.co/KG9m5QS/applemusic.png",
                                width: 60,
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.person_rounded,
                color: Colors.white,
              ),
              Text("라이브러리",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                  )),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Icon(
                  Icons.stacked_bar_chart,
                  color: Colors.white,
                ),
                Text("차트",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    )),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 98, 200, 248),
              Color.fromARGB(255, 39, 102, 239)
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 60),
            TabPageSelector(
              color: DefaultTabController.of(context).index == 1
                  ? Colors.blue[300]
                  : Colors.grey[400],
              selectedColor: DefaultTabController.of(context).index == 1
                  ? Colors.white
                  : Colors.blue,
              indicatorSize: 8,
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              "Shazam하려면 탭하세요",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 130, 189, 238),
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  "https://i.ibb.co/hxNbZ8p/shazam.png",
                  color: Colors.white,
                  width: 100,
                  height: 100,
                )),
            SizedBox(height: 70),
            Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 130, 189, 238),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
