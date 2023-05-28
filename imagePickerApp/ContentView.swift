//
//  ContentView.swift
//  imagePickerApp
//
//  Created by Veronica Cheung on 5/27/23.
//

import SwiftUI

struct ContentView: View {
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        VStack {
            Image(uiImage: selectedImage ?? UIImage(named: "cameraPic")!)
                .resizable()
                .frame(width: 360, height: 360)
            
            HStack{
                Button(action: {
                    isImagePickerShowing = true
                }) {
                    Text("Select a Photo")
                    
                }
            }
        }
        .padding()
        
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(isImagePickerShowing: $isImagePickerShowing, selectedImage: $selectedImage)
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
