# ImageRating

A simple and configurable rating view.

StarRating will display a sequence of images from 0-maxImages in half or whole increments simply by tapping the view. The simplest way to display the view is as follows:

```
import ImageRating
import SwiftUI

struct ContentView: View {
    
    @State private var value = 3.5
    
    var body: some View {
        ImageRatingView(value: $value)
            .id(value)
    }
}
```
The following parameters can be added to the view call to further customize its appearance.

- **fontSize**          (defaults to 17.0)

- **displayOnly**       (defaults to false, true disables the on tap gesture that allows you to change the rating)

- **maxImages**         (defaults to 5)

- **fullImageName**     (defaults to star.fill)

- **fullColor**         (defaults to gold)

- **allowHalf**         (defaults to true, false will ignore the decimal part of a rating)

- **halfImageName**     (defaults to star.lefthalf.fill

- **showEmpty**         (defaults to true, false will hide empty stars)

- **emptyImageName**    (defaults to star)

- **emptyColor**        (defaults to lightGray)



Its easy to make this into a "favorites picker" as well.

```
import StarRating
import SwiftUI

struct ContentView: View {
    
    @State private var value = 0.0
    
    var body: some View {
        ImageRatingView(value: $value,
                        maxImages: 1,
                        fullImageName: "heart.fill",
                        fullColor: Color.red,
                        allowHalf: false,
                        emptyImageName: "heart")
            .id(value)
    }
}
```
