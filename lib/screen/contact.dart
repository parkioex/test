import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_swiftdynamic/data.dart';
import 'package:test_swiftdynamic/screen/detail.dart';
import 'package:test_swiftdynamic/screen/inputcontact.dart';

class contactScreen extends StatefulWidget {
  @override
  State<contactScreen> createState() => _contactScreenState();
}

late String name;
late String province;
late String newdata;

class _contactScreenState extends State<contactScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => inputScreen()),
              );
            },
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text('รายชื่อทั้งหมด'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: ('ทั้งหมด'),
                ),
                Tab(
                  text: ('จังหวัด'),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final data = Provider.of<Datas>(context).data[index];
                      return ListTile(
                        leading: IconButton(
                            icon: Icon(Icons.account_circle),
                            onPressed: () {
                              name = Provider.of<Datas>(context, listen: false)
                                  .data[index]['name']!;
                              province =
                                  Provider.of<Datas>(context, listen: false)
                                      .data[index]['province']!;
                              newdata =
                                  Provider.of<Datas>(context, listen: false)
                                      .data[index]['detail']!;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => detailScreen(
                                          name: name,
                                          detail: province,
                                          data: newdata,
                                        )),
                              );
                            }),
                        title: Text(
                            Provider.of<Datas>(context).data[index]['name']!),
                        subtitle: Text(Provider.of<Datas>(context).data[index]
                            ['province']!),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('คุณต้องการที่จะลบ?'),
                              content: Text(
                                  'คุณต้องการที่จะลบ ${Provider.of<Datas>(context).data[index]['name']} หรือไม่'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      Provider.of<Datas>(context, listen: false)
                                          .deleteItem(data);
                                      Navigator.pop(context);
                                    });
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: Provider.of<Datas>(context).data.length,
                  )),
              Center(
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        final data = Provider.of<Datas>(context).data[index];
                        Provider.of<Datas>(context).sortdata();
                        return ListTile(
                          leading: IconButton(
                              icon: Icon(Icons.account_circle),
                              onPressed: () {
                                name =
                                    Provider.of<Datas>(context, listen: false)
                                        .data[index]['name']!;
                                province =
                                    Provider.of<Datas>(context, listen: false)
                                        .data[index]['province']!;
                                newdata =
                                    Provider.of<Datas>(context, listen: false)
                                        .data[index]['detail']!;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => detailScreen(
                                            name: name,
                                            detail: province,
                                            data: newdata,
                                          )),
                                );
                              }),
                          title: Text(
                              Provider.of<Datas>(context).data[index]['name']!),
                          subtitle: Text(Provider.of<Datas>(context).data[index]
                              ['province']!),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('คุณต้องการที่จะลบ?'),
                                content: Text(
                                    'คุณต้องการที่จะลบ ${Provider.of<Datas>(context).data[index]['name']} หรือไม่'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Provider.of<Datas>(context,
                                                listen: false)
                                            .deleteItem(data);
                                        Navigator.pop(context);
                                      });
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: Provider.of<Datas>(context).data.length,
                    )),
              ),
            ],
          ),
        ));
  }
}
