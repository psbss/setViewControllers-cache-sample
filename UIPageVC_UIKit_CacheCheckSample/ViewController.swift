//
//  ViewController.swift
//  UIPageVC_UIKit_CacheCheckSample
//
//  Created by uehara yuki on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.green
        let btn: UIButton = UIButton(frame: CGRect(x: 0, y: 50, width: self.view.frame.width/2, height: self.view.frame.height/4))
        btn.backgroundColor = .white
        btn.setTitle("btn", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(ViewController.nextBtn(_:)), for: .touchUpInside)

        self.view.addSubview(btn)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @objc func nextBtn(_ sender: UIButton) {
        print("HQ")
        let vc = NextVC()
        vc.view.backgroundColor = UIColor.blue
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class FirstVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
    }
}
