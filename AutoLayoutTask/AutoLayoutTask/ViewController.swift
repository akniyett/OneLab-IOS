//
//  ViewController.swift
//  AutoLayoutTask
//
//  Created by Akniyet Turdybay on 11.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView!
    var view2: UIView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        createConstrains()
    }
    
    func initViews(){
        
        self.view1 = UIView()
        self.view2 = UIView()
        self.imageView = UIImageView()
        
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        view1.backgroundColor = UIColor.lightGray
        view2.backgroundColor = UIColor.darkGray
        imageView.backgroundColor = UIColor.white
        imageView.image = UIImage(named: "wall")
        imageView.contentMode = .scaleAspectFill
        imageView.frame.size.width = 200
        imageView.frame.size.height = 200
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(imageView)
        
    }
//    enum Attribute{
//        case left
//    }
    
    func createConstrains(){
        //create view1
        let pinLeftView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0)
        
        let pinTopView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        
        let pinRightView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0)
        
        let verticalView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view2, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        
        let heightView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.65, constant: 0)
        
//        let pinBottomView1 = NSLayoutConstraint(item: view1!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        //Create view2
        let pinLeftView2 = NSLayoutConstraint(item: view2!, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1.0, constant: 0)
        
        let pinBottomView2 = NSLayoutConstraint(item: view2!, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        
        let pinRightView2 = NSLayoutConstraint(item: view2!, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1.0, constant: 0)
        
        //create imageView
        
        let centerXImage = NSLayoutConstraint(item: imageView!, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view1, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1.0, constant: 0)
        
        let centerYImage = NSLayoutConstraint(item: imageView!, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view1, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1.0, constant: 0)
        
        let widthImage = NSLayoutConstraint(item: imageView!, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: imageView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0.0, constant: 200)
        
        let heightImage = NSLayoutConstraint(item: imageView!, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: imageView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0.0, constant: 200)
        
        self.view.addConstraints([pinLeftView1, pinTopView1, pinRightView1, heightView1, pinLeftView2, pinRightView2, pinBottomView2, verticalView1, centerXImage, centerYImage, widthImage, heightImage])
    }
    
    


}

