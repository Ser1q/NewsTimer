//
//  ViewController.swift
//  NewsTimer
//
//  Created by Nuradil Serik on 26.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageDetailedNews: UIImageView!
    
    @IBOutlet weak var labelDetailTitle: UILabel!
    
    @IBOutlet weak var labelDetailText: UILabel!
    
    var detailTitle = ""
    var detailText = ""
    var detailImageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageDetailedNews.image = UIImage(named: detailImageName)
        labelDetailTitle.text = detailTitle
        labelDetailText.text = detailText
        
        labelDetailText.sizeToFit()
        
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
