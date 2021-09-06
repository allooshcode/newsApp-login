abstract class NewsStates {}

class InitStateApp extends NewsStates {
  // final x;
  InitStateApp() {
    print('initail state');
  }
}

class NewsGetBusinessLoading extends NewsStates {
  NewsGetBusinessLoading() {
    print('bussiness loading state');
  }
}

class NewsGetBusinessState extends NewsStates {
  NewsGetBusinessState() {
    print('bussiness succsess state');
  }
}

class NewsGetSearchesState extends NewsStates {}

class NewsGetSearchesStateLoading extends NewsStates {}

class NewsGetSearchesStateError extends NewsStates {}
