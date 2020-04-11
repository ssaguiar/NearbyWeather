//
//  WeatherDataCell.swift
//  SimpleWeather
//
//  Created by Erik Maximilian Martens on 03.12.16.
//  Copyright © 2016 Erik Maximilian Martens. All rights reserved.
//

import UIKit

class WeatherDataCell: UITableViewCell {
  
  var weatherDataIdentifier: Int!
  
  @IBOutlet weak var backgroundColorView: UIView!
  @IBOutlet weak var weatherConditionLabel: UILabel!
  @IBOutlet weak var cityNameLabel: UILabel!
  
  @IBOutlet weak var temperatureImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  
  @IBOutlet weak var cloudCoverImageView: UIImageView!
  @IBOutlet weak var cloudCoverageLabel: UILabel!
  
  @IBOutlet weak var humidityImageView: UIImageView!
  @IBOutlet weak var humidityLabel: UILabel!
  
  @IBOutlet weak var windSpeedImageView: UIImageView!
  @IBOutlet weak var windspeedLabel: UILabel!
  
  func configureWithWeatherDTO(_ weatherDTO: WeatherInformationDTO) {
    let bubbleColor: UIColor = ConversionService.isDayTime(forWeatherDTO: weatherDTO) ?? true ? Constants.Theme.BrandColors.standardDay : Constants.Theme.BrandColors.standardNight // default to blue colored cells
    
    weatherDataIdentifier = weatherDTO.cityID
    
    backgroundColorView.layer.cornerRadius = 5.0
    backgroundColorView.layer.backgroundColor = bubbleColor.cgColor
    
    cityNameLabel.textColor = .white
    cityNameLabel.font = .preferredFont(forTextStyle: .headline)
    
    temperatureImageView.tintColor = .white
    temperatureLabel.textColor = .white
    temperatureLabel.font = .preferredFont(forTextStyle: .subheadline)
    
    cloudCoverImageView.tintColor = .white
    cloudCoverageLabel.textColor = .white
    cloudCoverageLabel.font = .preferredFont(forTextStyle: .subheadline)
    
    humidityImageView.tintColor = .white
    humidityLabel.textColor = .white
    humidityLabel.font = .preferredFont(forTextStyle: .subheadline)
    
    windSpeedImageView.tintColor = .white
    windspeedLabel.textColor = .white
    windspeedLabel.font = .preferredFont(forTextStyle: .subheadline)
    
    let weatherConditionSymbol = ConversionService.weatherConditionSymbol(fromWeatherCode: weatherDTO.weatherCondition[0].identifier)
    weatherConditionLabel.text = weatherConditionSymbol
    
    cityNameLabel.text = weatherDTO.cityName
    
    temperatureLabel.text = ConversionService.temperatureDescriptor(
      forTemperatureUnit: PreferencesDataManager.shared.temperatureUnit,
      fromRawTemperature: weatherDTO.atmosphericInformation.temperatureKelvin
    )
    
    cloudCoverageLabel.text = "\(weatherDTO.cloudCoverage.coverage)%"
    
    humidityLabel.text = "\(weatherDTO.atmosphericInformation.humidity)%"
    
    if let windspeed = weatherDTO.windInformation.windspeed {
      windspeedLabel.text = ConversionService.windspeedDescriptor(
        forDistanceSpeedUnit: PreferencesDataManager.shared.distanceSpeedUnit,
        forWindspeed: windspeed
      )
    } else {
      windspeedLabel.text = nil
    }
  }
}
