import { http } from '@kit.NetworkKit';
import StrapiResponse from '../viewModel/StrapiResponse';

export function requestGet(url: string): Promise<StrapiResponse> {
  const httpRequest = http.createHttp();
  const params: http.HttpRequestOptions = {
    method: http.RequestMethod.GET,
    readTimeout: 60000,
    header: {
      'Content-Type': 'application/json'
    },
    connectTimeout: 60000,
    extraData: {}
  }

  return httpRequest.request(url, params).then((value: http.HttpResponse) => {
    const res = JSON.stringify(value.result)
    let resultJSON: StrapiResponse = JSON.parse(res);
    return resultJSON;
  }).catch((reason: 'string') => {
    console.log('error reason', reason)
    return new StrapiResponse()
  })
}
