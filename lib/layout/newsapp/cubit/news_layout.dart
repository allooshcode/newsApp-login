import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/newsappcubit.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/cubit/newsappstetes.dart';
import 'package:newsapp/modules/searchmodules/search_screen.dart';
import 'package:newsapp/shared/component/components.dart';

class NewsAppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          )
        ],
      ),
      body: BlocConsumer<NewsAppCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsAppCubit cubit = NewsAppCubit.get(context);

          if (state is NewsGetBusinessLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => ItemofNews(
                  cubit.business[index]['urlToImage'],
                  cubit.business[index]['title'],
                  cubit.business[index]['publishedAt'],
                  context: context,
                  url: cubit.business[index]['url']),
              separatorBuilder: (context, index) => Divider(),
              itemCount: cubit.business.length);
        },
      ),
    );
  }
}
