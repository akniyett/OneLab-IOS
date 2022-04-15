//
//  ViewController.swift
//  Reminder
//
//  Created by Akniyet Turdybay on 11.04.2022.
//

import UIKit
import SnapKit

extension UISegmentedControl{
    func selectedSegmentTintColor(_ color: UIColor, _ color2: UIColor) {
        
        self.setTitleTextAttributes([.foregroundColor: color, .backgroundColor: color2], for: .selected)

    }
    func unselectedSegmentTintColor(_ color: UIColor, _ color2: UIColor) {
        self.setTitleTextAttributes([.foregroundColor: color, .backgroundColor: color2], for: .normal)
        self.selectedSegmentTintColor = .white
    }
}


class ViewController: UIViewController {
    
    
    var segmentedControl = UISegmentedControl()
    let mainView = UIView()
    let headerView = UIView()
    var dateShow = UITextField()
    let itemList = ["None", "!", "!!", "!!!"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        segmentedControl =  {
            
            let control = UISegmentedControl(items: itemList)
            
            control.selectedSegmentIndex = 0
        
            
            control.layer.borderWidth = 1
            return control
        }()
        
        segmentedControl.addTarget(self, action: #selector(valueControl), for: .valueChanged)

        segmentedControl.setBackgroundImage(UIImage(named: "back"), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(named: "selected"), for: .selected, barMetrics: .default)
    
        
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(headerView)
        view.addSubview(mainView)

        
        
        headerContainer()
        mainContainer()

    }
    @objc func valueControl(){
        if segmentedControl.selectedSegmentIndex != 0{
            print (itemList[segmentedControl.selectedSegmentIndex])
        }
    }
    
    private func headerButtons(title: String) -> UIButton{
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)


        button.setTitle(title, for: .normal)
        
        return button
    }
    private func headerContainer(){

        headerView.backgroundColor = .white


        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
            

        }
        
        let cancelButton = headerButtons(title: "Cancel")
        headerView.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(headerView).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(0)

        }
        
        
        let appLabel = UILabel()
        appLabel.text = "Create Reminder"
        appLabel.font = UIFont.systemFont(ofSize: 20)
        appLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(appLabel)

        appLabel.snp.makeConstraints { make in
            make.centerX.equalTo(headerView)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(5)
        }
        
        let doneButton = headerButtons(title: "Done")
        doneButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(doneButton)
        doneButton.snp.makeConstraints { make in
            make.right.equalTo(headerView).inset(15)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(0) // заменить процентом

        }


    }
    
    private func makeView(topView: UIView, heightView: Int) -> UIView{
        let viewer = UIView()
        viewer.backgroundColor = .white
        mainView.addSubview(viewer)
        viewer.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(40)
            make.width.equalToSuperview()
            make.height.equalTo(CGFloat(heightView))

        }
        return viewer
    }
    
    private func makeLabel(text: String, parentView: UIView, topView: UIView, topCons: Int) -> UILabel{
        let lable = UILabel()
        lable.text = text
        lable.textColor = .darkGray
        lable.textAlignment = .left
        lable.font = UIFont.systemFont(ofSize: 20)
        parentView.addSubview(lable)
        lable.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(CGFloat(topCons))
            make.width.equalToSuperview()
            make.leading.equalTo(parentView).offset(15)
            make.height.equalTo(50)

        }
        return lable
    }
    
    private func switcher(parentView: UIView, centerView: UIView) -> UISwitch{
        let switcher = UISwitch()
        switcher.layer.cornerRadius = 15
        parentView.addSubview(switcher)

        switcher.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(10)
            make.centerY.equalTo(centerView)
        }
        return switcher
    }

    
    private func mainContainer(){
        
        mainView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        let reminderTextView = makeView(topView: headerView, heightView: 50)

        
        let reminderText = makeLabel(text: "Get Groceries", parentView: reminderTextView, topView: headerView, topCons: 40)

        
        
        
        let text2View = makeView(topView: reminderTextView, heightView: 365)
    
        
        let text2 = makeLabel(text: "Remind me on a day", parentView: text2View, topView: reminderTextView, topCons: 40)
        
        


        let switcher2 = switcher(parentView: text2View, centerView: text2)
        
        
        
        
        dateShow.font = UIFont.systemFont(ofSize: 20)
        dateShow.textColor = .systemBlue
        text2View.addSubview(dateShow)
        dateShow.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(text2.snp.bottom)
            make.leading.equalTo(text2View).offset(15)
            make.height.equalTo(50)
            
        }
        

        

        let datePicker = UIDatePicker()
        
        datePicker.preferredDatePickerStyle = .wheels

        
        text2View.addSubview(datePicker)
        
        datePicker.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(dateShow.snp.bottom).inset(20)
            make.height.equalTo(250)
            
        }

        datePicker.addTarget(self, action: #selector(self.valueChanged(_:)), for: UIControl.Event.valueChanged)
        
        let repeatReminder = makeLabel(text: "Repeat", parentView: text2View, topView: datePicker, topCons: -15)
        
        
        
        let repeatButton = UIButton(type: .custom)
        repeatButton.setTitle("Never", for: .normal)
        repeatButton.setTitleColor(.systemGray, for: .normal)
        repeatButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        repeatReminder.addSubview(repeatButton)

        repeatButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(50)
            make.centerY.equalTo(repeatReminder)
        }
        
        let forward = UIImageView()
        forward.image = UIImage(named: "arrow3")
        repeatReminder.addSubview(forward)
        forward.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(20)
            make.centerY.equalTo(repeatReminder)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
        
        let locationView = makeView(topView: text2View, heightView: 50)

        
        let locationText = UILabel()
        locationText.text = "Remind me at a location"
        locationText.font = UIFont.systemFont(ofSize: 20)
        locationView.addSubview(locationText)
        locationText.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.equalTo(locationView).inset(15)
            make.height.equalTo(50)
        }
        
        let switcher1 = switcher(parentView: locationView, centerView: locationView)

        
        
        let controlPanel = makeView(topView: locationView, heightView: 80)
        
        let controlText = UILabel()
        controlText.backgroundColor = .white
        controlText.text = "Priority"
        
        controlText.font = UIFont.systemFont(ofSize: 20)
        controlPanel.addSubview(controlText)
        controlText.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.equalTo(controlPanel).inset(15)
            make.height.equalTo(50)

        }
        

        
        segmentedControl.backgroundColor =  UIColor.white
        segmentedControl.selectedSegmentTintColor(.white, .clear)
        segmentedControl.unselectedSegmentTintColor(.systemBlue, .clear)
        segmentedControl.layer.borderWidth = 1
        segmentedControl.layer.borderColor = UIColor.systemBlue.cgColor
        controlPanel.addSubview(segmentedControl)
        
        segmentedControl.snp.makeConstraints { make in
                    make.width.equalTo(220)
            make.right.equalToSuperview().inset(10)
                    make.centerY.equalTo(controlText)
            make.height.equalTo(UIScreen.main.bounds.height / 25)
        }
        
        let notes = UIView()
        notes.backgroundColor = .white
        mainView.addSubview(notes)
        notes.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(controlText.snp.bottom)
            make.height.equalTo(UIScreen.main.bounds.height / 9)
        }
        
        
        
        let notesText = UILabel()
        notesText.text = "Notes"
        notes.addSubview(notesText)
        notesText.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.equalTo(notes).inset(15)
            
        }
      
        let enterText = UITextView()
        notes.addSubview(enterText)
        enterText.snp.makeConstraints { make in
            make.top.equalTo(notesText.snp.bottom)
            make.leading.equalTo(notes).inset(15)
        }
        print(controlPanel.heightAnchor)
        print(notes.heightAnchor)
        
        
        
        
    }
    @objc func valueChanged(_ datePicker: UIDatePicker) {
        let date = datePicker.date as NSDate
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        dateShow.text = formatter.string(from: date as Date)
        self.view.endEditing(true)
        print(date)
    }
    

   
}

