//
//  ViewController.swift
//  Stopwatch2
//
//  Created by 五島甫 on 2018/07/07.
//  Copyright © 2018年 Hajime Goshima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    var timer: Timer = Timer()
    var startDate: Date = Date()
    
    @IBAction func startButton(_ sender: UIButton) {
        print("action startButton")
        startDate = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.timerCounter), userInfo: nil, repeats: true)
    }
    @IBAction func stopButton(_ sender: UIButton) {
        print("action stopButton")
        timer.invalidate()
    }
    @IBAction func resetButton(_ sender: UIButton) {
        print("action resetButton")
        timer.invalidate()
        timeLabel.text = "00:00:00.00"
    }
    
    @objc func timerCounter() {
        let now = Date()
        let dateComponents = Calendar.current.dateComponents([.hour, .minute, .second, .nanosecond], from: startDate, to: now)
        let hour = String(format: "%02d", dateComponents.hour!)
        let monute = String(format: "%02d", dateComponents.minute!)
        let second = String(format: "%02d", dateComponents.second!)
        
        let temp = String(dateComponents.nanosecond!)
        let startIndex = temp.startIndex
        let range = startIndex...temp.index(startIndex, offsetBy: 1)
        
        let nanosecond = String(format: "%02d", dateComponents.nanosecond!)[range]
        timeLabel.text = "\(hour):\(monute):\(second).\(nanosecond)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

