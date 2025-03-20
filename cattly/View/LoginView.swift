//
//  LoginView.swift
//  cattly
//
//  Created by Bao Le Ha Gia on 20/3/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = "saroncately@gmail.com"
    @State private var password: String = "password"
    @State private var isPasswordVisible: Bool = false
    @State private var rememberMe: Bool = true
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                VStack() {
                    Text(NSLocalizedString("cattly", comment: "cattly"))
                        .font(.custom("jsMath-cmmi10", size: 32))
                        .fontWeight(.medium)
                        .foregroundColor(Color("PrimaryColor")).italic()
                    
                    Text(NSLocalizedString("welcome_to_cattly", comment: "welcome_to_cattly"))
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color("GrayColor")).italic()
                    
                    Image("paw_icon")
                        .frame(width: 45, height: 45)
                        .foregroundColor(Color("PrimaryColor"))
                        .padding(.top, 40)
                }
                .frame(height: geometry.size.height * 0.3)
                
                VStack(alignment: .leading, spacing: 15) {
                    // Email field
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                        Text(NSLocalizedString("email", comment: "email"))
                            .font(.system(size: 12))
                            .foregroundColor(Color("GrayColor"))
                            .padding(.horizontal, 16)
                        
                        TextField("", text: $email)
                            .font(.system(size: 16))
                            .foregroundColor(Color("BlackColor"))
                            .padding(.horizontal, 16)
                        Spacer()
                    }
                    .frame(height: 70.0)
                    .background(Color("WhiteColor").cornerRadius(12))
                    .shadow(color: Color("PrimaryColor").opacity(0.15), radius: 12, x: 0, y: 4)
                    
                    
                    // Password field
                    VStack(alignment: .leading, spacing: 8) {
                        Spacer()
                        Text(NSLocalizedString("password", comment: "password"))
                            .font(.system(size: 12))
                            .foregroundColor(Color("GrayColor"))
                            .padding(.horizontal, 16)
                        
                        HStack {
                            if isPasswordVisible {
                                TextField("", text: $password)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("BlackColor"))
                            } else {
                                SecureField("", text: $password)
                                    .font(.system(size: 16))
                                    .foregroundColor(Color("BlackColor"))
                            }
                            
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(Color("GrayColor"))
                                    .frame(width: 8.0, height: 8.0)
                                    .padding(.horizontal, 8)
                            }
                        }
                        .padding(.horizontal, 16)
                        Spacer()
                    }
                    .frame(height: 70.0)
                    .background(Color("WhiteColor").cornerRadius(12))
                    .shadow(color: Color("PrimaryColor").opacity(0.15), radius: 12, x: 0, y: 4)
                    
                    // Remember me and forgot password
                    HStack {
                        Button(action: {
                            rememberMe.toggle()
                        }) {
                            HStack(spacing: 8) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(rememberMe ? Color("PrimaryColor") : Color.clear)
                                        .frame(width: 18, height: 18)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 4)
                                                .stroke(rememberMe ? Color("PrimaryColor") : Color("GrayColor"), lineWidth: 1)
                                        )
                                    
                                    if rememberMe {
                                        Image(systemName: "checkmark")
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(.white)
                                    }
                                }
                                
                                Text(NSLocalizedString("remember_me", comment: "remember_me"))
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("GrayColor"))
                            }
                        }
                        
                        Spacer()
                        Button(action: {
                        }) {
                            Text(NSLocalizedString("forgot_password", comment: "forgot_password"))
                                .font(.system(size: 12))
                                .foregroundColor(Color("PrimaryColor"))
                                .underline()
                        }
                    }.padding(.horizontal, 16)
                    
                    // Sign in button
                    Button(action: {
                    }) {
                        Text(NSLocalizedString("sign_in", comment: "sign_in"))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 195, height: 56)
                            .background(Color("PrimaryColor"))
                            .cornerRadius(25)
                            .shadow(color: Color("PrimaryColor").opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 20)
                }
                .padding(.horizontal, 16)
                
                // Or divider
                HStack {
                    Divider()
                        .frame(width: 83.0, height: 1.0)
                        .background(Color("GrayColor"))
                    
                    Text(NSLocalizedString("or", comment: "or"))
                        .font(.system(size: 12))
                        .foregroundColor(Color("GrayColor"))
                        .padding(.horizontal, 10)
                    
                    Divider()
                        .frame(width: 83.0, height: 1.0)
                        .background(Color("GrayColor"))
                }
                .padding(.vertical, 30)
                
                // Social login buttons
                HStack(spacing: 20) {
                    // Facebook login
                    Button(action: {
                        // Facebook login action
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 40, height: 40)
                            
                            Text("f")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .shadow(color: Color("PrimaryColor").opacity(0.4), radius: 10, x: 0, y: 4)
                    }
                    
                    // Google login
                    Button(action: {
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color("PrimaryColor"))
                                .frame(width: 40, height: 40)
                            
                            Text("G")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .shadow(color: Color("PrimaryColor").opacity(0.4), radius: 10, x: 0, y: 4)
                    }
                }
                
                // Sign up text
                HStack(spacing: 4) {
                    Text(NSLocalizedString("do_not_have_an_account", comment: "do_not_have_an_account"))
                        .font(.system(size: 12))
                        .foregroundColor(Color("GrayColor"))
                    
                    Button(action: {
                        // Sign up action
                    }) {
                        Text(NSLocalizedString("sign_up_now", comment: "sign_up_now"))
                            .font(.system(size: 12))
                            .foregroundColor(Color("BlackColor"))
                            .underline()
                    }
                }
                .padding(.top, 30)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
