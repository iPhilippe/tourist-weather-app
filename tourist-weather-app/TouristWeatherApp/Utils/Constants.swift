//
//  Constants.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//


import Foundation

enum TouristPoint: String, CaseIterable {
    case vista_chinesa = "Vista Chinesa"
    case cristo_redentor = "Cristo Redentor"
    case museu_do_amanha = "Museu do Amanhã"
    
    
    func description() -> String {
        switch self {
        case .vista_chinesa:
            return "Vista incrível da cidade do Rio de Janeiro, panorâmica das montanhas e do mar."
        case .cristo_redentor:
            return "Símbolo do Rio de Janeiro, a estátua do Cristo Redentor oferece uma vista espetacular da cidade."
        case .museu_do_amanha:
            return "Museu do Amanhã é um museu de ciências e tecnologia, com exposições interativas e inovadoras."
        }
    }
    
    func getCoordinates() -> Coord {
        switch self {
        case .vista_chinesa:
            return Coord(lon: -43.24874819456037, lat: -22.971035184485316)
        case .cristo_redentor:
            return Coord(lon: -43.2096094018821, lat: -22.949696884121703)
        case .museu_do_amanha:
            return Coord(lon: -43.179225338570426, lat: -22.891038746036397)
        }
    }
}


struct constants {
    
    struct KEYS {
        let OPENWEATHERMAP_API_KEY =  "OPENWEATHERMAP_API_KEY"
    }
}
