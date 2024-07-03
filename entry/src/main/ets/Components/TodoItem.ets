@Component
export default struct TodoItem {
  @Prop name: string;
  @Prop tag: string;

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Text()
        .width(20)
        .height(20)
        .borderRadius(50)
        .backgroundColor('#fcc')
        .margin({ right: 20 })
      Text(this.name)
    }.padding(20).borderRadius(15).shadow({
      radius: 10,
      color: '#ccc',
      type: ShadowType.COLOR,
    })
  }
}