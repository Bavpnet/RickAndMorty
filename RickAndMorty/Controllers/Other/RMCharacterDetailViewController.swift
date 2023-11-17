//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 16.11.2023.
//

import UIKit

final class RMCharacterDetailViewController: UIViewController {
    
    private let viewModel: RMCharacterDetailViewViewModel
    
    init (viewModel: RMCharacterDetailViewViewModel ){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported yet :(")
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
        
        // Do any additional setup after loading the view.
    }

}
