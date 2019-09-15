//
//  GetMovies.swift
//  BTG-Test
//
//  Created by Matheus De Mattos Pereira on 15/09/19.
//  Copyright © 2019 Matheus De Mattos Pereira. All rights reserved.
//

import Foundation

class GetMovies: RequestType {
    
    typealias ResponseType = UpcomingMovies
    var page : Int
    
    var data: RequestData {
        let url = "\(Constants.TMDB_URL)\(Constants.UPCOMING_MOVIES)?\(Constants.API_KEY_PREFIX)\(Constants.API_KEY)\(Constants.PAGE)\(page)"
        print (url)
        return RequestData(path: url, method: "\(Constants.GET)")
    }
    
    init(page: Int) {
        self.page = page
    }
}
