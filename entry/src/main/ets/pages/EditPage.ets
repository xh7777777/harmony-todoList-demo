import router from '@ohos.router'
import CategoryCardList from '../Components/CategoryCardList';
import { EditViewParams } from '../viewModel/TodoListEditModel';

@Entry
@Component
export default struct EditPage {
  @State curName: string = '';
  @State curTag: string = '';
  @State curId: string = '';

  onPageShow(): void {
    const params: EditViewParams = router.getParams() as EditViewParams
    if (params) {
      this.curName = params.name
    }
  }

  @Builder
  inputRow(placeholder: string) {
    TextInput({ placeholder, text: this.curName })
      .backgroundColor(Color.White)
      .borderWidth({ bottom: 1 })
      .borderRadius(0)
      .borderColor('#ccc')
      .placeholderColor('#CCC')

  }

  build() {
    Column() {
      Button('back').onClick(() => {
        router.back()
      })
      Column({ space: 30 }) {
        this.inputRow('任务名称')
        this.inputRow('选择日期')
        this.inputRow('任务时间')
        Text('选择分类').fontSize(18).alignSelf(ItemAlign.Start)
        CategoryCardList()
      }.padding({
        top: 40,
        left: 30,
        right: 30
      })

    }
  }
}