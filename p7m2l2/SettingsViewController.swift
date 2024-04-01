//
//  SettingsViewController.swift
//  p7m2l2
//
//  Created by m.kushakov on 31.03.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    //Для удобства, значения, которые используются несколько раз вынес отдельно
    private lazy var screenHeight = UIScreen.main.bounds.height
    private lazy var screenWidth = view.frame.width

    private let offsetFromScreenBorders: CGFloat = 30
    private let offsetFromAvatar: CGFloat = 16
    private let verticSpace: CGFloat = 8

    private let labelsWidth: CGFloat = 200
    private let labelsHeight: CGFloat = 20
    private let textFieldsHeight: CGFloat = 52
    private let saveButtonHeight: CGFloat = 55

    /*
     При расчетах высоты некоторых элементов или вертикального отступа использовал коэффиценты,
     чтобы верстка смотрелась приемлемо на всех экранах начиная с SE третьего поколения
     */

    //MARK: - Creating ImageView
    private lazy var topImage = createImageView(image: "topImage",
                                                frame: CGRect(origin: CGPoint(x: 0,
                                                                              y: 0),
                                                              size: CGSize(width: screenWidth,
                                                                           height: screenHeight * 0.167)))

    //TODO: Правильно рассчитать закругление
    private lazy var avatarImage = createImageView(image: "avatarImage",
                                                   radius: 50,
                                                   frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                                 y: screenHeight * 0.2),
                                                                 size: CGSize(width: 100,
                                                                              height: 100)))

    //MARK: - Creating Labels
    private lazy var userNameLabel = createLabel(text: "Имя Фамилия",
                                                 weight: .bold,
                                                 frame: CGRect(origin: CGPoint(x: avatarImage.frame.maxX + offsetFromAvatar,
                                                                               y: avatarImage.frame.minY + 18),
                                                                  size: CGSize(width: labelsWidth,
                                                                               height: labelsHeight)))

    private lazy var descriptionLabel = createLabel(text: "Добавить описание",
                                                 weight: .regular,
                                                 frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                               y: screenHeight * 0.37),
                                                                  size: CGSize(width: labelsWidth,
                                                                               height: labelsHeight)))

    private lazy var changePasswordLabel = createLabel(text: "Изменить пароль",
                                                 weight: .regular,
                                                 frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                               y: descriptionTextView.frame.maxY + screenHeight * 0.034),
                                                                  size: CGSize(width: labelsWidth,
                                                                               height: labelsHeight)))

    //MARK: - Creating Buttons

    private lazy var editButton = createButton(title: "Редактировать",
                                               frame: CGRect(origin: CGPoint(x: avatarImage.frame.maxX + offsetFromAvatar,
                                                                             y: userNameLabel.frame.maxY + verticSpace),
                                                                size: CGSize(width: 147,
                                                                             height: 34)))

    private lazy var saveButton = createButton(title: "Сохранить",
                                               frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                             y: screenHeight - 52 - saveButtonHeight),
                                                                size: CGSize(width: screenWidth - offsetFromScreenBorders * 2,
                                                                             height: saveButtonHeight)))

    //MARK: - Creating TextFields

    private lazy var oldPasswordTextField = createTextField(placeHolder: "Старый пароль",
                                                            frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                                          y: changePasswordLabel.frame.maxY + verticSpace),
                                                                          size: CGSize(width: screenWidth - offsetFromScreenBorders * 2,
                                                                                       height: textFieldsHeight)))

    private lazy var newPasswordTextField = createTextField(placeHolder: "Новый пароль",
                                                            frame: CGRect(origin: CGPoint(x: offsetFromScreenBorders,
                                                                                          y: oldPasswordTextField.frame.maxY + verticSpace),
                                                                          size: CGSize(width: screenWidth - offsetFromScreenBorders * 2,
                                                                                       height: textFieldsHeight)))


    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.frame = CGRect(x: offsetFromScreenBorders,
                                y: descriptionLabel.frame.maxY + verticSpace,
                                width: screenWidth - offsetFromScreenBorders * 2,
                                height: screenHeight * 0.16)
        textView.backgroundColor = .systemGray6
        textView.layer.cornerRadius = 20
        return textView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }


    private func setupViews() {
        [topImage, avatarImage, userNameLabel, editButton, descriptionLabel, descriptionTextView,
         changePasswordLabel, oldPasswordTextField, newPasswordTextField, saveButton].forEach { view in
            self.view.addSubview(view)
        }
    }

    //MARK: Methods for create UI elements
    private func createButton(title: String, frame: CGRect) -> UIButton {
        let button = UIButton(type: .system)
        button.frame = frame
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        return button
    }

    private func createTextField(placeHolder: String, frame: CGRect) -> UITextField {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 1))
        let textField = UITextField(frame: frame)
        textField.placeholder = placeHolder
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }

    private func createLabel(text: String, weight: UIFont.Weight, frame: CGRect) -> UILabel {
        let label = UILabel(frame: frame)
        label.text = text
        label.font = UIFont.systemFont(ofSize: 16, weight: weight)
        label.textColor = .black
        return label
    }

    private func createImageView(image: String, radius: CGFloat = 0, frame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        imageView.image = UIImage(named: image)
        imageView.layer.cornerRadius = radius
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }
}
