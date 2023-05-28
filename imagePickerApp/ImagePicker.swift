//
//  ImagePicker.swift
//  imagePickerApp
//
//  Created by Veronica Cheung on 5/27/23.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var isImagePickerShowing: Bool
    @Binding var selectedImage: UIImage?
    func makeUIViewController(context: Context) -> some UIViewController {
            
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
        
            imagePicker.delegate = context.coordinator
        
            return imagePicker
        }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
        }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ImagePicker
    
    init(_ picker: ImagePicker) {
        self.parent = picker
    }
    
    func imagePickerController(_ Picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    DispatchQueue.main.async {
                        self.parent.selectedImage = image
                    }
                }
        parent.isImagePickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        parent.isImagePickerShowing = false
    }
}
