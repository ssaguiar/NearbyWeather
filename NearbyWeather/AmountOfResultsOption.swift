//
//  AmountOfResults.swift
//  NearbyWeather
//
//  Created by Erik Maximilian Martens on 16.02.20.
//  Copyright © 2020 Erik Maximilian Martens. All rights reserved.
//

import Foundation

enum AmountOfResultsValue: Int, CaseIterable, Codable {
  case ten = 10
  case twenty = 20
  case thirty = 30
  case forty = 40
  case fifty = 50
}

class AmountOfResultsOption: Codable, PreferencesOption {
  
  static let availableOptions = [AmountOfResultsOption(value: .ten),
                                 AmountOfResultsOption(value: .twenty),
                                 AmountOfResultsOption(value: .thirty),
                                 AmountOfResultsOption(value: .forty),
                                 AmountOfResultsOption(value: .fifty)]
  
  typealias PreferencesOptionType = AmountOfResultsValue
  
  private lazy var count = {
    return AmountOfResultsValue.allCases.count
  }()
  
  var value: AmountOfResultsValue
  
  required init(value: AmountOfResultsValue) {
    self.value = value
  }
  
  required convenience init?(rawValue: Int) {
    guard let value = AmountOfResultsValue(rawValue: rawValue) else {
      return nil
    }
    self.init(value: value)
  }
  
  var stringValue: String {
    return "\(value.rawValue) \(R.string.localizable.results())"
  }
  
  var integerValue: Int {
    return value.rawValue
  }
}
