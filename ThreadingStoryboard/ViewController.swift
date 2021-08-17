//
//  ViewController.swift
//  ThreadingStoryboard
//
//  Created by Atil Samancioglu on 17.08.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let urlStrings = ["https://assets.entrepreneur.com/content/3x2/2000/20200429211042-GettyImages-1164615296.jpeg","https://global-uploads.webflow.com/5e2d970a86f417102b21abd2/5fb6272c50c16ac33c0e1b06_5f92b527aee25a8c3463dac7_5eaace7e60a79172b8c90108_Blog%2520Hero%2520Image%2520Template%2520(4)-2.jpeg"]

    var tracker = 0
    var data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
       
            DispatchQueue.global().async {
                self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: self.data)
                }
            }
      

        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
    }
    
    @objc func changeImage() {
        if tracker == 0 {
            tracker += 1
        } else {
            tracker -= 1
        }
        
            DispatchQueue.global().async {
                self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!)
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: self.data)
                }
            }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threading Test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }


}

