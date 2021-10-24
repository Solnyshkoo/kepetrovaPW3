//
//  AlarmCreator.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 24.10.2021.
//

import UIKit
class AlarmCreator: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        title = "New alarm"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(saveAlarm))
        setCreator()
    }
    @objc func saveAlarm() {
        let format = DateFormatter()
        format.dateFormat = "hh:mm"
        var k = format.string(from: time.date)
        let first = k.firstIndex(of: ":") ?? k.endIndex
        let hours  = k[..<first]
        k.remove(at: k.index(after: k.startIndex))
        k.remove(at: k.index(after: k.startIndex))
        k.remove(at: k.index(after: k.startIndex))
        
        let total = (Int(hours)! * 60 + Int(k)!) * 60
        AlarmModel.alarms.append(
            AlarmModel(
                time: total,
                button: true
            )
        )
        
        self.navigationController?.popViewController(animated: true)
        
    }
    var prev = UIView()
    let time = UIDatePicker()
    
    func setCreator(){
        view.addSubview(time)
        time.datePickerMode = UIDatePicker.Mode.time
        time.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        time.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        time.translatesAutoresizingMaskIntoConstraints = false
    }
}
