//
//  ViewController.swift
//  jaikenApp
//
//  Created by kentaro on 2016/05/25.
//  Copyright © 2016年 kentaro aoki. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    let ramdomSource = GKARC4RandomSource()
    
    @IBOutlet weak var computerimageView: UIImageView!
    @IBOutlet weak var playerimageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let angle:CGFloat = CGFloat((180.0 * M_PI) / 180.0)
        computerimageView.transform = CGAffineTransformMakeRotation(angle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapStart() {
        computerimageView.image = UIImage(named: "janken-gu.png")
        playerimageView.image = UIImage(named: "janken-gu.png")
        
        messageLabel.text = "じゃんけん！"
    }

    @IBAction func tapGu() {
        playerimageView.image = UIImage(named: "janken-gu.png")
        doComputer(0);
    }
    @IBAction func tapChoki() {
        playerimageView.image = UIImage(named: "janken-choki.png")
        doComputer(1);
    }
    @IBAction func tapPa() {
        playerimageView.image = UIImage(named: "janken-pa.png")
        doComputer(2);
    }
    
    func doComputer(player:Int) {
        let computer = ramdomSource.nextIntWithUpperBound(3)
        var msg = ""
        
        switch computer {
        case 0:
            computerimageView.image = UIImage(named: "janken-gu.png")
            
            switch player {
            case 0:
                msg = "あいこ"
            case 1:
                msg = "あなたの負け"
            case 2:
                msg = "あなたの勝ち"
            default:
                break
            }

        case 1:
            computerimageView.image = UIImage(named: "janken-choki.png")
            
            switch player {
            case 0:
                msg = "あなたの勝ち"
            case 1:
                msg = "あいこ"
            case 2:
                msg = "あなたの負け"
            default:
                break
            }
            
        case 2:
            computerimageView.image = UIImage(named: "janken-pa.png")
            
            switch player {
            case 0:
                msg = "あなたの負け"
            case 1:
                msg = "あなたの勝ち"
            case 2:
                msg = "あいこ"
            default:
               break
            }
            
        default:
            break
        }
    
        messageLabel .text = msg
    }
    
    
}

