//
//  utils.swift
//  SuzuchiGinkoApp
//
//  Created by Agata Sasaki on 22/07/2023.
//

import Foundation


func createTimestampToTransactionsMapping(transactions: [Transaction]) -> [String: [Transaction]] {
    var timestampToTransactionsMapping: [String: [Transaction]]  = [:]
    for transaction in transactions {
        var timestampAsString = String(transaction.timestamp)
        if (timestampToTransactionsMapping[timestampAsString] == nil) {
            timestampToTransactionsMapping[timestampAsString] = [transaction]
        } else {
            var newTransactionsArray: [Transaction] = timestampToTransactionsMapping[timestampAsString]! + [transaction]
            timestampToTransactionsMapping[timestampAsString] = newTransactionsArray
        }
    }
    return timestampToTransactionsMapping
}

func parseDateObjToDateString(timestamp: Double) -> String {
    let oneSecond = 1000.0
    let unixEpochTimestamp = timestamp / oneSecond
    let nsDate = NSDate(timeIntervalSince1970: unixEpochTimestamp)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: nsDate as Date)
}

func decodePairIdToUserIds(pairId: String) -> [String] {
    return pairId.components(separatedBy: PAIR_ID_SEPARATOR)
}

func provideTransactionsMock(pariId: String) -> TransactionsSummary {
    if (pariId == "userWithId1_userWithId2") {
        return TransactionsSummary.TransactionsSummaryMock
    }
    return TransactionsSummary.TransactionsSummaryMock2
}
