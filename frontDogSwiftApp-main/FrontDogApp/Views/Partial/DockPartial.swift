////
////  DockView.swift
////  FrontDogApp
////
////  Created by Thibault Garrigues on 17/01/2024.
////
//
//import SwiftUI
//
//struct DockView: View {
//    var body: some View {
//        
//        HStack {
//            //: HomeView button
//            Spacer()
//                .navigationBarHidden(true)
//            NavigationLink(destination: HomeView()) {
//                Image(systemName: "crop")
//                    .frame(width: 50, height: 30)
//                    .padding()
//                
//            }
//            .buttonStyle(PlainButtonStyle())
//            .edgesIgnoringSafeArea(.bottom)
//            
//            //: MatchsView button
//            
//            Spacer()
//            NavigationLink(destination: MatchsView(selectedTab: $selectedTab)) {
//                Image(systemName: "heart")
//                    .frame(width: 50, height: 30)
//                    .padding()
//                
//                
//                Spacer()
//                //: MessagesView button
//                Image(systemName: "ellipsis.message")
//                    .frame(width: 50, height: 30)
//                    .padding()
//                Spacer()
//                //: SettingsView button
//                Image(systemName: "gear")
//                    .frame(width: 50, height: 30)
//                    .padding()
//                Spacer()
//                
//            }
//            
//            
//        }//:HStack
//        .padding(.bottom, 20.0)
//    }
// 
//
//}
//
//#Preview {
//    DockView()
//}
