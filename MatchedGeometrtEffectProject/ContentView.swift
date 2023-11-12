//
//  ContentView.swift
//  MatchedGeometrtEffectProject
//
//  Created by Etienne on 12/11/2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var nspace
    @State var seletedIndex: Int?
    @State var showDetails = false
    
    let title: String = "Item title"
    let description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
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
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
