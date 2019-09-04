import UIKit

class ProgramaticAutoLayoutViewController: UIViewController {

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let margins = view.layoutMarginsGuide

        let label = UILabel(frame: .zero)
        label.backgroundColor = .yellow
        label.text = "Hello Layout Constraints"
        view.addSubview(label)

        let label2 = UILabel(frame: .zero)
        label2.backgroundColor = .orange
        label2.text = "Another Label"
        view.addSubview(label2)

        var buttons = [UIButton]()
        for i in 1 ... 3 {
            let btn = UIButton(type: .system)
            btn.setTitle("Button \(i)", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            buttons.append(btn)
        }

        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.spacing = 10
        view.addSubview(stackView)

        stackView.setCustomSpacing(30, after: buttons.first!)

        label.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: margins.trailingAnchor),

            label2.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            label2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            label2.widthAnchor.constraint(equalToConstant: 200),

            stackView.leadingAnchor.constraint(equalTo: label2.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 10),
        ])

        self.view = view
    }

}
