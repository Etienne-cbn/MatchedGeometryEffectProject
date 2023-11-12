//
//  ExempleView.swift
//  MatchedGeometrtEffectProject
//
//  Created by Etienne on 12/11/2023.
//

import SwiftUI

struct CellView: View {
    var index: Int
    @Namespace var nspace
    @Binding var showDetails: Bool
    @Binding var seletedIndex: Int?
    
    enum NamespaceIDs: String {
        case container
        case profilePic
        case texts
        case empty = ""
    }
    
    let title: String = "Item title"
    let description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    var body: some View {
        ZStack {
            if self.showDetails && self.seletedIndex == self.index {
                self.bigView
            } else {
                self.smallView
            }
        }.onTapGesture {
            withAnimation(.easeInOut) {
                if let seletedIndex = self.seletedIndex, seletedIndex != self.index {
                    self.seletedIndex = self.index
                    return
                }
                self.showDetails.toggle()
                self.seletedIndex = self.index
            }
        }
        .clipped()
    }
    
    @ViewBuilder
    var smallView: some View {
        ZStack {
            
            Rectangle()
                .fill(Color.green)
            
            
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .background(
                        HStack(spacing: .zero) {
                            Rectangle()
                                .fill(Color.yellow)
                                .matchedGeometryEffect(id: NamespaceIDs.profilePic, in: self.nspace, anchor: .topLeading)
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(self.title)
                                    .fontWeight(.bold)
                                Text(self.description)
                                    .multilineTextAlignment(.leading)
                                    .lineLimit(3)
                            }
                            .matchedGeometryEffect(id: NamespaceIDs.texts, in: self.nspace)
                            .padding()
                        }
                    )
            }
            
        }
        .matchedGeometryEffect(id: NamespaceIDs.container, in: self.nspace)
        .frame(height: 150)
    }
    
    
    @ViewBuilder
    var bigView: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .zIndex(1)
            
            ZStack {
                VStack {
                    Rectangle()
                        .fill(Color.yellow)
                        .matchedGeometryEffect(id: NamespaceIDs.profilePic, in: self.nspace, anchor: .topLeading)
                        .frame(height: 200)
                        .padding(0)
                    
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(self.title)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        Text(self.description)
                            .lineLimit(nil)
                            .multilineTextAlignment(.leading)
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.horizontal)
                    }
                    .matchedGeometryEffect(id: NamespaceIDs.texts, in: self.nspace)
                    .frame(maxHeight: .infinity)
                    .padding(.vertical)
                }
            }
            .zIndex(2)
        }
        .matchedGeometryEffect(id: NamespaceIDs.container, in: self.nspace)

    }
}

struct ExempleView_Previews: PreviewProvider {
    static var previews: some View {
        ExempleView(
            index: 0,
            showDetails: .constant(false),
            seletedIndex: .constant(0)
        )
    }
}
