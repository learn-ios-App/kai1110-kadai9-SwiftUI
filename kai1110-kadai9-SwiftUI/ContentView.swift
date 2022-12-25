
import SwiftUI

struct ContentView: View {
    @State var selection = "未選択"
    @State var isPresentSelectionView = false
    
    var body: some View {
        HStack(spacing: 60) {
            Text("都道府県")
            Text("\(selection)")
            Button(action: {
                isPresentSelectionView = true
            }) {
                Text("入力")
            }
            .sheet(isPresented: $isPresentSelectionView) {
                SelectionView(isPresentSelectionView: $isPresentSelectionView,
                              selection: $selection)
            }
        }
    }
}

struct SelectionView: View {
    @Binding var isPresentSelectionView: Bool
    @Binding var selection: String
    let prefectures = ["東京都", "神奈川県", "埼玉県", "千葉県"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                ForEach(prefectures, id: \.self) { prefecture in
                    Button(action: {
                        selection = prefecture
                        isPresentSelectionView = false
                    }) {
                        Text("\(prefecture)")
                    }
                }
//                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "東京都")
//                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "神奈川県")
//                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "埼玉県")
//                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "千葉県")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button(action: {
                                isPresentSelectionView.toggle()
                            }) {
                                Text("cancel")
                            }
                        }
                }
            }
        }
    }
}

//struct selectionButtonView: View {
//    @Binding var isPresentSelectionView: Bool
//    @Binding var selection: String
//    let prefecture: String
//
//    var body: some View {
//        Button(action: {
//            selection = prefecture
//            isPresentSelectionView.toggle()
//        }) {
//            Text("\(prefecture)")
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
