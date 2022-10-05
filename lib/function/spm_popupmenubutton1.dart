import 'package:flutter/material.dart';

class SPMPopupMenuButton1 extends StatefulWidget {
  const SPMPopupMenuButton1({Key? key}) : super(key: key);

  @override
  State<SPMPopupMenuButton1> createState() => _SPMPopupMenuButton1State();
}

enum Menu { online, offline, away }

class _SPMPopupMenuButton1State extends State<SPMPopupMenuButton1> {
  String selectedItem = 'online';

  // List<String> listItem = Menu.values.map((e) => e.name).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(children: [
          Container(
            width: 85,
            height: 25,
            decoration: BoxDecoration(
              color: const Color(0xffEBEBEB),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                status(),
                Text(selectedItem),
                // PopupMenuButton<Menu>(
                //     padding: EdgeInsets.all(0),
                //     icon: const Icon(Icons.keyboard_arrow_down),
                //     onSelected: (Menu item) {
                //       setState(() {
                //         selectedItem = item.name;
                //       });
                //     },
                //     itemBuilder: (BuildContext context) =>
                //         <PopupMenuEntry<Menu>>[
                //           const PopupMenuItem(
                //             value: Menu.online,
                //             child: ListTile(
                //               leading: Icon(
                //                 Icons.circle,
                //                 color: Colors.green,
                //               ),
                //               title: Text('online'),
                //             ),
                //           ),
                //           const PopupMenuItem(
                //             value: Menu.offline,
                //             child: ListTile(
                //               leading: Icon(
                //                 Icons.circle,
                //                 color: Colors.red,
                //               ),
                //               title: Text('offline'),
                //             ),
                //           ),
                //           const PopupMenuItem(
                //             value: Menu.away,
                //             child: ListTile(
                //               leading: Icon(
                //                 Icons.watch_later,
                //                 color: Colors.yellow,
                //               ),
                //               title: Text('away'),
                //             ),
                //           ),
                //         ]),
              ],
            ),
          ),
          SizedBox(
            width: 85,
            height: 25,
            child: PopupMenuButton<Menu>(
                icon: Container(),
                onSelected: (Menu item) {
                  setState(() {
                    selectedItem = item.name;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem(
                        value: Menu.online,
                        child: ListTile(
                          leading: Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 18,
                          ),
                          title: Text('online'),
                        ),
                      ),
                      const PopupMenuItem(
                        value: Menu.offline,
                        child: ListTile(
                          leading: Icon(
                            Icons.circle,
                            color: Colors.red,
                            size: 18,
                          ),
                          title: Text('offline'),
                        ),
                      ),
                      const PopupMenuItem(
                        value: Menu.away,
                        child: ListTile(
                          leading: Icon(
                            Icons.watch_later,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          title: Text('away'),
                        ),
                      ),
                    ]),
          )
        ]),
      ),
    );
  }

  Widget status() {
    if (selectedItem == 'online') {
      return const Icon(
        Icons.circle,
        color: Colors.green,
      );
    } else if (selectedItem == 'offline') {
      return const Icon(
        Icons.circle,
        color: Colors.red,
      );
    } else {
      return const Icon(
        Icons.watch_later,
        color: Colors.yellow,
      );
    }
  }
}
