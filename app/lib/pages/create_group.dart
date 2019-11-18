import 'package:app/assets/animations/btn_animation.dart';
import 'package:app/assets/models/user.dart';
import 'package:app/config/size_config.dart';
import 'package:app/models/person.dart';
import 'package:app/services/graphql_conf.dart';
import 'package:app/services/query.dart';
import 'package:flare_dart/math/mat2d.dart';
import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/input.dart';
import 'package:app/widgets/user_item.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flare_flutter/flare_actor.dart';

class CreateGroupPage extends StatefulWidget {
  @override
  _CreateGroupPageState createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> with TickerProviderStateMixin {
  final VoidCallback onSubmit;
  static final TextEditingController _groupname = new TextEditingController();
  static final TextEditingController _description = new TextEditingController();

  _CreateGroupPageState({this.onSubmit});

  String get groupname => _groupname.text;
  String get description => _description.text;

  ScrollController _scroll;
  GlobalKey _containerKey = GlobalKey();
  GlobalKey _inputKey = GlobalKey();

  int counter = 0;
  double opacity = 1;
  bool hideTop = false;
  ValueNotifier isOpen = ValueNotifier(false);
  ValueNotifier reset = ValueNotifier(false);

  Animation imageAnimation, titleAnimation, textAnimation, inputOneAnimation, inputTwoAnimation, listAnimation;
  AnimationController animationController;

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  List<Person> persons = List<Person>();

  void query() async {
    MyQuery query = MyQuery();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: query.getPersons(),
      ),
    );
    if (!result.hasErrors) {
      for (var i = 0; i < result.data['persons'].edges.length; i++) {
        setState(() {
          persons.add(
            Person(
              id: result.data['persons'].edges[i].node['id'],
              phone: result.data['persons'].edges[i].node['phone'],
            ),
          );
        });
      }
    }
    print('persons');
    print(persons);
  }

  @override
  void initState() {
    super.initState();

    query();

    _scroll = ScrollController();
    _scroll.addListener(_scrollListener);

    animationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    imageAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.0, 0.56, curve: Curves.easeIn),
    ));
    titleAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0, 0.48, curve: Curves.easeOut),
    ));
    textAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.12, 0.62, curve: Curves.easeOut),
    ));
    inputOneAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.32, 0.72, curve: Curves.easeOut),
    ));
    inputTwoAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.38, 0.78, curve: Curves.easeOut),
    ));
    listAnimation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Interval(0.60, 1.0, curve: Curves.easeOut),
    ));
    animationController.forward();
    Future.delayed(Duration(milliseconds: 2000), () {
      animationController.dispose();
    });
  }

  _scrollListener() {
    if (_containerKey.currentContext != null) {
      final RenderBox containerRenderBox = _containerKey.currentContext.findRenderObject();
      final containerSize = containerRenderBox.size;

      final RenderBox inputRenderBox = _inputKey.currentContext.findRenderObject();
      final inputSize = inputRenderBox.size;

      double opacityTrigger = _scroll.offset.clamp(containerSize.height - inputSize.height, containerSize.height);

      setState(() {
        opacity = _interpolate(input: [containerSize.height - inputSize.height, containerSize.height], output: [1, 0], x: opacityTrigger).clamp(0.0, 1.0);
        hideTop = _scroll.offset >= (containerSize.height + MediaQuery.of(context).viewPadding.top / 2.5);
      });
    }
  }

  Map<String, List<User>> map = {
    'A': [
      User(name: 'Aaron Singleton', job: 'Business Analyst'),
      User(name: 'Abigall Flores', job: 'HR Specialist'),
    ],
    'B': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'C': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'D': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'E': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'F': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'G': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'H': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'I': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
    'J': [
      User(name: 'Bennett Reed', job: 'Recruiter'),
      User(name: 'Beth Shaw', job: 'Software Engineer'),
    ],
  };

  double _interpolate({input, output, x}) {
    double a = (output[1] - output[0]) / (input[1] - input[0]);
    double b = -1 * (a * input[0] - output[0]);
    return a * x + b;
  }

  _onSelect(selected) {
    setState(() {
      if (selected)
        counter += 1;
      else
        counter -= 1;

      isOpen.value = counter > 0;
    });
    isOpen.notifyListeners();
  }

  List<Widget> _generaterUserList() {
    SizeConfig().init(context);
    List<Widget> widgets = new List();
    map.forEach((letter, users) {
      widgets.add(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12.5),
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: Color(0xFFFFDA1A),
                borderRadius: BorderRadius.all(
                  Radius.circular(25 / 3),
                ),
              ),
              child: Center(
                child: Text(
                  letter,
                  style: TextStyle(
                    color: Color(0xFF424D5C),
                    fontFamily: 'Verdana',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          ...users.map((user) {
            return UserItem(
                user: user,
                onSelect: _onSelect,
                reset: reset,
                onReset: () {
                  setState(() {
                    reset.value = false;
                  });
                });
          }).toList()
        ],
      ));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: null,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              child: ListView(
                controller: _scroll,
                padding: EdgeInsets.only(top: 0, left: 0, right: 0, bottom: SizeConfig.blockSizeVertical * 10),
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0, MediaQuery.of(context).viewPadding.top / 4 * 3),
                    child: Column(
                      key: _containerKey,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: imageAnimation,
                          builder: (_, child) {
                            return Transform.translate(offset: Offset(0, (1 - imageAnimation.value) * 5), child: child);
                          },
                          child: FadeTransition(
                            opacity: imageAnimation,
                            child: Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: <Widget>[
                                  Container(
                                    width: SizeConfig.blockSizeVertical * 30,
                                    height: SizeConfig.blockSizeVertical * 30,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: SizeConfig.blockSizeVertical * 17.5,
                                          height: SizeConfig.blockSizeVertical * 17.5,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF8F8FA),
                                            borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeVertical * 17.5 / 3)),
                                          ),
                                        ),
                                        Container(
                                          width: SizeConfig.blockSizeVertical * 12.5,
                                          height: SizeConfig.blockSizeVertical * 12.5,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage('lib/assets/images/group.png'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: imageAnimation,
                          builder: (_, child) {
                            return Transform.translate(offset: Offset(0, (1 - titleAnimation.value) * 15), child: child);
                          },
                          child: FadeTransition(
                            opacity: titleAnimation,
                            child: Text(
                              'Create group',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Verdana',
                                fontSize: 18,
                                color: Color(0xFF424D5C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: imageAnimation,
                          builder: (_, child) {
                            return Transform.translate(offset: Offset(0, (1 - textAnimation.value) * 20), child: child);
                          },
                          child: FadeTransition(
                            opacity: textAnimation,
                            child: Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockSizeVertical * 1,
                                bottom: SizeConfig.blockSizeVertical * 2,
                              ),
                              child: Text(
                                'Add group name, description\nand add some persons.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Verdana',
                                  height: 1.5,
                                  fontSize: 14,
                                  color: Color(0xFF9FA7B2),
                                ),
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: imageAnimation,
                          builder: (_, child) {
                            return Transform.translate(offset: Offset(0, (1 - inputOneAnimation.value) * 25), child: child);
                          },
                          child: FadeTransition(
                            opacity: inputOneAnimation,
                            child: Input(
                              label: 'Group name...',
                              controller: _groupname,
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                          animation: imageAnimation,
                          builder: (_, child) {
                            return Transform.translate(offset: Offset(0, (1 - inputTwoAnimation.value) * 30), child: child);
                          },
                          child: FadeTransition(
                            opacity: inputTwoAnimation,
                            child: Opacity(
                              key: _inputKey,
                              opacity: opacity,
                              child: Input(
                                label: 'Description...',
                                controller: _description,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  FadeTransition(
                    opacity: listAnimation,
                    child: StickyHeaderBuilder(
                      builder: (c, s) {
                        s = s.clamp(0.0, 1.0);

                        return Container(
                          height: SizeConfig.blockSizeVertical * 5,
                          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top - 1.0),
                          padding: EdgeInsets.only(left: 25, right: 25),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: hideTop ? Color(0xFFF3F3F3) : Colors.transparent,
                                offset: new Offset(0.0, 1.0),
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'MEMBERS SELECTED',
                                style: TextStyle(
                                  color: Color(0xFF9FA7B2),
                                  fontFamily: 'Verdana',
                                  fontSize: 11,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeVertical * 1),
                                width: SizeConfig.blockSizeVertical * 2,
                                height: SizeConfig.blockSizeVertical * 2,
                                decoration: BoxDecoration(color: Color(0xFFFFDA1A), borderRadius: BorderRadius.all(Radius.circular(SizeConfig.blockSizeVertical * 2 / 3))),
                                child: Center(
                                  child: Text(
                                    counter.toString(),
                                    style: TextStyle(
                                      color: Color(0xFF424D5C),
                                      fontFamily: 'Verdana',
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      content: Container(
                        padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 0.75, bottom: SizeConfig.blockSizeVertical * 0.75),
                        child: Column(
                          children: _generaterUserList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).viewPadding.top,
              color: hideTop ? Colors.white : Colors.transparent,
            ),
            Positioned(
              bottom: 0,
              child: IgnorePointer(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: SizeConfig.blockSizeVertical * 10,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.5), Colors.white.withOpacity(0)],
                      stops: [0, 0.75, 1],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).viewPadding.bottom,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: BtnAnimation(
                        isOpen: isOpen,
                        callback: () {
                          setState(() {
                            isOpen.value = !isOpen.value;
                            counter = 0;
                            reset.value = false;
                          });
                          isOpen.notifyListeners();
                          reset.notifyListeners();
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
