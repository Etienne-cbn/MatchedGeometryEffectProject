import SwiftUI

struct ContentView: View {
    @State var seletedIndex: Int?
    @State var showDetails = false
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    ForEach(0..<10) { index in
                        CellView(
                            index: index,
                            showDetails: self.$showDetails,
                            seletedIndex: self.$seletedIndex
                        )
                        .cornerRadius(16)
                    }
                }
                .padding()
            }
        }
        .background(Color.gray.opacity(0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
