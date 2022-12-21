
import SwiftUI

struct ContentView: View {
    @State var selection = "未選択"
    @State var isPresentSelectionView = false
    
    var body: some View {
        HStack(spacing: 60) {
            Text("都道府県")
            Text("\(selection)")
            Button(action: {
                isPresentSelectionView.toggle()
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
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "東京都")
                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "神奈川県")
                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "埼玉県")
                selectionButtonView(isPresentSelectionView: $isPresentSelectionView, selection: $selection, prefecture: "千葉県")
                Spacer()
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

struct selectionButtonView: View {
    @Binding var isPresentSelectionView: Bool
    @Binding var selection: String
    let prefecture: String
    
    var body: some View {
        Button(action: {
            selection = prefecture
            isPresentSelectionView.toggle()
        }) {
            Text("\(prefecture)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
