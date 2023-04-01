//
//  SignUpView.swift
//  workspace
//
//  Created by Vlad on 26.03.2023.
//

import SwiftUI

struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)

            TextField("Username", text: $username)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            TextField("Email", text: $email)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            SecureField("Confirm Password", text: $confirmPassword)
                .padding(.horizontal)
                .frame(height: 50)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)

            Button(action: {
                           // Действие, которое происходит при нажатии на кнопку регистрации
                
                       }) {
                           Text("Sign Up")
                               .foregroundColor(.blue)
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.white)
                               .cornerRadius(10)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 10)
                                       .stroke(Color.blue, lineWidth: 2)
                               )
                               .padding(.horizontal)
                       }

            Spacer()
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

