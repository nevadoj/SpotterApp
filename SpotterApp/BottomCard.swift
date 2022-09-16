//
//  BottomCard.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-16.
//

import SwiftUI

struct BottomSheet: View {
    @State var translation: CGSize = .zero // Moves the sheet up/down along Y axis
    @State var offsetY: CGFloat = 0 // Allows for sheet to snap
    @Binding var show: Bool
    
    var body: some View{
        ZStack{
            content
        }
    }
    
    
    var content: some View {
        GeometryReader { proxy in
            VStack{
                Text("Sample")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged{ value in
                        translation = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8)){
                            // Let sheet snap to top and middle of screen
                            let snap = translation.height + offsetY
                            let quarter = proxy.size.height / 4
                            
                            
                            if snap > quarter{
                                offsetY = quarter * 2
                            }
                            else if snap > quarter*4{
                                show.toggle()
                            }
                            else{
                                offsetY = 0
                            }
                            
                            translation = .zero
                        }
                    }
            )
        .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(show: .constant(true))
            .background(.blue)
    }
}
