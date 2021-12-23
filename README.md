# StarRating

A simple and configurable star rating view.

StarRating will display a star rating from 0-maxRating in half star or whole star increments simply by tapping the view. The simplest way to display the view is as follows:

```
import StarRating
import SwiftUI

struct ContentView: View {
    
    @State private var rating = 3.5
    
    var body: some View {
        StarRatingView(rating: $rating)
            .id(rating)
    }
}
```
The following parameters can be added to the view call to further customize its appearance.

- **fontSize**          (defaults to 17.0)

- **displayOnly**       (defaults to false, true disables the on tap gesture that allows you to change the rating)

- **maxRating**         (defaults to 5)

- **showEmptyStars**    (defaults to true, false will hide empty stars)

- **allowHalfStars**    (defaults to true, false will ignore the decimal part of a rating)

- **ratingColor**       (defaults to gold)

- **emptyColor**        (defaults to lightGray)
