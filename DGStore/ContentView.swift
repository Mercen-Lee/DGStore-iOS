//
//  ContentView.swift
//  DGStore
//
//  Created by Mercen on 2022/07/18.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @State var itemList = [[String: String]]()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                /*
                Button(action: { print("안뇽") }) {
                    HStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 10))
                        Text("로그인하세요")
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Spacer()
                    }
                }
                .foregroundColor(.white)
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .background(Color(.secondaryLabel))
                .clipShape(RoundedRectangle(cornerRadius: 24))
                 */
                ForEach(itemList, id: \.self) { value in
                    VStack(spacing: 0) {
                        Image(value["image"]!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 190)
                            .clipped()
                        HStack {
                            VStack(alignment: .leading) {
                                Text(value["title"]!)
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                Text(value["developer"]!)
                                    .font(.system(size: 10))
                            }
                            Spacer()
                            Text(value["platform"]!)
                        }
                        .foregroundColor(Color(.label))
                        .padding(EdgeInsets(top: 15, leading: 20, bottom: 17, trailing: 0))
                    }
                    .onTapGesture{ showModal = true }
                    .background(Color(.secondarySystemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 15, trailing: 20))
                    .shadow(radius: 30, x: 0, y: 20)
                    .listRowInsets(.init())
                    .listRowSeparator(.hidden)
                    .sheet(isPresented: self.$showModal) {
                        ScreenView(swTitle: value["title"]!)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationBarTitle("스토어")
            .refreshable { print("refreshed") }
            .listStyle(PlainListStyle())
                .onAppear {
                    itemList.append([
                        "title": "Rolling Root",
                        "developer": "406SOFT",
                        "image": "Geunho",
                        "platform": "iOS",
                    ])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
