//
//  BottomSheetViewController.swift
//  
//
//  Created by Fellipe Thufik Costa Gomes Hoashi  on 13/04/22.
//

import UIKit

public protocol Actions {
    func edit(at row: Int)
    func delete(at row: Int)
}

public class BottomSheetViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()
    
    lazy var bottomSheetTitle: MediumTextLabel = {
        MediumTextLabel(text: "O que deseja fazer?")
    }()
    
    lazy var optionsStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    lazy var editButton: SecondaryButton = {
        let button = SecondaryButton(title: "Editar")
        
        button.addTarget(self, action: #selector(edit), for: .touchUpInside)
        
        return button
    }()
    
    lazy var deleteButton: PrimaryButton = {
        let button = PrimaryButton(title: "Excluir")
        
        button.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
        
        return button
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()

    let defaultHeight: CGFloat = 200
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep updated with new height
    var currentContainerHeight: CGFloat = 200
    
    // 3. Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    private let delegate: Actions?
    
    private let row: Int
    
    required public init?(coder: NSCoder) {
        nil
    }
    
    public init(delegate: Actions?, row: Int) {
        self.delegate = delegate
        self.row = row
        
        super.init(nibName: nil, bundle: nil)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupPanGesture()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    @objc private func edit() {
        delegate?.edit(at: row)
        
        dismiss(animated: true)
    }
    
    @objc private func deleteItem() {
        delegate?.delete(at: row)
        
        dismiss(animated: true)
    }
    
    func animateDismissView() {
        // hide main container view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
    }
    
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        // Save current height
        currentContainerHeight = height
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // Drag to top will be minus value and vice versa
        print("Pan gesture y offset: \(translation.y)")

        // Get drag direction
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")

        // New height is based on value of dragging plus current container height
        let newHeight = currentContainerHeight - translation.y

        // Handle based on gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            if newHeight < defaultHeight {
                // Keep updating the height constraint
                containerViewHeightConstraint?.constant = newHeight
                // refresh layout
                view.layoutIfNeeded()
            }
        case .ended:
            // This happens when user stop drag,
            // so we will get the last height of container
            // Condition 1: If new height is below min, dismiss controller
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
//            else if newHeight < defaultHeight {
//                // Condition 2: If new height is below default, animate back to default
//                animateContainerHeight(defaultHeight)
//            }
//            else if newHeight < maximumContainerHeight && isDraggingDown {
//                // Condition 3: If new height is below max and going down, set to default height
//                animateContainerHeight(defaultHeight)
//            }
//            else if newHeight > defaultHeight && !isDraggingDown {
//                // Condition 4: If new height is below max and going up, set to max height at top
//                animateContainerHeight(maximumContainerHeight)
//            }
        default:
            break
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animatePresentContainer() {
        // Update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        // 4. Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        
        containerView.addSubview(bottomSheetTitle)
        containerView.addSubview(optionsStackView)
        
        optionsStackView.addArrangedSubview(editButton)
        optionsStackView.addArrangedSubview(deleteButton)
        
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        bottomSheetTitle.topAnchor(equalTo: containerView.topAnchor, constant: 32)
        bottomSheetTitle.leadingAnchor(equalTo: containerView.leadingAnchor, constant: 16)
        
        optionsStackView.topAnchor(equalTo: bottomSheetTitle.bottomAnchor, constant: 32)
        optionsStackView.leadingAnchor(equalTo: containerView.leadingAnchor, constant: 16)
        optionsStackView.trailingAnchor(equalTo: containerView.trailingAnchor, constant: -16)
        
        editButton.heightAnchor(equalTo: 50)
        deleteButton.heightAnchor(equalTo: 50)
        
        // 5. Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        // 6. Set container to default height
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        // 7. Set bottom constant to 0
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
}
