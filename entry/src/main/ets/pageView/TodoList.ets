import TodoDetail from './TodoDetail';
import http from '@ohos.net.http';
import TodoListModel from '../viewModel/TodoListModel';
import todoListViewModel from '../viewModel/TodoListViewModel';
import TodoItem from '../Components/TodoItem';
import router from '@ohos.router';
import DeleteDialog from '../Components/DeleteDialog';

const httpRequest = http.createHttp();

@Component
export default struct TodoList {
  @State todoListArr: TodoListModel[] = []
  scroller: Scroller = new Scroller()
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: DeleteDialog({
      cancel: () => {
        this.onCancelDeleteDialog()
      },
      confirm: () => {
      }
    }),
    autoCancel: true,
    alignment: DialogAlignment.Center
  })

  aboutToAppear(): void {
    todoListViewModel.getTodoList().then((res: TodoListModel[]) => {
      this.todoListArr = res;
    })
  }

  handleOpenDeleteDialog(): void {
    if (this.dialogController !== null) {
      this.dialogController.open()
    }
  }

  onCancelDeleteDialog(): void {
    if (this.dialogController !== null) {
      this.dialogController.close()
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center }) {
      Text('todoList')
      // todoList
      Scroll(this.scroller) {
        List() {
          ForEach(this.todoListArr, (item: TodoListModel) => {
            TodoItem({
              name: item.name, tag: item.tag, handleOpenDeleteDialog: this.handleOpenDeleteDialog.bind(this)
            }).margin({
              top: 10,
              left: 20,
              right: 20,
              bottom: 10
            })
          })
        }.width('100%').alignListItem(ListItemAlign.Center).height('50%')
      }
      
      Image($r('app.media.add_circle_24dp_13B716_FILL0_wght400_GRAD0_opsz24'))
        .width(40)
        .height(40)
        .onClick(() => {
          console.log('tiaozhuan')
          router.pushUrl({
            url: 'pages/EditPage'
          })
        })
    }
  }
}