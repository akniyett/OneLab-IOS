//
//  ViewController.swift
//  SnapKitTask
//
//  Created by Akniyet Turdybay on 11.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializer()
        
    }
    private func initializer(){
        view.backgroundColor = UIColor(red: 241/255, green: 238/255, blue: 228/255, alpha: 1)
        
        let label = UILabel()
        label.text = "🤡 Welcome!"
        label.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset(150)
        }
        
        let extraLabel = UILabel()
        extraLabel.numberOfLines = 0
        extraLabel.text = "some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text"
        
        view.addSubview(extraLabel)
        extraLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(50)
            make.top.equalTo(label).inset(50)
            
        }
        
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Get your username ->", for: .normal)
        button.backgroundColor = UIColor(red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        button.layer.cornerRadius = 20
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(30)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
    }
    
    @objc private func buttonTapped(){
        print("tapped")
    }


}

