//
//  SignUpView.swift
//  workspace
//
//  Created by Vlad on 26.03.2023.
//

import SwiftUI
import iPhoneNumberField

struct SignUpView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fromPhone = false
    @State private var phone = "0"
    @State private var errorMess = ""
    @State private var regError = false

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            if (!fromPhone) {

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
                
                if regError {
                    Text(errorMess)
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
            } else {
                iPhoneNumberField("Phone number", text: $phone)
                    .flagHidden(false)
                    .flagSelectable(true)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
            }
            

            Button(action: {
                register(username: username, email: email, password: password) {result in switch result {
                case .success(let _isRegistered):
                    if (_isRegistered) {
                        errorMess = "User \($username) was registered"
                    } else {
                        regError = true
                        errorMess = "Failed registration"
                    }
                case .failure(_):
                    regError = true
                    errorMess = "Failed registration"
                }
                    
                }
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
            if (!fromPhone) {
                Button(action: {fromPhone = true}) {
                    Text("register with phone number")
                        .foregroundColor(.green)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.white)
                }
            } else {
                Button(action: {fromPhone = false}) {
                    Text("register with phone email")
                        .foregroundColor(.green)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)
                        .background(Color.white)
                }
            }
            
        }
        .padding()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

