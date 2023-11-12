//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        
        
        let request = RMRequest (endpoint: .character,
        pathComponents: ["1"])
        print(request.url)
    }
    

}
