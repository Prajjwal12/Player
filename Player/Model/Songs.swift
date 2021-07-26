struct Songs: Decodable {
    var resultCount: Int?
    var results: [SongsResult]?
    
}

struct SongsResult : Decodable {
    var wrapperType : String?
    var artistId : Int?
    var collectionId : Int?
    var artistName : String?
    var collectionName : String?
    var collectionCensoredName : String?
    var artistViewUrl : String?
    var collectionViewUrl : String?
    var artworkUrl60 : String?
    var artworkUrl100 : String?
    var collectionPrice : Float?
    var collectionExplicitness : String?
    var trackCount : Int?
    var copyright : String?
    var country : String?
    var currency : String?
    var releaseDate : String?
    var primaryGenreName : String?
    var previewUrl : String?
    var description : String?
}
