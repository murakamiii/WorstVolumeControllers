//
//  FirstViewController.swift
//  WorstVolumeControllers
//
//  Created by MURAKAMI on 2017/07/09.
//  Copyright © 2017年 MURAKAMI. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let VCArray: [String] = ["VolumeController"
                             , "VolumeControllerBalance"
                            ]
    
    @IBOutlet weak private var volumeControllUICollection: UICollectionView!
    let firstViewMusicPlayerController: MusicPlayerController = MusicPlayerController.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: collectionview
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VCArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc: UIViewController? = UIStoryboard(name: VCArray[indexPath.row], bundle: nil).instantiateInitialViewController()
        if let vcvc = vc {
            self.navigationController?.pushViewController(vcvc, animated: true)
        }
    }
}
