//
//  WeatherViewController.swift
//  WeatherTracker
//
//  Created by Amjad on 17/01/25.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let vm: WeatherViewModel
    
    init(vm: WeatherViewModel = .init()) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemCyan
    }
}
