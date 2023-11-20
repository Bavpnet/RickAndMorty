import UIKit

final class RMAboutViewController: UIViewController {

  let aboutLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 20, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Rick and Morty application"
    label.numberOfLines = 0
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "About"
    view.addSubview(aboutLabel)
    setUpView()

    let firstString = "Rick and Morty application"
    let secondString =
      "Project dedicated to the animated series Rick and Morty, utilizing the https://rickandmortyapi.com/"

    let thirdString = "Project Architecture:"

    let fString =
      "Since the project is educational, it was important to learn the correct architecture, so there is a division into ViewModels, Views, and API Client"

    aboutLabel.text =
      firstString + "\n \n \n" + secondString + "\n \n" + thirdString + "\n \n \n" + fString + "\n"
  }

  private func setUpView() {
    NSLayoutConstraint.activate([
      aboutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
      aboutLabel.leadingAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
      aboutLabel.trailingAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
      aboutLabel.bottomAnchor.constraint(
        equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
    ])
  }
}
