import { router } from '@kit.ArkUI';
import LoginView from '../pageView/LoginView';
import TodoList from '../pageView/TodoList';


@Entry
@Component
struct Index {
  @State pageTitle: string = '快速入门';
  @State currentIndex: number = 0;
  @Provide('mainPageStack') mainPageStack: NavPathStack = new NavPathStack();
  private tabsController: TabsController = new TabsController();

  @Builder
  PageMap(name: string) {

  }

  @Builder
  tabBarBuilder(title: string, targetIndex: number, selectedIcon: Resource, unselectIcon: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedIcon : unselectIcon)
        .width(24)
        .height(24)
      Text(title)
        .fontFamily('HarmonyHeiTi-Medium')
        .fontSize(10)
        .fontColor(this.currentIndex === targetIndex ? '#0A59F7' : 'rgba(0,0,0,0.60)')
        .textAlign(TextAlign.Center)
        .lineHeight(14)
        .fontWeight(500)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .onClick(() => {
      console.log('1111111111111111111')
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(targetIndex);

    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        TodoList()
      }.tabBar(this.tabBarBuilder('主頁', 0, $r('app.media.ic_01_on'), $r('app.media.ic_01_off')))

      TabContent() {
        LoginView()
      }.tabBar(this.tabBarBuilder('我的', 1, $r('app.media.ic_02_on'), $r('app.media.ic_02_off')))
    }
    .scrollable(false)
    .vertical(false)
    .divider({
      strokeWidth: 0.5,
      color: '#0D182431'
    })
    .backgroundColor('#F1F3F5')
    .padding({ top: 36, bottom: 28 })
  }
}