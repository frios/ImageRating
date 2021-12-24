//
//  ImageRatingView.swift
//
//
//  Created by Ferdinand Rios on 12/23/21.
//

import SwiftUI

public struct ImageRatingView: View {
    
    @State private var numFull = 0
    @State private var numHalf = 0
    @State private var numEmpty = 0
    
    var value: Binding<Double>
    var fontSize: Double
    var displayOnly: Bool
    var alignment: HorizontalAlignment
    var maxImages: Int
    var fullImageName: String
    var fullColor: Color
    var allowHalf: Bool
    var halfImageName: String
    var showEmpty: Bool
    var emptyImageName: String
    var emptyColor: Color
    
    public init (value: Binding<Double>,
                 fontSize: Double = 17.0,
                 displayOnly: Bool = false,
                 alignment: HorizontalAlignment = .leading,
                 maxImages: Int = 5,
                 fullImageName: String = "star.fill",
                 fullColor: Color = Color(UIColor(red: 1.0, green: 0.714, blue: 0.0, alpha: 1.0)),
                 allowHalf: Bool = true,
                 halfImageName: String = "star.lefthalf.fill",
                 showEmpty: Bool = true,
                 emptyImageName: String = "star",
                 emptyColor: Color = Color(UIColor.lightGray)) {
        
        self.value = value
        self.fontSize = fontSize
        self.displayOnly = displayOnly
        self.alignment = alignment
        self.maxImages = maxImages
        self.fullImageName = fullImageName
        self.fullColor = fullColor
        self.allowHalf = allowHalf
        self.halfImageName = halfImageName
        self.showEmpty = showEmpty
        self.emptyImageName = emptyImageName
        self.emptyColor = emptyColor
    }
    
    public var body: some View {
        VStack (alignment: alignment) {
            HStack (spacing: 5){
                fullImages
                
                if allowHalf {
                    halfImages
                }
                
                emptyImages
                    //I change the opacity here because if I use an EmptyView, then you can no longer tap on it
                    .opacity(showEmpty ? 1.0 : 0.01)
            }
        }
        .onAppear {
            numFull = Int(value.wrappedValue)
            numHalf = (value.wrappedValue.truncatingRemainder(dividingBy: 1.0) == 0 ? 0 : 1)
            if allowHalf {
                numEmpty = maxImages - numFull - numHalf
            } else {
                numEmpty = maxImages - numFull
            }
        }
        .onTapGesture {
            if !displayOnly {
                if value.wrappedValue >= Double(maxImages) {
                    value.wrappedValue = 0.0
                } else {
                    if allowHalf {
                        value.wrappedValue += 0.5
                    } else {
                        value.wrappedValue += 1.0
                    }
                }
            }
        }
    }
    
    
    private var fullImages : some View {
        ForEach (0..<numFull, id: \.self) { _ in
            Image(systemName: fullImageName)
                .foregroundColor(fullColor)
                .font(.system(size: fontSize))
        }
    }
    
    private var halfImages: some View {
        ForEach (0..<numHalf, id: \.self) { _ in
            Image(systemName: halfImageName)
                .foregroundColor(fullColor)
                .font(.system(size: fontSize))
        }
    }
    
    private var emptyImages: some View {
        ForEach (0..<numEmpty, id: \.self) { _ in
            Image(systemName: emptyImageName)
                .foregroundColor(emptyColor)
                .font(.system(size: fontSize))
        }
    }
}


