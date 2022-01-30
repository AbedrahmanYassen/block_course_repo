import 'package:cloud_firestore_test/presentation/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  // i passed the AppRoute object that will manage the routing in all my app
  runApp(HomePage(
    appRoute: AppRouter(),
  ));
}

class HomePage extends StatelessWidget {
  void goToPage() {
    print('Hello World');
  }

  //because it wont change throughout the screen
  //
  final AppRouter appRoute;

  HomePage({required this.appRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Persistence',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomAppBarColor: Colors.blue,
      ),
      onGenerateRoute: appRoute.generateRoute,
    );
  }
}
/*
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database? _database;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24.0)),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Journal Entry',
        child: Icon(Icons.add),
        onPressed: () {
          DatabaseFileRoutines dta = new DatabaseFileRoutines();
          setState(() {
            dta.writeJournals('''
    {
  "journals":[
    {
      "id":"470827",
      "date":"2019-01-13 00:27:10.167177",
      "mood":"Happy",
      "note":"Cannot wait for family night."
    },
    {
      "id":"427836",
      "date":"2019-01-12 19:54:18.786155",
      "mood":"Happy",
      "note":"Great day watching our favorite shows."
    },
    {
      "id":"56",
      "date":"2019-01-12 19:54:18.786155",
      "mood":"Happy",
      "note":"Great day watching our favorite shows."
    },
    {
      "id":"4276354836",
      "date":"2019-01-12 19:54:18.786155",
      "mood":"Happy",
      "note":"Great day watching our favorite shows."
    },
    {
      "id":"4276354836",
      "date":"2019-01-12 19:54:18.786155",
      "mood":"Happy",
      "note":"Great day watching our favorite shows."
    }

  ]
}''');
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: FutureBuilder(
          initialData: [],
          future: _loadJournals(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return !snapshot.hasData
                ? Center(child: CircularProgressIndicator())
                : _buildListViewSeprated(snapshot);
          },
        ),
      ),
    );
  }

  Future<List<Journal?>> _loadJournals() async {
    await DatabaseFileRoutines().readJournals().then((value) {
      _database = DatabaseFileRoutines().databaseFromJson(value);
    });
    return _database!.listOfJournalItems;
  }

  void _addOrEditEntry({bool? add, int? index, Journal? journal}) async {
    JournalEdit _journalEdit = new JournalEdit(action: '', journal: journal);

    _journalEdit = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return EditEntry(
              add: add!, index: index!, journalEdit: _journalEdit!);
        },
      ),
    );
    switch (_journalEdit.action) {
      case 'Save':
        if (add!) {
          setState(() {
            _database!.listOfJournalItems.add(_journalEdit.journal);
          });
        } else {
          setState(() {
            _database!.listOfJournalItems[index!] = _journalEdit.journal;
          });
        }
        DatabaseFileRoutines()
            .writeJournals(DatabaseFileRoutines().databaseToJson(_database!));
        break;
      case 'Cancel':
        break;
      default:
        break;
    }
  }

  Widget _buildListViewSeprated(AsyncSnapshot snapshot) {
    return ListView.separated(
        itemBuilder: (context, indexItemBuilder) {
          return Dismissible(
            key: Key(snapshot.data[indexItemBuilder].id),
            child: ListTile(
              title: Text(snapshot.data[indexItemBuilder].note),
              subtitle: Text(snapshot.data[indexItemBuilder].mood),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: snapshot.data.length);
  }
}

//
// class HeroAnimation extends StatefulWidget {
//   const HeroAnimation({Key? key}) : super(key: key);
//
//   @override
//   _HeroAnimationState createState() => _HeroAnimationState();
// }
//
// class _HeroAnimationState extends State<HeroAnimation> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(right: 100.0, top: 300),
//         child: Center(
//           child: Column(
//             children: [
//               ListTile(
//                 title: Text('tile number'),
//                 leading: Hero(
//                   tag: 'firstHero',
//                   child: CircleAvatar(
//                     child: Icon(Icons.zoom_in_outlined),
//                   ),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return HeroAnimation2();
//                       },
//                     ),
//                   );
//                 },
//                 icon: Icon(
//                   Icons.zoom_out_map_rounded,
//                   color: Colors.blue,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ModellikeList extends StatefulWidget {
  const ModellikeList({Key? key}) : super(key: key);

  @override
  _ModellikeListState createState() => _ModellikeListState();
}

class _ModellikeListState extends State<ModellikeList> {
  List<String> courseName = [];
  @override
  void initState() {
    super.initState();
    courseName
      ..add('programming')
      ..add('digital design')
      ..add('Electrnices')
      ..add('Data structures')
      ..add('Linear algebra')
      ..add('diffrentail equations');
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: blueLikeColor,
        body: Center(
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}

/*
  //
  // SafeArea(
  // child: Center(
  // child: Image.asset(
  // 'assets/images/download.jpg',
  // fit: BoxFit.fill,
  // ),
  // ),
  // ),
  Draggable<Color> _buildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text(
            'Drag Me below to change color',
          ),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange,
    );
  }

  DragTarget<Color> _buildDragTarget() {
    return DragTarget<Color>(
      onAccept: (colorValue) {
        _paintedColor = colorValue;
      },
      builder: (BuildContext context, List<dynamic> acceptedData,
              List<dynamic> rejectedData) =>
          acceptedData.isEmpty
              ? Text(
                  'Drag To and see color change',
                  style: TextStyle(color: _paintedColor),
                )
              : Text(
                  'Painting Color: $acceptedData',
                  style: TextStyle(
                    color: acceptedData[0],
                    fontWeight: FontWeight.bold,
                  ),
                ),
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image(
          image: AssetImage('assets/images/download.jpg'),
        ),
      ),
    );
  }

  _positionedStatusBar(BuildContext context) {}
  void _onScaleStart(ScaleStartDetails details) {}
  void _onScaleUpdate(ScaleUpdateDetails details) {}
  void _onScaleEnd(ScaleEndDetails details) {}
  void _onDoubleTap() {}
  void _onLongPress() {}
}*/

// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Clock(),
//       ),
//     );
//   }
// }
//
// class Clock extends StatefulWidget {
//   @override
//   _ClockState createState() => _ClockState();
// }
//
// class _ClockState extends State<Clock> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: CustomScrollView(
//       slivers: [
//         CustomPaint(
//           size: Size(300, 300),
//           painter: TheClockPainter(0, 0, 12),
//         ),
//       ],
//     ));
//   }
// }
//
// class TheClockPainter extends CustomPainter {
//   int _minutes = 0;
//   int _seceonds = 0;
//   int _hours = 0;
//   static const double LENGTH_OF_THE_HOUTS_HAND = 60;
//   static const double LENGTH_OF_THE_SECEONDS_HAND = 80;
//   TheClockPainter(int seceonds, int minutes, int hours) {
//     this._hours = hours;
//     this._minutes = minutes;
//     this._seceonds = seceonds;
//   }
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = new Paint()..color = Colors.black;
//     canvas.drawCircle(new Offset(size.width / 2, size.height / 2),
//         size.width / 2 - 10, paint);
//     var paintline = new Paint()..color = Colors.white;
//     canvas.drawLine(
//         new Offset(
//             size.width / 2 - 10, size.height / 2 - (size.width / 2 - 40)),
//         new Offset(
//             size.width / 2 - 10, size.height / 2 - (size.width / 2 - 10)),
//         paintline);
//     canvas.drawLine(
//         new Offset(
//             size.width / 2 - 10, size.height / 2 - (size.width / 2 - 300)),
//         new Offset(
//             size.width / 2 - 10, size.height / 2 - (size.width / 2 - 260)),
//         paintline);
//     canvas.drawLine(new Offset(10, size.height / 2),
//         new Offset(40, size.height / 2), paintline);
//     canvas.drawLine(new Offset(size.width - 10, size.height / 2),
//         new Offset(size.width - 40, size.height / 2), paintline);
//     canvas.drawCircle(new Offset(size.width / 2 - 10, size.height / 2), 2,
//         paintline..color = Colors.amber);
//     canvas.drawLine(
//         new Offset(size.width / 2 - 10, size.height / 2),
//         new Offset(size.width / 2 - 10 + (getXDirectionForSeceonds()),
//             size.height / 2 - (getYDirectionForSeceonds())),
//         paintline);
//     var hours = new Paint()
//       ..color = Colors.yellow
//       ..strokeWidth = 3;
//     canvas.drawLine(
//         new Offset(size.width / 2 - 10, size.height / 2),
//         new Offset(size.width / 2 - 10 + (getXDimenetion()),
//             size.height / 2 - (getYDimenetion())),
//         hours);
//   }
//
//   double getXDimenetion() {
//     double hoursTheta = 90 - 0.5 * (60 * this._hours + this._minutes);
//     print(cos(degreesToRads(hoursTheta)));
//     return LENGTH_OF_THE_HOUTS_HAND * cos(degreesToRads(hoursTheta));
//   }
//
//   double getYDimenetion() {
//     double hoursTheta = 90 - 0.5 * (60 * this._hours + this._minutes);
//     print(sin(degreesToRads(hoursTheta)));
//     return LENGTH_OF_THE_HOUTS_HAND * sin(degreesToRads(hoursTheta));
//   }
//
//   double getXDirectionForSeceonds() {
//     double angleOfSeceonds = 90 - 6.0 * this._seceonds;
//     return LENGTH_OF_THE_SECEONDS_HAND * cos(degreesToRads(angleOfSeceonds));
//   }
//
//   double getYDirectionForSeceonds() {
//     double angleOfSeceonds = 90 - 6.0 * this._seceonds;
//     return LENGTH_OF_THE_SECEONDS_HAND * sin(degreesToRads(angleOfSeceonds));
//   }
//
//   num degreesToRads(num deg) {
//     return (deg * pi) / 180.0;
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }
*/
