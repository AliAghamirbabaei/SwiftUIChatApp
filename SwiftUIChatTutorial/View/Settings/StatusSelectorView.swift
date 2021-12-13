//
//  StatusSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Ali Aghamirbabaei on 12/13/21.
//

import SwiftUI

struct StatusSelectorView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView{
                VStack(alignment: .leading){
                    Text("CURRENTLY SET TO")
                        .foregroundColor(.gray)
                        .padding()
                    
                    StatusCell(viewModel: StatusViewModel(rawValue: 4)!)
  
                    Text("SELECT YOUR STATUS")
                        .foregroundColor(.gray)
                        .padding()
                    
                    // for loop with options
                    
                    ForEach(StatusViewModel.allCases.filter({$0 != .notConfigured}), id: \.self) { viewModel in
                        Button(action: {
                            
                        }, label: {
                            StatusCell(viewModel: viewModel)
                        })
                    }
                }
            }
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}

struct StatusCell: View {
    let viewModel: StatusViewModel
    var body: some View {
        HStack {
            Text(viewModel.title)
                .foregroundColor(.black)
            Spacer()
        }
        .frame(height: 56)
        .padding(.horizontal)
        .background(Color.white)
    }
}
