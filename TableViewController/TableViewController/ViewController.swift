//
//  ViewController.swift
//  TableViewController
//
//  Created by Akniyet Turdybay on 28.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var students = [Student.init("Balausa", "87074562345", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("Akniyet Turdybay", "89045623419", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("Elvina Shamoi", "87471294578", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("Mom", "87471294578", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("Sister", "87471294578", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("жена нанами", "87471294578", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("Alina", "87471294578", UIImage(named: "E9rBn1RWQAEgyoq")!),
                    Student.init("zhaisan", "87471294578", UIImage(named: "Geto-Suguru")!)]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count;
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as? CustomCell
        cell?.studentName.text = students[indexPath.row].name;
        cell?.studentPhoneNumber.text = students[indexPath.row].phoneNumber;
        cell?.studentImageView.image = students[indexPath.row].image;
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        navigationController?.pushViewController(detailsVC, animated: true)
        myTableView.deselectRow(at: indexPath, animated: true);
    }

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = (myTableView.indexPathForSelectedRow?.row)!;
        let destination = segue.destination as! DetailViewController;
        destination.fullname = students[index].name;
        destination.image = students[index].image;
        destination.number = students[index].phoneNumber

        
    }


}

