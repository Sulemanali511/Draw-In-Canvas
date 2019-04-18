//
//  ViewController.swift
//  Draw In Canvas
//
//  Created by hosam on 4/17/19.
//  Copyright © 2019 hosam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let canva = Canvas()
    
    lazy var undoBut:UIButton = {
       let bt = UIButton()
        bt.setTitle("Undo", for: .normal)
        bt.setTitleColor(UIColor.blue, for: .normal)
        bt.addTarget(self, action: #selector(handleUndo), for: .touchUpInside)
        return bt
    }()
    lazy var redBut:UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .red
        bt.addTarget(self, action: #selector(handleChoseColor), for: .touchUpInside)
        return bt
    }()
    lazy var blueBut:UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .blue
        bt.addTarget(self, action: #selector(handleChoseColor), for: .touchUpInside)
        return bt
    }()
    lazy var grayBut:UIButton = {
        let bt = UIButton()
        bt.backgroundColor = .gray
        bt.addTarget(self, action: #selector(handleChoseColor), for: .touchUpInside)
        return bt
    }()
    lazy var clearBut:UIButton = {
        let bt = UIButton()
        bt.setTitle("Clear", for: .normal)
        bt.setTitleColor(UIColor.blue, for: .normal)
        bt.addTarget(self, action: #selector(handleClear), for: .touchUpInside)
        return bt
    }()
    lazy var sliderVal :UISlider = {
        let sl = UISlider()
        sl.minimumValue = 5
        sl.maximumValue = 20
         sl.addTarget(self, action: #selector(handleLineWidth), for: .valueChanged)
        return sl
    } ()
    
    override func loadView() {
        self.view = canva
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        canva.backgroundColor = .white
        
        setupViews()
    }

    //mark: -USER METHODS
    
    func setupViews()  {
        let stacks = UIStackView(arrangedSubviews: [redBut,blueBut,grayBut])
        stacks.axis = .horizontal
        stacks.distribution = .fillEqually
        
        
        view.addSubview(clearBut)
        view.addSubview(undoBut)
         view.addSubview(stacks)
        view.addSubview(sliderVal)
        
        clearBut.anchor(top: nil, leading: view.leadingAnchor, trialing: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor,padding: .init(top: 0, left: 16, bottom: 8, right: 0))
         undoBut.anchor(top: nil, leading: clearBut.trailingAnchor, trialing: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor,padding: .init(top: 0, left: 16, bottom: 8, right: 0))
        stacks.anchor(top: nil, leading: undoBut.trailingAnchor, trialing: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor,padding: .init(top: 0, left: 16, bottom: 8, right: 0))
         sliderVal.anchor(top: nil, leading: stacks.trailingAnchor, trialing: view.trailingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor,padding: .init(top: 0, left: 16, bottom: 8, right: 16))
    }

    //TODO: -@objc  METHODS
    
    @objc func handleUndo(){
       canva.undo()
    }
    
    @objc func handleClear(){
       canva.clearAll()
    }
    
    @objc func handleChoseColor(sender: UIButton){
      canva.chosenColor(color: sender.backgroundColor ?? .orange)
    }
    
    @objc func handleLineWidth(sender: UISlider){
        canva.chosenLineWdth(width: sender.value )
    }
}

