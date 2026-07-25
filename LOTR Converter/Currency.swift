//
//  Currency.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 24/06/26.
//

import Foundation
import SwiftUI

enum Currency: Double,Identifiable,CaseIterable{

    case copperPenny = 6400
    case silverPenny = 64
    case silverPiece = 16
    case goldPenny = 4
    case goldPiece = 1
    var image: ImageResource {
        switch self {
        case .copperPenny:
            return ImageResource.copperpenny
        case .silverPenny:
            return ImageResource.silverpenny
        case .silverPiece:
            return ImageResource.silverpiece
        case .goldPenny:
            return ImageResource.goldpenny
        case .goldPiece:
            return ImageResource.goldpiece
        }
    
    }
    var name: String{
        switch self {
        case .copperPenny:
            return "Copper Penny"
        case .silverPenny:
            return  "Silver Penny"
        case .silverPiece:
            return "Silver Piece"
        case .goldPenny:
            return "Gold Penny"
        case .goldPiece:
            return "Gold Piece"
        }
    }
    var id: Currency {
        return self
    }
    
    func convert(_ amountString: String ,to currency: Currency) -> String{
        guard let doubleAmount = Double(amountString) else {
            return ""
        }
        let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
        return String(format: "%.2f", convertedAmount)
    }
}
