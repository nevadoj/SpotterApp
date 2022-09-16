//
//  TestingView.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-09-16.
//

import SwiftUI

struct TestingView: View {
    @StateObject var data = Routine()
    @State var show = false
    var body: some View {
        ZStack{
            HomeView()
            
            if show{
                Color.black.opacity(0.2)
                BottomSheet(show: $show)
                    .transition(.move(edge: .bottom)).ignoresSafeArea()
                    .zIndex(1)
            }
        }
        .environmentObject(data)
        .onTapGesture {
            withAnimation{
                show.toggle()
            }
        }
    }
}

struct TestingView_Previews: PreviewProvider {
    static var previews: some View {
        TestingView()
    }
}
