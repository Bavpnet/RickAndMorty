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
        
        RMService.shared.execute(.listCharactersRequest, expecting: RMGetAllCharactersResponse.self) { result in
            switch result{
            case .success (let model):
                print(String(describing: model))
            case .failure (let error):
                print( String(describing: error))
        }
        }
        
    }
    
    

}
