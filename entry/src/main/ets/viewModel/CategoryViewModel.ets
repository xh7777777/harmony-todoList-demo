export default class CategoryViewModel {
  static readonly categoryCards: CategoryCardObj = {
    fir: {
      value: '1',
      color: '#fcc',
      icon: $r('app.media.restaurant_24dp_5F6368_FILL0_wght400_GRAD0_opsz24')
    },
    sec: {
      value: '2',
      color: '#abc',
      icon: $r('app.media.nightlife_24dp_5F6368_FILL0_wght400_GRAD0_opsz24')
    },
    thi: {
      value: '3',
      color: '#0f1',
      icon: $r('app.media.nightlife_24dp_5F6368_FILL0_wght400_GRAD0_opsz24')
    },
    fou: {
      value: '4',
      color: '#331122',
      icon: $r('app.media.nightlife_24dp_5F6368_FILL0_wght400_GRAD0_opsz24')
    },
  }
}

export interface CategoryCardItem {
  value: string;
  color: string | Resource;
  icon: string | Resource
}

export interface CategoryCardObj {
  fir: CategoryCardItem
  sec: CategoryCardItem
  thi: CategoryCardItem
  fou: CategoryCardItem
}