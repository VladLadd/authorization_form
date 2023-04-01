//
//  ContentView.swift
//  workspace
//
//  Created by Vlad on 26.03.2023.
//

import SwiftUI



struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggingIn = false
    @State private var loginError = false
    @State private var errorMess = ""
    
    @State private var isProfileActive = false
    
    func goToProfile() {
        isProfileActive = true
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "lock.shield.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 50)
                    .foregroundColor(.blue)
                
                Text("Login to workspace")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                TextField("Username", text: $username)
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
                
                if loginError {
                    Text(errorMess)
                        .font(.subheadline)
                        .foregroundColor(.red)
                        .padding(.top, 10)
                }
                
                Button(action: {
                    isLoggingIn = true
                    login(username: username, password: password) { result in
                        switch result {
                        case .success(let _isLoggedIn):
                            if _isLoggedIn {
                                // Действие при успешной авторизации
                                errorMess = "OK!"
                                goToProfile()
                            } else {
                                // Действие при неудачной авторизации
                                loginError = true
                                errorMess = "Failed authorization"
                            }
                        case .failure(_):
                            // Действие при ошибке авторизации
                            loginError = true
                            errorMess = "Error login"
                        }
                    }
                    
                }) {
                    Text("Log In")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Button(action: {
                    goToSignUp()
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
                
                NavigationLink(
                               destination: ProfileView(),
                               isActive: $isProfileActive,
                               label: { EmptyView() }
                           )
            }
        }.padding()
        
        
    }
     
    func _completion() {
        
    }
    
    func goToSignUp() {
        let signUpView = SignUpView()
        let signUpViewHosting = UIHostingController(rootView: signUpView)
        UIApplication.shared.windows.first?.rootViewController?.present(signUpViewHosting, animated: true, completion: nil)
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
