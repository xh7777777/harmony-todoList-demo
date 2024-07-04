import router from '@ohos.router';

@Component
export default struct TodoItem {
  @Prop name: string;
  @Prop tag: string;
  handleOpenDeleteDialog: () => void = () => {
  }

  @Builder
  IconBuilder(r: Resource, clickEvent: () => void) {
    Image(r).width(20).height(20).onClick(clickEvent);
  }

  build() {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Text()
        .width(20)
        .height(20)
        .borderRadius(50)
        .backgroundColor('#fcc')
        .margin({ right: 30 })
      Text(this.name).width('80%').fontSize(20)
        .fontWeight(FontWeight.Bold)
      Column({ space: 10 }) {
        this.IconBuilder($r('app.media.edit_24dp_FILL0_wght400_GRAD0_opsz24'), () => {
          router.pushUrl({ url: 'pages/EditPage', params: { tag: this.tag, name: this.name } })
        })
        this.IconBuilder($r('app.media.delete_24dp_FILL0_wght400_GRAD0_opsz24'), this.handleOpenDeleteDialog)
      }
    }.padding({
      top: 10,
      bottom: 10,
      left: 20,
      right: 20
    }).borderRadius(15).shadow({
      radius: 10,
      color: '#ccc',
      type: ShadowType.COLOR,
    })
  }
}