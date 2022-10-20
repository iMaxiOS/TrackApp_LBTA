//
//  RecentTransactionList.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Recent transaction")
                    .bold()
                
                Spacer()
                
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing: 6) {
                        Text("Show All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
            
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactions = TransactionListViewModel()
        transactions.transactions = transactionListMockData
        return transactions
    }()
    
    static var previews: some View {
        Group {
            RecentTransactionList()
            RecentTransactionList()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
