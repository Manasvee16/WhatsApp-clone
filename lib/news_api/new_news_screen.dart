
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_new_design/news_api/news_bloc.dart';
import 'package:whatsapp_new_design/news_api/news_data_ui_model.dart';

class NewNews extends StatefulWidget {
  const NewNews({super.key});
  @override
  State<NewNews> createState() => _NewsState();
}
class _NewsState extends State<NewNews> {
  final NewsBloc newsBloc=NewsBloc();
  @override
  void initState() {
    super.initState();
  }
  late final NewsDataUiModel newsDataUiModel;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
return MultiBlocProvider(
  providers: [
    BlocProvider<NewsBloc>(create: (context) => NewsBloc()),
  ],
  child: BlocConsumer<NewsBloc, NewsState>(
    bloc: newsBloc,
        listener: (context, state) {
          if (state is NewNewsNavigateToScreenActionState) {
            Navigator.pop(context);
          }
          else if (state is NewsSavedActionState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('News Saved')),
            );
          }
        },
          builder: (context, state) {
              if (state is LoadingNewsState) {
            //print('loading');
            return Scaffold(
            body: Center(
            child: CircularProgressIndicator(),));
          } 
          else if (state is FailureNewsState) {
            //print('error');
            return Scaffold(
              body: Center(
              child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewNews(),
                                ),
                              );
                            },
                            child: Text(
                              "Failed to add news",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
            ));
          }
          else{
            return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: AppBar(
                elevation: 0,
                leading: Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                title: Text("New news"),
              )),
          body: Column(
            children: [
            Column(
              children: [
              Row(
                children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                ),
                Expanded(
                  child: TextField(
                    controller: titleController,
                    decoration: InputDecoration(labelText: "title"),
                  ),
                ),
              ]),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: bodyController,
                      decoration: InputDecoration(labelText: "body"),
                    ),
                  ),
                ],
              ),
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 5),
                ),
                Expanded(
                  child: TextField(
                    controller: idController,
                    decoration: InputDecoration(labelText: "id"),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  String title=titleController.text;
                  String body=bodyController.text;
                  String id=idController.text;
                  newsBloc.add(NewsAddEvent(title: title, body: body, userId: id));
                  final snackBar = SnackBar(
            content: const Text('News added'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(context);
                },
                child: Container(
                    child: Text("Save"),
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFD8FDD2)),
              )
            ])]));
          }
          }
          ),
);
  }
}