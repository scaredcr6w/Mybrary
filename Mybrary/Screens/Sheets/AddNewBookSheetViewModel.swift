//
//  AddNewBookSheetViewModel.swift
//  Mybrary
//
//  Created by Anda Levente on 28/06/2024.
//

import Foundation

enum FormValidationError: Error, LocalizedError {
    case emptyInput
    case autorSpecialCharacters
    case invalidAuthorNameLenght
    case invalidTitle
    case priceEqualsZero
    case invalidPriceRange
    case invalidRatingRange
    
    var errorDescription: String? {
        switch self {
        case .emptyInput:
            return "A szövegmezők nem hagyhatók üresen!"
        case .autorSpecialCharacters:
            return "Az író neve nem tartalmazhat speciális karaktert!"
        case .invalidAuthorNameLenght:
            return "Az író neve nem lehet 50 karakternél hosszabb!"
        case .invalidTitle:
            return "A cím nem kezdődhet kisbetűvel!"
        case .priceEqualsZero:
            return "Az ár nem lehet 0"
        case .invalidPriceRange:
            return "Az ár nem lehet negatív!"
        case .invalidRatingRange:
            return "Az értékelés 0 és 5 közötti lehet!"
        }
    }
}


func validateForm(book: Book) throws {
    var specialCharacters = CharacterSet.alphanumerics
    specialCharacters.insert(charactersIn: ".")
    let authorspecialCharacters = specialCharacters.inverted
    let isTitleLower = book.title.first?.isLowercase ?? false
    
    if book.author.isEmpty || book.title.isEmpty || book.bookDescription.isEmpty{
        throw FormValidationError.emptyInput
    }
    
    if book.author.rangeOfCharacter(from: authorspecialCharacters) != nil {
        throw FormValidationError.autorSpecialCharacters
    }
    
    if book.author.count > 50 {
        throw FormValidationError.invalidAuthorNameLenght
    }
    
    if isTitleLower {
        throw FormValidationError.invalidTitle
    }
    
    if book.price == 0 {
        throw FormValidationError.priceEqualsZero
    }
    
    if book.price < 0 {
        throw FormValidationError.invalidPriceRange
    }
    
    if book.rating < 0 || book.rating > 5 {
        throw FormValidationError.invalidRatingRange
    }
    
}
