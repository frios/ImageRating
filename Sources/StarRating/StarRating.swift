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
    
    private let MAX_RATING = 5
    private let RATING_COLOR = Color(UIColor(red: 1.0, green: 0.714, blue: 0.0, alpha: 1.0))
    private let EMPTY_COLOR = Color(UIColor.lightGray)
    
    @Binding var rating: Double
    var fontSize: Double = 17.0
    var displayOnly: Bool = false
    
    public var body: some View {
        HStack {
            fullStars
            halfStars
            emptyStars
        }
        .onAppear {
            numFullStars = Int(rating)
            numHalfStars = (rating.truncatingRemainder(dividingBy: 1.0) == 0 ? 0 : 1)
            numEmptyStars = MAX_RATING - numFullStars - numHalfStars
        }
        .onTapGesture {
            if !displayOnly {
                if rating == 5.0 {
                    rating = 0.0
                } else {
                    rating += 0.5
                }
            }
        }
    }
    
    
    var fullStars : some View {
        ForEach (0..<numFullStars, id: \.self) { _ in
            Image(systemName: "star.fill")
                .foregroundColor(RATING_COLOR)
                .font(.system(size: fontSize))
        }
    }
    
    var halfStars: some View {
        ForEach (0..<numHalfStars, id: \.self) { _ in
            Image(systemName: "star.lefthalf.fill")
                .foregroundColor(RATING_COLOR)
                .font(.system(size: fontSize))
        }
    }
    
    var emptyStars: some View {
        ForEach (0..<numEmptyStars, id: \.self) { _ in
            Image(systemName: "star")
                .foregroundColor(EMPTY_COLOR)
                .font(.system(size: fontSize))
        }
    }
}
