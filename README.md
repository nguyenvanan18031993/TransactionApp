# transaction_app

This is a demo project introducing an approach to structure large scale mobile applications in Flutter build on top of REDUX state management combined with MVVM (Model View ViewModel) software architecture pattern. This demo is an asignment of BPC Company.

## Documentation

### Straight into code!

#### Environment

In the flutter projects `pubspec.yaml` file and add the following dependencies.

```
environment:
  sdk: '>=2.2.2 <3.0.0'
dependencies:
  flutter:
    sdk: flutter
  flutter_redux: ^0.5.2
  redux_persist: ^0.8.2
  redux_persist_flutter: ^0.8.2
  flutter_redux_dev_tools: ^0.3.0
  validators: ^2.0.0+1
  json_serializable: ^3.2.3
  build_runner: ^1.7.2
  json_annotation: ^3.0.0
  http: ^0.12.0+2
```

#### Project structure

```
/lib
--/assets
  --/mocks
  --/fonts
--/components   #General use components (e.g. AppHeader, AppFooter)
--/config       #General app config files
--/features
   ../feature-1
   ../feature-2
--/models        #Data clases
--/store         #Contains the redux store & setup.
  --/actions
  --/reducers
  --/models      # redux related models, used to mange data inside the store.
  --/view_models
--/template      #Used for styling and UI related data.
--/utils         #To store helper functions/utils (e.g. dateUtils)
```
