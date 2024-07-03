import { router } from '@kit.ArkUI'

@Entry
@Component
struct Second {
  build() {
    Column() {
      Text('abc')
      Button('返回').onClick(() => {
        router.back()
      })
    }
  }
}