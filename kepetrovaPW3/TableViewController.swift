//
//  TableViewController.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 20.10.2021.
//

import UIKit
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                    section: Int) -> Int {
        AlarmModel.alarms.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}


extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
                    IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "eyeCell",
            for: indexPath
        ) as? EyeCell
        cell?.addView()
        cell?.button.isOn = AlarmModel.alarms[indexPath.row].button
        var hours: String
        if AlarmModel.alarms[indexPath.row].time / 60 <= 9 {
            hours = "0" + String(AlarmModel.alarms[indexPath.row].time / 60)
        } else {
            hours = String(AlarmModel.alarms[indexPath.row].time / 60)
        }
        var minutes:String
        if  AlarmModel.alarms[indexPath.row].time % 60 <= 9{
            minutes = "0" + String(AlarmModel.alarms[indexPath.row].time % 60)
        } else {
            minutes = String(AlarmModel.alarms[indexPath.row].time % 60)
        }
        cell?.text.text = hours + ":" + minutes;
        cell?.button.tag = indexPath.row
        cell?.button.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return cell ?? UITableViewCell()
    }
    
    @objc
    func changeValue(_ state: UISwitch) {
        if state.isOn {
            AlarmModel.alarms[state.tag].button = true;
        } else {
            AlarmModel.alarms[state.tag].button = false;
        }
    }
    
}


class TableViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        for _ in 0...200 { AlarmModel.alarms.append(
            AlarmModel(
                time: Int.random(in: 0...(24 * 60)),
                button: Bool.random()
            )
        )
        }
        AlarmModel.alarms.sort(by: { $0.time < $1.time })
        viewDidAppear(true)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTableView()
    }
    
    var table = UITableView()
    
    
    
    private func setupTableView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 5, left: 10,
                                               bottom: 0, right: 10)
        layoutFlow.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        
        view.addSubview(table)
        table.register(EyeCell.self, forCellReuseIdentifier: "eyeCell")
        
        table.delegate = self
        table.dataSource = self
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        table.backgroundColor = .orange
        table.showsVerticalScrollIndicator = true
        table.translatesAutoresizingMaskIntoConstraints = false
        table.layer.masksToBounds = true
    }
    
}





