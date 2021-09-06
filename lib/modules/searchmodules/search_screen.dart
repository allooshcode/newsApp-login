import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsapp/cubit/news_app/newsappcubit.dart';
import 'package:newsapp/cubit/news_app/newsappstetes.dart';
import 'package:newsapp/shared/component/components.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsAppCubit.get(context).searchResults = [];
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blueAccent),
        backwardsCompatibility: true,
        backgroundColor: Colors.white,
        elevation: 0,
        // automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextFormField(
              decoration: InputDecoration(
                // icon: Icon(Icons.search),
                enabled: true,
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                NewsAppCubit.get(context).search(value);
              },
            ),
          ),
          BlocConsumer<NewsAppCubit, NewsStates>(listener: (context, state) {
            if (state is NewsGetSearchesStateLoading)
              Fluttertoast.showToast(
                  msg: "loading now..",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.TOP,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.blue,
                  textColor: Colors.white,
                  // webPosition: 'top',
                  fontSize: 16.0);
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text('alaa'),
            // ));
          }, builder: (context, state) {
            NewsAppCubit cubit = NewsAppCubit.get(context);
            // if (state is NewsGetSearchesStateLoading)
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            return Expanded(
              child: ListView.builder(
                  itemCount: cubit.searchResults.length,
                  itemBuilder: (context, index) => ItemofNews(
                      cubit.searchResults[index]['urlToImage'],
                      cubit.searchResults[index]['title'],
                      cubit.searchResults[index]['publishedAt'],
                      context: context,
                      url: cubit.searchResults[index]['url'])),
            );
          }),
        ],
      ),
    );
  }
}
