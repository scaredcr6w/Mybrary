//
//  ChallangesViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 24/06/2024.
//

import Foundation

class ChallangesViewModel : ObservableObject {
    
//    @Published var challenges: [Challange] = [
//        .init(challange: "Olvass el egy könyvet egy hét alatt", isCompleted: false, completedDate: nil),
//        .init(challange: "Próbálj ki egy új műfajt", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet egy idegen nyelven", isCompleted: false, completedDate: nil),
//        .init(challange: "Látogass el egy könyvtárba és kölcsönözz egy könyvet", isCompleted: false, completedDate: nil),
//        .init(challange: "Ajándékozz egy könyvet valakinek", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy klasszikus regényt", isCompleted: false, completedDate: nil),
//        .init(challange: "Írj egy könyvajánlót egy olvasott könyvről", isCompleted: false, completedDate: nil),
//        .init(challange: "Vegyél részt egy könyvklub találkozón", isCompleted: false, completedDate: nil),
//        .init(challange: "Hallgass meg egy hangoskönyvet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit filmre vittek", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy életrajzi könyvet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy önfejlesztő könyvet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet egy női szerzőtől", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy díjnyertes könyvet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit egy barátod ajánlott", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy történelmi regényt", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, ami 2020-ban jelent meg", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, aminek egy szín van a borítóján", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy novelláskötetet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet egy elsőkönyves írótól", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, ami egy másik országban játszódik", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit 1900 előtt írtak", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet egy kisebbségi szerzőtől", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit gyerekként szerettél", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit eddig mindig halogattál", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy verseskötetet", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy képregényt vagy mangát", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, amit a kedvenc íród írt", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, ami egy sorozat része", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy könyvet, ami igaz történeten alapul", isCompleted: false, completedDate: nil),
//        .init(challange: "Olvass el egy sci-fi regényt", isCompleted: false, completedDate: nil)
//    ]
    @Published var challenges: [Challange] = [
            .init(challange: "Olvass el egy könyvet egy hét alatt", isCompleted: false, completedDate: nil),
            .init(challange: "Próbálj ki egy új műfajt", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet egy idegen nyelven", isCompleted: false, completedDate: nil),
            .init(challange: "Látogass el egy könyvtárba és kölcsönözz egy könyvet", isCompleted: false, completedDate: nil),
            .init(challange: "Ajándékozz egy könyvet valakinek", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy klasszikus regényt", isCompleted: false, completedDate: nil),
            .init(challange: "Írj egy könyvajánlót egy olvasott könyvről", isCompleted: false, completedDate: nil),
            .init(challange: "Vegyél részt egy könyvklub találkozón", isCompleted: false, completedDate: nil),
            .init(challange: "Hallgass meg egy hangoskönyvet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit filmre vittek", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy életrajzi könyvet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy önfejlesztő könyvet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet egy női szerzőtől", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy díjnyertes könyvet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit egy barátod ajánlott", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy történelmi regényt", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, ami 2020-ban jelent meg", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, aminek egy szín van a borítóján", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy novelláskötetet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet egy elsőkönyves írótól", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, ami egy másik országban játszódik", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit 1900 előtt írtak", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet egy kisebbségi szerzőtől", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit gyerekként szerettél", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit eddig mindig halogattál", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy verseskötetet", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy képregényt vagy mangát", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, amit a kedvenc íród írt", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, ami egy sorozat része", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy könyvet, ami igaz történeten alapul", isCompleted: false, completedDate: nil),
            .init(challange: "Olvass el egy sci-fi regényt", isCompleted: false, completedDate: nil)
    ]

}
