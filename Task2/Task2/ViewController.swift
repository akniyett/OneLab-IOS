//
//  ViewController.swift
//  Task2
//
//  Created by Akniyet Turdybay on 14.04.2022.
//

import UIKit
import SnapKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let myArray = ["Push уведомления", "Изменить пароль", "Изменить код быстрого доступа", "Вход с Face/Touch ID", "Изменить номер телефона", "Выход"]
    
    var myTableView: UITableView!
    let headerView = UIView()
    let imageHolder = UIView()
    let actionButton = UIButton(type: .system)
    var imageView: UIImageView! = UIImageView()
    var imagePicker: ImagePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        headerContainer()
        imageSelection()
        
        tableController()

        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        self.imagePicker.present(from: actionButton)
        self.didSelect(image: imageView.image)
        
        
        actionButton.addTarget(self, action: #selector(showImagePicker(sender:)), for: .touchUpInside)
        actionButton.isUserInteractionEnabled = true
    }

    
    
    func tableController(){
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height


        myTableView = UITableView()
        self.view.addSubview(myTableView)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.snp.makeConstraints { make in
            make.top.equalTo(imageHolder.snp.bottom)
            make.width.equalToSuperview()
            make.height.equalTo(500)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 1{
            let changePwd = ChangePasswordViewController()
            changePwd.modalPresentationStyle = .fullScreen
            show(changePwd, sender: self)
            
        }
        myTableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        cell.textLabel?.textColor = .systemGray
        
        if indexPath.row == (myArray.count - 1){
            cell.textLabel?.textColor = .red
        }
        
        if indexPath.row == 0 || indexPath.row == 3{
            let cellSwitch = UISwitch()
            cellSwitch.layer.cornerRadius = 15
            cellSwitch.onTintColor = .systemBlue
            cell.addSubview(cellSwitch)
            cellSwitch.snp.makeConstraints { make in
                make.centerY.equalTo(cell)
                make.right.equalTo(cell.snp.right).inset(20)
            }
        }
        
            else{
                let cellButton = UIButton()
                cellButton.setImage(UIImage(named: "arrow2"), for: .normal)
                cellButton.setTitleColor(.darkGray, for: .normal)
                cell.addSubview(cellButton)
                cellButton.snp.makeConstraints { make in
                    make.centerY.equalTo(cell)
                    make.right.equalTo(cell.snp.right).inset(20)
                    make.width.equalTo(20)
                    make.height.equalTo(20)
                }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    
    @objc func showImagePicker(sender: UIButton){
        
        print("button pressed")
        self.imagePicker.present(from: sender)
    }
    
    private func imageSelection(){
        
        view.addSubview(imageHolder)
        imageHolder.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(headerView.snp.bottom).offset(40)
            make.height.equalTo(200)
        }

        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.darkGray.cgColor
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        view.bringSubviewToFront(imageView)
        imageHolder.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(imageHolder.snp.top)
            make.centerX.equalTo(view)
            make.height.equalTo(100)
            make.width.equalTo(100)
            
        }

        
        
        imageHolder.addSubview(actionButton)
       
        
        actionButton.setImage(UIImage(named: "addPhoto"), for: .normal)
        actionButton.backgroundColor = .white
        actionButton.snp.makeConstraints { make in
            make.right.equalTo(imageView.snp.right).inset(5)

            make.height.equalTo(30)
            make.width.equalTo(30)
            make.top.equalTo(imageView.snp.bottom).inset(30)

        }
        imageView.bringSubviewToFront(actionButton)
        
        let fullname = makeLabel(color: .darkGray, fontSize: 20, text: "Мария Атрисова", boldText: 15)
        imageHolder.addSubview(fullname)
        fullname.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.height.equalTo(30)
        }
        
        let email = makeLabel(color: .systemGray, fontSize: 18, text: "maria.atrisova@gmail.com", boldText: 15)
        imageHolder.addSubview(email)
        email.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fullname.snp.bottom).offset(5)
            
        }
    }
    
    private func makeLabel(color: UIColor, fontSize: Int, text: String, boldText: Int) -> UILabel{
        let label = UILabel()
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        label.text = text
        label.font = UIFont.boldSystemFont(ofSize: CGFloat(boldText))
        return label
    }
    
   
   
    
    
    private func headerContainer(){

        headerView.backgroundColor = .white

        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
        }
        
        let cancelButton = UIButton(type: .system)
        headerView.addSubview(cancelButton)
        cancelButton.setImage(UIImage(named: "arrow3"), for: .normal)

        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(headerView).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(7)
            make.width.equalTo(20)
            make.height.equalTo(20)

        }
        
        
        let appLabel = makeLabel(color: UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1), fontSize: 23, text: "Профиль", boldText: 20)
        headerView.addSubview(appLabel)
        appLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.leading.equalTo(headerView.snp.leading).inset(80)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(5)
        }
        
        

    }
    

    
   


}
extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}

