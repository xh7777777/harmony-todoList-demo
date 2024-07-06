import router from '@ohos.router'
import CategoryCardList from '../Components/CategoryCardList';
import { EditViewParams } from '../viewModel/TodoListEditModel';

@Entry
@Component
export default struct EditPage {
  private params: EditViewParams = router.getParams() as EditViewParams
  @State curName: string = '';
  @State curTag: string = '';

  onPageShow(): void {
    console.log('params', JSON.stringify(this.params))

  }

  @Builder
  inputRow(placeholder: string) {
    TextInput({ placeholder })
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