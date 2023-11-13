//
import SwiftUI

struct ExempleView: View {
    @Namespace var nspace
    @State var animate = false
    
    var body: some View {
        VStack {
            self.moreThanTwoViewView
            
            Button("Animate") {
                withAnimation(.easeInOut(duration: 1)) {
                    self.animate.toggle()
                }
            }
        }
        
    }
    
    @ViewBuilder
    var sizeAnimationView: some View {
        HStack {
            if self.animate {
                // A View
                Rectangle()
                    .fill(Color.red)
                    .matchedGeometryEffect(id: "AnimatedViewId", in: self.nspace)
                    .frame(width: 100, height: 100)
            } else {
                // B View
                Rectangle()
                    .fill(Color.blue.opacity(0.5))
                    .matchedGeometryEffect(id: "AnimatedViewId", in: self.nspace)
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    @ViewBuilder
    var sizeAndPositionAnimationView: some View {
        HStack {
            if !self.animate {
                // A View
                Rectangle()
                    .fill(Color.red.opacity(0.5))
                    .matchedGeometryEffect(id: "AnimatedView", in: self.nspace, anchor: .center, isSource: true)
                    .frame(width: 100, height: 100)
            }
            
            Rectangle()
                .fill(Color.clear)
                .frame(width: 200, height: 200)
            
            if self.animate {
                // B View
                Rectangle()
                    .fill(Color.blue.opacity(0.5))
                    .matchedGeometryEffect(id: "AnimatedView", in: self.nspace, isSource: true)
                    .frame(width: 200, height: 200)
            }
        }
    }
    
    @ViewBuilder
    var moreThanTwoViewView: some View {
        HStack {
            // A View
            Rectangle()
                .fill(Color.red.opacity(0.5))
                .matchedGeometryEffect(
                    id: self.animate ? "AnimatedView" : "goBack1",
                    in: self.nspace,
                    properties: .size,
                    anchor: .center,
                    isSource: false
                )
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .matchedGeometryEffect(
                    id: "AnimatedView",
                    in: self.nspace,
                    anchor: .center
                )
                .frame(width: 50, height: 50)
            
            Rectangle()
                .fill(Color.blue.opacity(0.5))
                .matchedGeometryEffect(
                    id: self.animate ? "AnimatedView" : "goBack1",
                    in: self.nspace,
                    properties: .position,
                    anchor: .top,
                    isSource: false
                )
                .frame(width: 100, height: 100)
        }
    }
}





struct ExempleView_Previews: PreviewProvider {
    @Namespace static var nspace
    static var previews: some View {
        ExempleView()
    }
}
