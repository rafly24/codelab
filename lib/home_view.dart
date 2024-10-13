import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'news_detail_page.dart';
import 'news_models.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              Article article = controller.articles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Text(article.description ?? 'No description'),
                leading: article.urlToImage != null
                    ? Image.network(article.urlToImage!, width: 50, height: 50, fit: BoxFit.cover)
                    : Icon(Icons.newspaper),
                onTap: () => Get.to(() => NewsDetailPage(article: article)),
              );
            },
          );
        }
      }),
    );
  }
}