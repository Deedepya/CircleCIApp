# CircleCIApp

It contains app named 'API app'. This app shows how to navigate between the UIKit screen and the SwiftUI screen, we'll use the UIKit's. It also contains list screen designed with SwiftUI and the api call made with Combine framework

## What does this App contain?
In API app, list of apis are fetched when 'Get Api List' button is clicked. First screen is developed using UIKit and next screen which displays list of apis is designed using Swift UI.

To navigation screen designed with UIKit to screen which is designed with SwiftUI, below code is used.

```
 let swiftUIViewController = UIHostingController(rootView: HomeSwiftUI())
       self.navigationController?.pushViewController(swiftUIViewController, animated: true)
```

Code used used to display list of apis is mentioned below. List view is used to display rows and each row contains vertical stack with three text
views.

```
   List {
          ForEach(searchResults) { apiItem in
              VStack(alignment: .leading) {
                  Text(apiItem.API)
                      .font(.system(size: 20))
                  Text(apiItem.Description)
                      .font(.system(size: 20))
                  Text(apiItem.Link)
                      .font(.system(size: 20))
              }
          }
            }
```

ListView is included inside navigation stack, because we need search bar for the listView and search bar will work for the list view only if its inside
navigation stack.
```
        NavigationStack {
            List {
                ForEach(searchResults) { apiItem in
                    VStack(alignment: .leading) {
                        Text(apiItem.API)
                            .font(.system(size: 20))
                        Text(apiItem.Description)
                            .font(.system(size: 20))
                        Text(apiItem.Link)
                            .font(.system(size: 20))
                    }
                }
            }
            .navigationTitle("API List")
            .navigationBarTitleDisplayMode(.inline)
        }.searchable(text: $searchText)
```
