//
//  Constants.swift
//  tourist-weather-app
//
//  Created by Philippe Brunner Pazinatto on 06/04/25.
//


import Foundation

enum TouristPointsNames: String, CaseIterable {
    case vista_chinesa = "Vista Chinesa"
    case cristo_redentor = "Cristo Redentor"
    case museu_do_amanha = "Museu do Amanhã"
    
    
    func description() -> String {
        switch self {
        case .vista_chinesa:
            return "Vista incrível da cidade do Rio de Janeiro, com vista panorâmica das montanhas e do mar."
        case .cristo_redentor:
            return "Simbolo do Rio de Janeiro, a estátua do Cristo Redentor oferece uma vista espetacular da cidade."
        case .museu_do_amanha:
            return "Museu do Amanhã é um museu de ciências e tecnologia, com exposições interativas e inovadoras."
        }
    }
    
    
    func getCoordinates() -> Coordinates {
        switch self {
        case .vista_chinesa:
            return Coordinates(latitude: -22.97247824461231, longitude: -43.248775059075390)
        case .cristo_redentor:
            return Coordinates(latitude: -22.95049483721863, longitude: -43.21009060396723)
        case .museu_do_amanha:
            return Coordinates(latitude: -22.89231146795284, longitude: -43.17901989445194)
        }
    }
}
