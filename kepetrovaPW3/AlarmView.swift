//
//  AlarmView.swift
//  kepetrovaPW3
//
//  Created by Ksenia Petrova on 20.10.2021.
//

import UIKit

class AlarmView: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addView()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var button: UISwitch = {
        let control = UISwitch()
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    var text: UILabel = {
        let control = UILabel()
        control.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        control.textAlignment = .center
        control.textColor = UIColor.black
        control.text = "30"
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    
    func addView(){
        addSubview(text)
        addSubview(button)
        text.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        text.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -27).isActive = true
        button.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        button.heightAnchor.constraint(equalToConstant: 36).isActive = true
        button.widthAnchor.constraint(equalToConstant: 36).isActive = true
    }
}
