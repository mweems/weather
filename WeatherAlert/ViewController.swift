//
//  ViewController.swift
//  WeatherAlert
//
//  Created by Matt Weems on 10/12/16.
//  Copyright © 2016 Matt Weems. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let activity = Activity(title: "Fishing", conditions: [Condition(name: "temp", ideal: 10, max: 20, min: 0)]);
    let currentTemp:Double = 18;
    
    
    

    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var activityName: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayActivity()
    }
    
    func displayActivity(){
        self.todayDate.text = getDate()
        self.activityName.text = self.activity.title
        let dayRating = getRating(self.activity)
        self.rating.text = "\(dayRating) of 10"
    }
    
    func getDate() -> String{
        let today = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        return formatter.stringFromDate(today)
    }
    
    func getRating(act: Activity) -> Int {
        let cc = ConditionChecker(currentTemp: currentTemp)
        let condition = act.getCondition("temp")
        let val = cc.checkTemp(condition)
        return Int(val)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

