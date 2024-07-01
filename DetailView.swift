import SwiftUI

struct DetailView: View {
    let photo: Photo
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                RemoteImage(url: photo.media.m)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .cornerRadius(10)
                
                Text(photo.title)
                    .font(.headline)
                
                Text(photo.description)
                    .foregroundColor(.secondary)
                
                Text("Author: \(photo.author)")
                    .foregroundColor(.secondary)
                
                Text("Published Date: \(photo.publishedDate)")
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .navigationTitle("Photo Detail")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(photo: Photo(title: "Example Photo",
                                link: "https://www.example.com",
                                media: Media(m: "https://via.placeholder.com/150"),
                                description: "Example description",
                                author: "John Doe",
                                publishedDate: "2024-06-30T12:00:00Z"))
    }
}
