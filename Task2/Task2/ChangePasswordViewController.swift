//
//  ChangePasswordViewController.swift
//  Task2
//
//  Created by Akniyet Turdybay on 15.04.2022.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {

    
    let headerView = UIView()
    let passwordContainer = UIView()
    var visibleCurPass = UIButton()
    let hideNewPass = UIButton()
    let saveButton = UIButton()
    var currentPassword = UITextField()
    var newPassword = UITextField()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(headerView)
        
        
        headerContainer()
        passwordControl()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                            name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    @objc func keyboardWillHide(notification: Notification) {

        saveButton.snp.remakeConstraints { make in
            make.top.equalTo(view.snp.bottom).inset(110)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(20)
        }
      }
    
    
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).inset(keyboardHeight + saveButton.frame.height + 10)
        }
  }
    private func headerContainer(){

        headerView.backgroundColor = .white
        headerView.snp.makeConstraints { make in
            make.top.equalTo(self.view)
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(0.1)
            
        }
        
        
        let cancelButton = UIButton(type: .system)
        headerView.addSubview(cancelButton)


        cancelButton.setImage(UIImage(named: "arrow3"), for: .normal)
        cancelButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

        cancelButton.snp.makeConstraints { make in
            make.left.equalTo(headerView).inset(20)
            make.width.equalTo(20)
            make.height.equalTo(20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(7)
        }
        
        
        let appLabel = UILabel()
        appLabel.text = "Изменить пароль"
        appLabel.font = UIFont(name: "Montserrat", size: 40)
        
        appLabel.textColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1)
        appLabel.font = UIFont.systemFont(ofSize: 23)
        appLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerView.addSubview(appLabel)

        appLabel.snp.makeConstraints { make in
            make.width.equalTo(self.view)
            make.leading.equalTo(headerView.snp.leading).inset(80)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(5)
        }
        
        

    }
    @objc func goBack(){
        self.dismiss(animated: true)
    }
    
    private func containerMaker(topView: UIView) -> UIView{
        let viewer = UIView()
        viewer.layer.borderWidth = 1
        viewer.layer.borderColor = UIColor.systemBlue.cgColor
        viewer.layer.cornerRadius = 10
        view.addSubview(viewer)
        viewer.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(20)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(10)
        }

        return viewer
    }
    
    private func makeTextField(parentView: UIView, text: String, placeholder: String, interaction: Bool, secure: Bool) -> UITextField{
        let textWriter = UITextField()
        textWriter.placeholder = placeholder
        
        textWriter.text = text
        textWriter.isUserInteractionEnabled = interaction
        textWriter.isSecureTextEntry = secure
        parentView.addSubview(textWriter)
        textWriter.snp.makeConstraints { make in
            make.top.equalTo(parentView.snp.top).offset(15)
            make.height.equalTo(40)
            make.leading.trailing.equalTo(parentView).inset(20)
        }
        
        return textWriter
    }
    
    private func makePlacholder(text: String, parentView:UIView) -> UILabel{
        let placeholder  = UILabel()
        placeholder.text = text
        placeholder.font = UIFont.systemFont(ofSize: 15)
        parentView.addSubview(placeholder)
        placeholder.snp.makeConstraints { make in
            make.top.equalTo(parentView.snp.top).inset(5)
            make.leading.equalTo(parentView).inset(20)
        }
        return placeholder
        
    }
    private func displayPassword(image:String, parentView: UIView) -> UIButton{
        let button  = UIButton()
        button.setImage(UIImage(named: image), for: .normal)
        parentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.trailing.equalTo(parentView).inset(20)
            make.centerY.equalTo(parentView)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        return button
    }
    func passwordControl(){
        
       
        let passwordContainer = containerMaker(topView: headerView)

        currentPassword = makeTextField(parentView: passwordContainer, text: "@dVerT!z1nG", placeholder: "Текущий пароль", interaction: false, secure: true)
        
        visibleCurPass = displayPassword(image: "hidden", parentView: passwordContainer)
        visibleCurPass.addTarget(self, action: #selector(hidePass(_:)), for: .touchUpInside)
        
        

        let placeholder = makePlacholder(text: "Текущий пароль", parentView: passwordContainer)
        
        

        let newContainer = containerMaker(topView: passwordContainer)
        
        newPassword = makeTextField(parentView: newContainer, text: "", placeholder: "Новый пароль", interaction: true, secure: true)
       
        
        let hideNewPass = displayPassword(image: "hidden", parentView: newContainer)
        hideNewPass.addTarget(self, action: #selector(self.hideNewPass(_:)), for: .touchUpInside)
    
        let newPlaceholder = makePlacholder(text: "Новый пароль", parentView: newContainer)
        
    
        let repeatPass = containerMaker(topView: newContainer)

        let repeatNewPassword = makeTextField(parentView: repeatPass, text: "", placeholder: "Повторите новый пароль", interaction: true, secure: true)
         
        repeatNewPassword.snp.remakeConstraints { make in
            make.centerY.equalTo(repeatPass)
            make.height.equalTo(40)
            make.leading.trailing.equalTo(repeatPass).inset(20)
        }
        
        let forgotPass = UILabel()
        
        forgotPass.textColor = .darkGray
        let attributedString = NSMutableAttributedString.init(string: "Забыли пароль?")
        
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        forgotPass.attributedText = attributedString
        forgotPass.font = UIFont.systemFont(ofSize: 15)
        view.addSubview(forgotPass)
        forgotPass.snp.makeConstraints { make in
            make.top.equalTo(repeatPass.snp.bottom).offset(30)
            make.centerX.equalTo(view)
        }
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.darkGray, for: .normal)
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.systemGray.cgColor
        saveButton.layer.cornerRadius = 10
        view.addSubview(saveButton)
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).inset(110)
            make.height.equalTo(60)
            make.leading.trailing.equalTo(view).inset(20)
            

            
        }
    }
    @objc func hidePass(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        
        if (sender as! UIButton).isSelected{
            self.currentPassword.isSecureTextEntry =  false
            visibleCurPass.setImage(UIImage(named: "visible"), for: .normal)
        }else{
            self.currentPassword.isSecureTextEntry = true
            visibleCurPass.setImage(UIImage(named: "hidden"), for: .normal)
        }
        
    }
    
    @objc func hideNewPass(_ sender: Any){
        (sender as! UIButton).isSelected = !(sender as! UIButton).isSelected
        
        if (sender as! UIButton).isSelected{
            self.newPassword.isSecureTextEntry =  false
            hideNewPass.setImage(UIImage(named: "visible"), for: .normal)
        }else{
            self.newPassword.isSecureTextEntry = true
            hideNewPass.setImage(UIImage(named: "hidden"), for: .normal)
        }
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
        
    }
    
   

    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
