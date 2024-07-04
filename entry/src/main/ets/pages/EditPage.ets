import router from '@ohos.router'
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

  build() {
    Column() {
      Button('back').onClick(() => {
        router.back()
      })
      TextInput()
    }
  }
}