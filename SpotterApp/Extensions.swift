//
//  Extensions.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-10-17.
//

import Foundation
import SwiftUI

extension View{
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View{
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func stepFromString(_ step: String) -> Double{
        switch step{
        case "10":
            return 10
        case "5":
            return 5
        case "0.25":
            return 0.25
        default:
            return 100
        }
    }
}

extension Date{
    func getFormattedDate(format: String) -> String{
        let dateFormatted = DateFormatter()
        dateFormatted.dateFormat = format
        return dateFormatted.string(from: self)
    }
}

struct RoundedCorner: Shape{
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
