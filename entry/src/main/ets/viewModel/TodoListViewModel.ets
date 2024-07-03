import { apiList, httpInfo } from '../common/Constants';
import { requestGet } from '../common/HttpUtil';
import { Daum } from './StrapiResponse';
import TodoListModel from './TodoListModel';

class TodoListViewModel {
  async getTodoList(): Promise<TodoListModel[]> {
    let url = httpInfo.baseUrl + apiList.todoList;
    let res = await requestGet(url);
    res = JSON.parse(`${res}`);
    try {
      const resMap = res.data.map<TodoListModel>((value: Daum) => {
        return {
          id: Number(value.id),
          name: value.attributes.name,
          createdAt: value.attributes.createdAt,
          updatedAt: value.attributes.updatedAt,
          status: value.attributes.status,
          content: value.attributes.content,
          tag: value.attributes.tag
        }
      })
      return resMap;
    } catch (e) {
      console.log(e)
      return []
    }
  }
}

const todoListViewModel = new TodoListViewModel()

export default todoListViewModel