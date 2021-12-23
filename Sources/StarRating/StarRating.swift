//
//  StarRating.swift
//
//
//  Created by Ferdinand Rios on 12/23/21.
//

import SwiftUI

public struct StarRatingView: View {
    
    @State private var numFullStars = 0
    @State private var numHalfStars = 0
    @State private var numEmptyStars = 0
    
    var rating: Binding<Double>
    var fontSize: Double
    var displayOnly: Bool
    var maxRating: Int
    var showEmptyStars: Bool
    var allowHalfStars: Bool
    var ratingColor: Color
    var emptyColor: Color
    
    public init (rating: Binding<Double>,
                 fontSize: Double = 17.0,
                 displayOnly: Bool = false,
                 maxRating: Int = 5,
                 showEmptyStars: Bool = true,
                 allowHalfStars: Bool = true,
                 ratingColor: Color = Color(UIColor(red: 1.0, green: 0.714, blue: 0.0, alpha: 1.0)),
                 emptyColor: Color = Color(UIColor.lightGray)) {
        self.rating = rating
        self.fontSize = fontSize
        self.displayOnly = displayOnly
        self.maxRating = maxRating
        self.showEmptyStars = showEmptyStars
        self.allowHalfStars = allowHalfStars
        self.ratingColor = ratingColor
        self.emptyColor = emptyColor
    }
    
    public var body: some View {
        HStack (spacing: 5){
            fullStars
            if allowHalfStars{
                halfStars
            }
            if showEmptyStars {
                emptyStars
            }
        }
        .onAppear {
            numFullStars = Int(rating.wrappedValue)
            numHalfStars = (rating.wrappedValue.truncatingRemainder(dividingBy: 1.0) == 0 ? 0 : 1)
            if allowHalfStars {
                numEmptyStars = maxRating - numFullStars - numHalfStars
            } else {
                numEmptyStars = maxRating - numFullStars
            }
        }
        .onTapGesture {
            if !displayOnly {
                if rating.wrappedValue >= Double(maxRating) {
                    rating.wrappedValue = 0.0
                } else {
                    if allowHalfStars {
                        rating.wrappedValue += 0.5
                    } else {
                        rating.wrappedValue += 1.0
                    }
                }
            }
        }
    }
    
    
    private var fullStars : some View {
        ForEach (0..<numFullStars, id: \.self) { _ in
            Image(systemName: "star.fill")
                .foregroundColor(ratingColor)
                .font(.system(size: fontSize))
        }
    }
    
    private var halfStars: some View {
        ForEach (0..<numHalfStars, id: \.self) { _ in
            Image(systemName: "star.lefthalf.fill")
                .foregroundColor(ratingColor)
                .font(.system(size: fontSize))
        }
    }
    
    private var emptyStars: some View {
        ForEach (0..<numEmptyStars, id: \.self) { _ in
            Image(systemName: "star")
                .foregroundColor(emptyColor)
                .font(.system(size: fontSize))
        }
    }
}


