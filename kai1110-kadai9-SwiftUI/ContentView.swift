
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

    private let prefectures = ["東京都", "神奈川県", "埼玉県", "千葉県"]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                ForEach(prefectures, id: \.self) { prefecture in
                    Button(prefecture) {
                        selection = prefecture
                        isPresentSelectionView = false
                    }
                }

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
