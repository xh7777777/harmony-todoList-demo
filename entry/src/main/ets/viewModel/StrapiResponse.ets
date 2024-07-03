export default class StrapiResponse {
  data: Daum[];
  meta: Meta;

  constructor() {
    this.data = [];
    this.meta = {
      pagination: {
        page: 0,
        pageSize: 0,
        pageCount: 0,
        total: 0
      }
    }
  }
}

export interface Daum {
  id: number
  attributes: Attributes
}

export interface Attributes {
  name: string
  tag: string;
  content: string
  createdAt: string
  updatedAt: string
  publishedAt: string
  status: string
}

export interface Meta {
  pagination: Pagination
}

export interface Pagination {
  page: number
  pageSize: number
  pageCount: number
  total: number
}
