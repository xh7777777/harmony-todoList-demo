import CategoryViewModel, { CategoryCardItem } from '../viewModel/CategoryViewModel';

@Component
export default struct CategoryCardList {
  private categoryObj = CategoryViewModel.categoryCards

  @Builder
  CategoryCard(item: CategoryCardItem) {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      Image(item.icon).width(50).height(50)
    }
    .height(200)
    .width(120)
    .backgroundColor(item.color)
    .borderRadius(20)
    .shadow({
      radius: 15,
      color: '#ccc',
      offsetX: 10,
      offsetY: 10,
      type: ShadowType.COLOR,
    })
  }

  build() {
    Grid() {
      ForEach(Object.entries(this.categoryObj), (item: [string, CategoryCardItem]) => {
        GridItem() {
          this.CategoryCard(item[1])
        }
      }, (item: [string, CategoryCardItem]) => item[0])
    }
    .rowsTemplate('1fr')
    .columnsGap(18)
    .scrollBar(BarState.Off)
    .height(200)
    .padding({
      left: 16, right: 16
    })
  }
}