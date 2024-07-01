import XCTest
@testable import Image_App // Replace with your actual app name

class FlickrImageSearchTests: XCTestCase {

    func testFetchPhotos() {
        let expectation = self.expectation(description: "Fetching photos from Flickr")

        let searchText = "cat"
        
        let url = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")")!

        let session = URLSession.shared
        let task = session.dataTask(with: url) { data, response, error in
            defer { expectation.fulfill() }
            
            if let error = error {
                XCTFail("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                XCTFail("No data received")
                return
            }
            
            // Assert that we received some data
            XCTAssertNotNil(data, "Data should not be nil")
            
            // Optionally, parse data and assert specific conditions
            // For example, decode JSON response if applicable
            
            // Fulfill the expectation to indicate the asynchronous task has completed
        }
        
        task.resume()
        
        waitForExpectations(timeout: 10, handler: nil) // Adjust timeout as needed
    }
}
