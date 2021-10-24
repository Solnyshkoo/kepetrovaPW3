//
//  StackViewController.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 20.10.2021.
//


import UIKit
class StackViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        AlarmModel.alarms.count
    }
    let cellId = "alarm"
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let alarm = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AlarmView
        alarm.layer.masksToBounds = true
        alarm.button.isOn = AlarmModel.alarms[indexPath.row].button
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
        alarm.text.text = hours + ":" + minutes;
        alarm.button.tag = indexPath.row
        alarm.button.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        return alarm;
        
    }
    
    @objc
    func changeValue(_ state: UISwitch) {
        if state.isOn {
            AlarmModel.alarms[state.tag].button = true;
        } else {
            AlarmModel.alarms[state.tag].button = false;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        setupStackView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setupStackView()
        
    }
    
    let scroll = UIScrollView()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize( width: self.scroll.frame.width,
                                     height: self.scroll.frame.height
        )
    }
    
    
    private func setupStackView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.sectionInset = UIEdgeInsets(top: 5, left: 10,
                                               bottom: 0, right: 10)
        layoutFlow.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.dataSource = self
        collection.delegate = self
        collection.register(AlarmView.self, forCellWithReuseIdentifier: cellId)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .white
        collection.showsVerticalScrollIndicator = true
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.masksToBounds = true
    }
    
}
