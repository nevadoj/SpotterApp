//
//  TestPicker.swift
//  SpotterApp
//
//  Created by Joseph Nevado on 2022-12-02.
//

import SwiftUI

struct TestPicker: View {
    
    @State var offset : Double = 0
    
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false, content: {
//
//            HStack(spacing: 0){
//                let pickerCount = 6
//
//                ForEach(1...pickerCount, id: \.self){ index in
//
//                    Rectangle()
//                        .fill(Color.gray)
//                        .frame(width: 1, height: 30)
//                        .frame(width: 20)
//
//                    ForEach(1...4, id: \.self){ subIndex in
//
//                        Rectangle()
//                            .fill(Color.gray)
//                            .frame(width: 1, height: 15)
//                            .frame(width: 20)
//
//                    }
//
//                }
//            }
//            .offset(x: (getRect().width - 30) / 2)
//            .padding(.trailing, getRect().width - 30)
//        })
        VStack{
            Text("\(offset) lbs")
            CustomSlider(pickerCount: 6, offset: $offset, content:{
                let pickerCount = 6
                HStack(spacing: 0){
                    ForEach(1...pickerCount, id: \.self){ index in
                        
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 1, height: 30)
                            .frame(width: 20)
                        
                        ForEach(1...4, id: \.self){ subIndex in
                            
                            Rectangle()
                                .fill(Color.gray)
                                .frame(width: 1, height: 15)
                                .frame(width: 20)
                            
                        }
                    }
                }
            })
            .frame(height: 50)
            .padding()
        }
    }
}

struct TestPicker_Previews: PreviewProvider {
    static var previews: some View {
        TestPicker()
    }
}

func getRect()->CGRect{
    return UIScreen.main.bounds
}

struct CustomSlider<Content: View> : UIViewRepresentable{
    
    var content: Content
    @Binding var offset: Double
    var pickerCount: Int
    
    init(pickerCount: Int, offset: Binding<Double>, @ViewBuilder content: @escaping ()->Content){
        self.content = content()
        self._offset = offset
        self.pickerCount = pickerCount
    }
    
    func makeCoordinator() -> Coordinator {
        return CustomSlider.Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> UIScrollView{
        let scrollView = UIScrollView()
        let swiftUIView = UIHostingController(rootView: content).view!
        let width = CGFloat((pickerCount * 5) * 20) + (getRect().width - 30)
        
        swiftUIView.frame = CGRect(x: 0, y:0, width: width, height: 50)
        
        scrollView.contentSize = swiftUIView.frame.size
        scrollView.addSubview(swiftUIView)
        scrollView.bounces = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context){
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate{
        var parent: CustomSlider
        
        init(parent: CustomSlider){
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView){
            parent.offset = scrollView.contentOffset.x
        }
    }
}
