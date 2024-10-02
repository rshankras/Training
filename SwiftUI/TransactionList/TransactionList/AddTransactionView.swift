//
//  AddTransactionView.swift
//  TransactionList
//
//  Created by Ravi Shankar on 01/10/24.
//

import SwiftUI

struct AddTransactionView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var transactions: [Transaction]
    
    @State private var amount: String = ""
    @State private var description: String = ""
    @State private var type: TransactionType = .debit
    @State private var date: Date = Date()
    
    var body: some View {
            VStack {
                Text("Add Transaction")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.bold)
                    .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
                    .padding()
                Form {
                    Section(header:Text("Transaction Details")) {
                        TextField("Amount", text: $amount)
                            .keyboardType(.decimalPad)
                        TextField("Description", text: $description)
                        Picker("Type", selection: $type) {
                            Text("Debit").tag(TransactionType.debit)
                            Text("Credit").tag(TransactionType.credit)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        DatePicker("Date", selection: $date, displayedComponents: .date)
                    }
                    Section() {
                        HStack {
                            Button("Save") {
                                saveTransaction()
                            }
                            Spacer()
                            Button("Cancel") {
                                dismiss()
                            }
                        }
                    }
                }
            }
    }
    
    private func saveTransaction() {
        guard let amountValue = Double(amount), !description.isEmpty else { return }
        
        let newTransaction = Transaction(
            id: UUID(),
            date: date,
            amount: amountValue,
            description: description,
            type: type
        )
        
        transactions.append(newTransaction)
        dismiss()
    }
}

#Preview {
    AddTransactionView(transactions: .constant([Transaction]()))
}
