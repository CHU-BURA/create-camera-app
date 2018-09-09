//
//  ViewController.swift
//  CameraApp
//
//  Created by Sho Nozaki on 2018/09/09.
//  Copyright © 2018年 sho.nozaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
     カメラ起動
     */
    @IBAction func cameraLaunchAction(_ sender: Any) {
        
        // カメラの起動確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("カメラは使用可能です")
            // カメラのデータ取得
            let ipc = UIImagePickerController()
            ipc.sourceType = .camera
            ipc.delegate = self
            present(ipc, animated: true, completion: nil) // カメラのダイアログ表示
            
        } else {
            print("カメラは使用不可能です")
        }
    }
  
    /*
     SNS投稿
     */
    @IBAction func shareAction(_ sender: Any) {
        if let shareImage = photoImageView.image {
            let shareItems = [shareImage]
            let avc = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
            avc.popoverPresentationController?.sourceView = view // iPad対応
            present(avc, animated: true, completion: nil) // SNS投稿用のメニュー表示
        } else {
            print("投稿する写真がありません")
        }
    }
    
    
    /*
     カメラ撮影後に呼ばれる処理
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        photoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage // 撮影写真の取得・設定
        dismiss(animated: true, completion: nil) // カメラのダイアログを閉じる
    }
    
}

