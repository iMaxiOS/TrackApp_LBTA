//
//  ContentView.swift
//  Tracker_SwiftUI_LBTA
//
//  Created by Maxim Hranchenko on 19.10.2022.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionsVM: TransactionListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    let data = transactionsVM.accomulateTransactions()
                    let totalExpenses = data.last?.1 ?? 0
                    CardView {
                        VStack(alignment: .leading) {
                            ChartLabel(
                                totalExpenses.formatted(.currency(code: "USD")),
                                type: .title,
                                format: "$%.02f"
                            )
                            LineChart()
                        }
                        .background(Color.systemBackground)
                    }
                    .data(data)
                    .chartStyle(
                        ChartStyle(
                            backgroundColor: Color.systemBackground,
                            foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)
                        )
                    )
                    .frame(height: 300)
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactions = TransactionListViewModel()
        transactions.transactions = transactionListMockData
        return transactions
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
