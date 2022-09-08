
import 'package:flutter/material.dart';
import 'package:mrmprocom/Model/post.dart';
import 'package:mrmprocom/Services/remote_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<dynamic> Onrefresh() async {
    await Future.delayed(Duration(seconds: 1));
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MRM PROCOM"),
      ),
      body: RefreshIndicator(
        onRefresh: Onrefresh,
        child: Visibility(
          visible: isLoaded,
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
          child: ListView.builder(
              itemCount: posts?.length,
              itemBuilder: (context, index) {
                // String al = posts![index].alcohol;
                // double a = double.parse(al);
                return ListTile(
                  title: Text(posts![index].name),
                  subtitle: Text(posts![index].brand),
                  trailing: Text(posts![index].alcohol,
                      style: TextStyle(
                          color: isLoaded ? Colors.green : Colors.red)),
                );
              }),
        ),
      ),
    );
  }
}
