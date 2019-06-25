//
//  DayWeatherCell.swift
//  WeatherGift
//
//  Created by Aidan on 6/24/19.
//  Copyright © 2019 Aidan Lilani. All rights reserved.
//

import UIKit

private let dateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter
    
} ()

class DayWeatherCell: UITableViewCell {
  
    
    @IBOutlet weak var dayCellIcon: UIImageView!
    @IBOutlet weak var dayCellWeekday: UILabel!
    @IBOutlet weak var dayCellMin: UILabel!
    @IBOutlet weak var dayCellMax: UILabel!
    @IBOutlet weak var dayCellSummary: UITextView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    
    func update(with dailyForecast: WeatherDetail.DailyForecast, timeZone: String) {
        dayCellIcon.image = UIImage(named: dailyForecast.dailyIcon)
        dayCellSummary.text = dailyForecast.dailySummary
        dayCellMax.text = String(format: "%2.f", dailyForecast.dailyMaxTemp) + "°"
        dayCellMin.text = String(format: "%2.f", dailyForecast.dailyMinTemp) + "°"
        
        let dateString = dailyForecast.dailyDate.format(timeZone: timeZone, dateFormatter: dateFormatter)
        
        dayCellWeekday.text = dateString
    }
}
