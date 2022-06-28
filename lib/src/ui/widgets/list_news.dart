import 'package:flutter/material.dart';

import '../../models/article.dart';

class ListNews extends StatelessWidget {

  final List<Article> news;
  const ListNews({
    Key? key,
    required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: news.length,
      itemBuilder: (context, index) => NewCard(article: news[index], index: index+1)
    );
  }

}


class NewCard extends StatelessWidget {

  final Article article;
  final int index;

  const NewCard({Key? key,
  required this.article,
  required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: double.infinity,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 229, 229),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          PosterArticle(image: article.urlToImage ?? '', indice: index),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(article.title, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 3,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(article.description ?? '',
            style: const TextStyle(overflow: TextOverflow.ellipsis),
            maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}

class PosterArticle extends StatelessWidget {
  const PosterArticle({
    Key? key,
    required this.image,
    required this.indice,
  }) : super(key: key);

  final String image;
  final int indice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
        height: 200,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: image.isEmpty ?
          Image(image: Image.asset('assets/imagenotfound.png').image, fit: BoxFit.cover,)
          : FadeInImage( //FadeInImage es una animacion de imagen
            image: NetworkImage(image =='' ? 'assets/imagenotfound.png' : image),
            placeholder: const AssetImage('assets/loadingskr.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          child: Text(indice.toString()),
        ),
      )
      ],
    );
  }
}