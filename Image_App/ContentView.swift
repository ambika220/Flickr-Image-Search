import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var photos: [Photo] = []
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, onSearch: fetchPhotos)
                    .padding(.horizontal)
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                            ForEach(photos, id: \.link) { photo in
                                NavigationLink(destination: DetailView(photo: photo)) {
                                    RemoteImage(url: photo.media.m)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 120)
                                        .cornerRadius(10)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Flickr Image Search")
        }
    }
    
    private func fetchPhotos() {
        isLoading = true
        
        guard let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            defer { isLoading = false }
            
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(FlickrResponse.self, from: data)
                DispatchQueue.main.async {
                    self.photos = result.items
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
