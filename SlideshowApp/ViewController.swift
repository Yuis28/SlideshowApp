//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 杉田優衣 on 2022/05/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func previousButton(_ sender: Any) {
        dispImageNo -= 1
        //表示している画像の番号をもとに画像を表示する
        displayImage()
    }
    @IBAction func nextButton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    @IBAction func startStopButton(_ sender: Any) {
    }
    
    var dispImageNo = 0
    func displayImage() {
        
        let imageNameArray = [
            "0",
            "1",
            "2"
        ]
        
        //表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        //画像を読み込み
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //他の画面から segue を使って戻ってきた時に呼ばれる
    }


}

