import TodoDetail from './TodoDetail';
import http from '@ohos.net.http';
import TodoListModel from '../viewModel/TodoListModel';
import todoListViewModel from '../viewModel/TodoListViewModel';
import TodoItem from '../Components/TodoItem';

const httpRequest = http.createHttp();

@Component
export default struct TodoList {
  @State todoListArr: TodoListModel[] = []
  @Provide('todoListPageStack') todoListPageStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'TodoDetail') {
      TodoDetail()
    }
  }

  @Builder
  NavBarItem(order: string, title: string) {
    Row() {
      Text(title)
    }.onClick(() => {
      const index = Number(order) - 1;
      this.todoListPageStack.pushPathByName('TodoDetail', index)
    })
  }

  aboutToAppear(): void {
    todoListViewModel.getTodoList().then((res: TodoListModel[]) => {
      console.log('abcdefg123', res);
      this.todoListArr = res;
    })
  }

  build() {
    Column() {
      Navigation(this.todoListPageStack) {
        Text('todoList')
        // todoList
        List() {
          ForEach(this.todoListArr, (item: TodoListModel) => {
            TodoItem({ name: item.name, tag: item.tag }).margin({
              top: 10,
              left: 20,
              right: 20,
              bottom: 10
            })
          })
        }.width('100%').alignListItem(ListItemAlign.Center)

      }.titleMode(NavigationTitleMode.Full)
      .navDestination(this.PageMap)
    }
  }
}