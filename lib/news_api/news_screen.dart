import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_new_design/news_api/new_news_screen.dart';
import 'package:whatsapp_new_design/news_api/news_bloc.dart';
import 'package:whatsapp_new_design/news_api/news_detailed_screen.dart';
 // Import the NewsDetailScreen

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    newsBloc.add(NewsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
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
          leadingWidth: 10,
          title: Padding(
            padding: EdgeInsets.only(top: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "News Page",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 3),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => NewNews(),
              ),
            );
          //newsBloc.add(NewsAddEvent());
        },
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        bloc: newsBloc,
        listenWhen: (previous, current) => current is NewsActionState,
        buildWhen: (previous, current) => current is! NewsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case NewsFetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NewsFetchingSuccessfulState:
              final successState = state as NewsFetchingSuccessfulState;
              return ListView.builder(
                itemCount: successState.news.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(
                            //serialNumber: index + 1,
                            title: successState.news[index].title,
                            body: successState.news[index].body, 
                            id: index+1,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${index + 1}. ${successState.news[index].title}'),
                        ],
                      ),
                    ),
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
