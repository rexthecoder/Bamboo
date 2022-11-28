import 'package:bamboo/bamboo.dart';
import 'package:example/example/zeus/home_view.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class Layout extends StatelessWidget {
  const Layout({
    super.key,
    required this.crossAxisCount,
  });

  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return LayoutGrid(
      gridFit: GridFit.expand,
      columnSizes: List.generate(
        Bamboo.value(
          context: context,
          mobile: 1,
          tablet: 2,
          desktop: 3,
          large: 4,
        ),
        (index) => TrackUnitsNumExtension(250).px,
      ),
      rowSizes: List.generate(
        Bamboo.value(
          context: context,
          mobile: 8,
          tablet: 4,
          desktop: 3,
          large: 2,
        ),
        (index) => TrackUnitsNumExtension(295).px,
      ),
      rowGap: 10,
      columnGap: 10,
      children: List.generate(
        8,
        (index) => GridPlacement(
          columnStart: index % crossAxisCount,
          rowStart: index ~/ crossAxisCount,
          child: CollectionCard(
            card: collectionItems[index].image,
          ),
        ),
      ),
    );
  }
}

class CollectionsItem {
  final AssetGenImage image;

  CollectionsItem({
    required this.image,
  });
}

final List<CollectionsItem> collectionItems = [
  CollectionsItem(
    image: Assets.images.ski,
  ),
  CollectionsItem(
    image: Assets.images.sk2,
  ),
  CollectionsItem(
    image: Assets.images.sk3,
  ),
  CollectionsItem(
    image: Assets.images.sk4,
  ),
  CollectionsItem(
    image: Assets.images.sk5,
  ),
  CollectionsItem(
    image: Assets.images.sk6,
  ),
  CollectionsItem(
    image: Assets.images.sk7,
  ),
  CollectionsItem(
    image: Assets.images.ski8,
  ),
];
