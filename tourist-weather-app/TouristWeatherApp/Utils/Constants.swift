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
            return Coord(lon: -22.97247824461231, lat: -43.248775059075390)
        case .cristo_redentor:
            return Coord(lon: -22.95049483721863, lat: -43.21009060396723)
        case .museu_do_amanha:
            return Coord(lon: -22.89231146795284, lat: -43.17901989445194)
        }
    }
}
