//
//  AllUIElementsList.swift
//  APIApp
//
//  Created by dedeepya reddy salla on 16/06/23.
//

/*
 List {
     rowView(title: "Text -- ") {
         Text("Text")
     }
     rowView(title: "Toggle with label") {
         Toggle(isOn: $isToggleOn) {
             Text("Toggle with label")
                 .font(Font.system(size: 20))
         }
     }
     rowView(title: "Toggle with texfield") {
         Toggle(isOn: $isToggleOn) {
             TextField("Title", text: $name, prompt: Text("Toggle 1"))
         }
     }
     
 }
 */
import SwiftUI

struct AllUIElementsList: View {
    @State var isToggleOn = true
    @State var name = "name"
    
    var body: some View {
        VerticalAlignmentGallery()
//        VStack {
//            //for each for hstack with weather values
//            HStack {
//                Text("title hjk")
//                    .frame(maxWidth: .infinity)
//                                        .border(Color.red)
//                                        .gridColumnAlignment(.leading)
//                Text("value")
//                    .frame(maxWidth: .infinity)
//                                        .border(Color.red)
//            }
//        }
    }
    
    //--requirement to get views from private function
    /*
     1.whatever generic content you are passing must confirm to View - ans: <Content: View>
     2.whatever view you created must be returned at end. Why? because you are using this function call inside ur body variabel or within its child views. Body variable expects all its child views to return view, so it can add them as its subviews. So child views must get views down the hierarchy of its subviews too.
     3.Instead if you declare this function and not use it within body variable or its subview, then its okay if you don't ur view also
     */
    private func rowView<Content: View>(title: String, @ViewBuilder _ content: () -> Content) -> some View {
        return HStack(alignment: .center) {
            Text("Text -- ")
            Spacer()
            content()
        }
    }
}

struct AllUIElementsList_Previews: PreviewProvider {
    static var previews: some View {
        AllUIElementsList()
    }
}

private struct VerticalAlignmentGallery: View {
    
    //--shows functions which returns views
//    var body: some View {
//        VStack(spacing: 30) {
//            row(alignment: .top, text: "Top")
//            row(alignment: .center, text: "Center")
//            row(alignment: .bottom, text: "Bottom")
//            row(alignment: .firstTextBaseline, text: "First Text Baseline")
//            row(alignment: .lastTextBaseline, text: "Last Text Baseline")
//            //--if you see first red color is displayed, on top of it blue color is displayed, on top of it yellow is displaye
//            ZStack {
//                Color.red.frame(height: 20)
//                Color.blue.frame(height: 10)
//                Color.yellow.frame(height: 5)
//            }
//        }
//
//    }
    
    //--using Zstack instead of using background image or background color
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("KohliIm.png")
            Text("Hacking with Swift hjlkl")
                .font(.largeTitle)
                .background(Color.black)
                .foregroundColor(.white)
        }
       
    }
    
    private func row(alignment: VerticalAlignment, text: String) -> some View {
        HStack(alignment: alignment, spacing: 0) {
            Color.red.frame(height: 1)
            Text(text).font(.title).border(.gray)
            Color.blue.frame(height: 3)
        }//.border(.green)
    }
}

struct VHStack1<Content: View>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack {
                content
            }
        } else {
            HStack {
                content
            }
        }
    }
}

