//
//  DetailViewController.swift
//  TableViewController
//
//  Created by Akniyet Turdybay on 29.03.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var fullname: String?
    var image: UIImage?
    var number:String?
   
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var fullnameLable: UILabel!
    
    @IBOutlet weak var mobile: UILabel!
    
    
    @IBAction func addNotes(_ sender: UITextField) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullnameLable.text = fullname
        contactImage.image = image
        mobile.text = number
//        layer.cornerRadius = 5;÷
        
        // Do any additional setup after loading the view.
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
