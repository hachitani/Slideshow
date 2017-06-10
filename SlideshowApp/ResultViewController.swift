//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 栄藤徹平 on 2017/06/10.
//  Copyright © 2017年 栄藤徹平. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultImage: UIImageView!
    
    let imageNames: [String] = ["IMG_1785.JPG",
                                "IMG_1786.JPG",
                                "IMG_1921.JPG",]
    
    var x = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultImage.image = UIImage(named: imageNames[x])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
