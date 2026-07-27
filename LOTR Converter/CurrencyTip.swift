//
//  CurrencyTip.swift
//  LOTR Converter
//
//  Created by Krishnanunni K A on 27/07/26.
//

import TipKit

struct CurrencyTip:Tip {
    let title: Text = Text("Change currency")
    var message: Text? = Text("You can tap the left or right currency to bring up the currency selection screen")
    var image: Image? = Image(systemName: "hand.tap.fill")
    
    
}
