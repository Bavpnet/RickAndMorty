//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Alexandra Chupkova on 12.11.2023.
//

import UIKit

final class RMTabViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTabs()
  }

  private func setUpTabs() {
    let characterVC = RMCharacterViewController()
    let locationVC = RMLocationViewController()
    let episodeVC = RMEpisodeViewController()
    let settingsVC = RMAboutViewController()

    characterVC.navigationItem.largeTitleDisplayMode = .automatic
    locationVC.navigationItem.largeTitleDisplayMode = .automatic
    episodeVC.navigationItem.largeTitleDisplayMode = .automatic
    settingsVC.navigationItem.largeTitleDisplayMode = .automatic

    let nav1 = UINavigationController(rootViewController: characterVC)
    let nav2 = UINavigationController(rootViewController: locationVC)
    let nav3 = UINavigationController(rootViewController: episodeVC)
    let nav4 = UINavigationController(rootViewController: settingsVC)

    nav1.tabBarItem = UITabBarItem(
      title: "Characters",
      image: UIImage(systemName: "person.fill"),
      tag: 1)
    //        nav2.tabBarItem = UITabBarItem(title:"Locations",
    //                                    image: UIImage(systemName: "globe.americas"),
    //                                    tag: 2)
    //        nav3.tabBarItem = UITabBarItem(title:"Episodes",
    //                                    image: UIImage(systemName: "play.tv"),
    //                                    tag: 3)
    nav4.tabBarItem = UITabBarItem(
      title: "About",
      image: UIImage(systemName: "i.circle.fill"),
      tag: 4)

    for nav in [nav1, nav4] {
      nav.navigationBar.prefersLargeTitles = true

    }

    setViewControllers(
      [nav1, nav4],
      animated: true)
  }

}
