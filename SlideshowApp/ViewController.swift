//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 杉田優衣 on 2022/05/08.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var imageArray: [String] = [
         "image1.jpeg","image2.jpeg","image3.jpeg"
    ]
    
    @IBAction func previousButton(_ sender: Any) {
        dispImageNo -= 1
        //表示している画像の番号をもとに画像を表示する
        displayImage()
    }
    @IBAction func nextButton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    @IBOutlet weak var startButton: UIButton!
    
    var dispImageNo = 0
    func displayImage() {
        if dispImageNo < 0 {
            dispImageNo = 2
        }
        
        if dispImageNo > 2 {
            dispImageNo = 0
        }
        //表示している画像の番号から名前を取り出し
        let name = imageArray[dispImageNo]
        let image = UIImage(named: name)
        
        imageView.image = image
    }
    
    //outletの接続
    //配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    //スライドショーに使用するタイマーを宣言
    var timer: Timer!
    
    //再生ボタンを押したときの処理
    @IBAction func startButton(_ sender: Any) {
        if (timer == nil) {
                //再生時の処理を実装
                //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
                //ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
        } else {
                //停止時の処理を実装
                //タイマーを停止する
                timer.invalidate()
                
                    //タイマーを削除しておく(timer.invalidate だけだとtimerがnilにならないため)
                timer = nil
                
                //ボタンの名前を再生に直しておく
                startButton.setTitle("再生", for: .normal)
            }
    }
    
    
    @objc func changeImage() {
        //indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        //indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            //indexを一番最初の数字に戻す
            nowIndex = 0
        }
        //indexの画像をstoryboardの画像にセットする
        imageView.image = UIImage(named:imageArray[nowIndex])
    }
    
    @IBAction func nextImage(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! secondViewController
        secondViewController.image = imageView.image
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //他の画面から segue を使って戻ってきた時に呼ばれる
    }


}

