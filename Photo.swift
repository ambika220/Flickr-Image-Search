import Foundation

struct FlickrResponse: Decodable {
    let items: [Photo]
}

struct Photo: Identifiable, Decodable {
    let id = UUID()
    let title: String
    let link: String
    let media: Media
    let description: String
    let author: String
    let publishedDate: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case link
        case media
        case description
        case author
        case publishedDate = "published"
    }
}

struct Media: Decodable {
    let m: String
}
