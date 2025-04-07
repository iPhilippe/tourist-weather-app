//
//  FilterListContent.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 07/04/25.
//

import Foundation

public func FilterListContent(searchText: String, content: String) -> Bool {
    let localizedSearchText = searchText
    let localizedSimilarString = content
    
    return localizedSimilarString.contains(localizedSearchText)
}

public extension String {
    func textForSearch() -> String {
        var text = self
        text = text.lowercased()
        text = text.replaceEmptySpaces()
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return text
    }
    
    func replaceEmptySpaces() -> String {
        return self.filter { !$0.isWhitespace }
    }
}
