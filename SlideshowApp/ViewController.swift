//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 栄藤徹平 on 2017/06/10.
//  Copyright © 2017年 栄藤徹平. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var startstop: UIButton!
    
    @IBOutlet weak var gogo: UIButton!
    
    @IBOutlet weak var backback: UIButton!
    
    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    
    let imageNames: [String] = ["IMG_1785.JPG",
                                "IMG_1786.JPG",
                                "IMG_1921.JPG",]
    
    var imageIndex: Int = 0
    
    var timer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        img.image = UIImage(named: imageNames[imageIndex])
        startstop.setTitle("再生", for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func go(_ sender: Any) {
        imageIndex += 1
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
        img.image = UIImage(named: imageNames[imageIndex])
    }
    
    @IBAction func back(_ sender: Any) {
        imageIndex -= 1
        if imageIndex < 0 {
            imageIndex = imageNames.count - 1
        }
        img.image = UIImage(named: imageNames[imageIndex])
    }

    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(go), userInfo: nil, repeats: true)
            startstop.setTitle("停止", for: .normal)
            gogo.alpha = 0
            backback.alpha = 0
        } else {
            self.timer.invalidate()
            self.timer = nil
            startstop.setTitle("再生", for: .normal)
            gogo.alpha = 1
            backback.alpha = 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているxに値を代入して渡す
        resultViewController.x = imageIndex
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}

