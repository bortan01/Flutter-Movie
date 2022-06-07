import 'package:flutter/material.dart';
import 'package:flutter_movie/src/widget/casting_cads.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? '';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const CastingCads()
            ],
          )),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
           padding: const EdgeInsets.only(bottom: 20),
            width: double.infinity,
            color: Colors.black12,
            alignment: Alignment.bottomCenter,
            child: const Text(
              "movie rile",
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/200x300')),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                fit: BoxFit.fill,
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
                width: 120,
              )),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie.title",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "original tile",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outline_outlined,
                      size: 20, color: Colors.amber),
                  const SizedBox(width: 5),
                  Text(
                    "movie.vote",
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child:  Text(
          'Non in elit voluptate voluptate est sit irure. Ex ullamco excepteur eu quis do do non irure magna sit eu nisi. Nostrud id et magna magna eiusmod culpa Lorem quis incididunt. Qui eiusmod deserunt enim incididunt sunt est non irure tempor occaecat sunt. Culpa amet dolor fugiat ea proident minim. Ut cupidatat reprehenderit magna sint consectetur pariatur aliquip qui incididunt eu consectetur adipisicing veniam consectetur.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.subtitle1,
          
          ),
    );
  }
}
