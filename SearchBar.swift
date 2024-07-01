import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onCommit: {
                onSearch()
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                onSearch()
            }) {
                Image(systemName: "magnifyingglass")
            }
            .padding(.leading, 5)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""), onSearch: {})
    }
}

