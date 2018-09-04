//
//  Utils.swift
//  TLVChallenge
//
//  Created by Aurora Rodríguez on 9/3/18.
//  Copyright © 2018 Aurora Rodríguez. All rights reserved.
//

import Foundation

func cleanHexadecimalString(_ hexString: String) -> String? {
  let str = hexString.uppercased()
  let str1 = str.replacingOccurrences(of: "0X", with: "")
  let hexOnly = NSCharacterSet(charactersIn:"0123456789ABCDEF").inverted
  let cleanString = str1.components(separatedBy: hexOnly).joined()
  if cleanString.count % 2 != 0 {
    return nil
  }
  return cleanString
}

func getEmvTag(code: String) -> EMVTag {
  switch code {
  case "9F01":
    return EMVTag.init(name: "Acquirer Identifier")
  case "9F40":
    return EMVTag.init(name: "Additional Terminal Capabilities")
  case "81":
    return EMVTag.init(name: "Amount, Authorised (Binary)")
  case "9F02":
    return EMVTag.init(name: "Amount, Authorised (Numeric)")
  case "9F04":
    return EMVTag.init(name: "Amount, Other (Binary)")
  case "9F03":
    return EMVTag.init(name: "Amount, Other (Numeric)")
  case "9F3A":
    return EMVTag.init(name: "Amount, Reference Currency")
  case "9F26":
    return EMVTag.init(name: "Application Cryptogram")
  case "9F42":
    return EMVTag.init(name: "Application Currency Code")
  case "9F44":
    return EMVTag.init(name: "Application Currency Exponent")
  case "9F05":
    return EMVTag.init(name: "Application Discretionary Data")
  case "5F25":
    return EMVTag.init(name: "Application Effective Date")
  case "5F24":
    return EMVTag.init(name: "Application Expiration Date")
  case "94":
    return EMVTag.init(name: "Application File Locator (AFL)")
  case "4F":
    return EMVTag.init(name: "Application Identifier (AID) – card")
  case "9F06":
    return EMVTag.init(name: "Application Identifier (AID) – terminal")
  case "82":
    return EMVTag.init(name: "Application Interchange Profile")
  case "50":
    return EMVTag.init(name: "Application Label")
  case "9F12":
    return EMVTag.init(name: "Application Preferred Name")
  case "5A":
    return EMVTag.init(name: "Application Primary Account Number (PAN)")
  case "5F34":
    return EMVTag.init(name: "Application Primary Account Number (PAN) Sequence Number")
  case "87":
    return EMVTag.init(name: "Application Priority Indicator")
  case "9F3B":
    return EMVTag.init(name: "Application Reference Currency")
  case "9F43":
    return EMVTag.init(name: "Application Reference Currency Exponent")
  case "—":
    return EMVTag.init(name: "Application Selection Indicator")
  case "61":
    return EMVTag.init(name: "Application Template")
  case "9F36":
    return EMVTag.init(name: "Application Transaction Counter (ATC)")
  case "9F07":
    return EMVTag.init(name: "Application Usage Control")
  case "9F08", "9F09":
    return EMVTag.init(name: "Application Version Number")
  case "89":
    return EMVTag.init(name: "Authorisation Code")
  case "8A":
    return EMVTag.init(name: "Authorisation Response Code")
  case "5F54":
    return EMVTag.init(name: "Bank Identifier Code (BIC)")
  case "8C":
    return EMVTag.init(name: "Card Risk Management Data Object List 1 (CDOL1)")
  case "8D":
    return EMVTag.init(name: "Card Risk Management Data Object List 2 (CDOL2)")
  case "5F20":
    return EMVTag.init(name: "Cardholder Name")
  case "9F0B":
    return EMVTag.init(name: "Cardholder Name Extended")
  case "8E":
    return EMVTag.init(name: "Cardholder Verification Method (CVM) List")
  case "9F34":
    return EMVTag.init(name: "Cardholder Verification Method (CVM) Results")
  case "8F", "9F22":
    return EMVTag.init(name: "Certification Authority Public Key Index")
  case "83":
    return EMVTag.init(name: "Command Template")
  case "9F27":
    return EMVTag.init(name: "Cryptogram Information Data")
  case "9F45":
    return EMVTag.init(name: "Data Authentication Code")
  case "84":
    return EMVTag.init(name: "Dedicated File (DF) Name")
  case "9D":
    return EMVTag.init(name: "Directory Definition File (DDF) Name")
  case "73":
    return EMVTag.init(name: "Directory Discretionary Template")
  case "9F49":
    return EMVTag.init(name: "Dynamic Data Authentication Data Object List (DDOL)")
  case "70":
    return EMVTag.init(name: "EMV Proprietary Template")
  case "BF0C":
    return EMVTag.init(name: "File Control Information (FCI) Issuer Discretionary Data")
  case "A5":
    return EMVTag.init(name: "File Control Information (FCI) Proprietary Template")
  case "6F":
    return EMVTag.init(name: "File Control Information (FCI) Template")
  case "9F4C":
    return EMVTag.init(name: "ICC Dynamic Number")
  case "9F2D":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Certificate")
  case "9F2E":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Exponent")
  case "9F2F":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) PIN Encipherment Public Key Remainder")
  case "9F46":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) Public Key Certificate")
  case "9F47":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) Public Key Exponent")
  case "9F48":
    return EMVTag.init(name: "Integrated Circuit Card (ICC) Public Key Remainder")
  case "9F1E":
    return EMVTag.init(name: "Interface Device (IFD) Serial Number")
  case "5F53":
    return EMVTag.init(name: "International Bank Account Number (IBAN)")
  case "9F0D":
    return EMVTag.init(name: "Issuer Action Code – Default")
  case "9F0E":
    return EMVTag.init(name: "Issuer Action Code – Denial")
  case "9F0F":
    return EMVTag.init(name: "Issuer Action Code – Online")
  case "9F10":
    return EMVTag.init(name: "Issuer Application Data")
  case "91":
    return EMVTag.init(name: "Issuer Authentication Data")
  case "9F11":
    return EMVTag.init(name: "Issuer Code Table Index")
  case "5F28":
    return EMVTag.init(name: "Issuer Country Code")
  case "5F55":
    return EMVTag.init(name: "Issuer Country Code (alpha2 format)")
  case "5F56":
    return EMVTag.init(name: "Issuer Country Code (alpha3 format)")
  case "42":
    return EMVTag.init(name: "Issuer Identification Number (IIN)")
  case "90":
    return EMVTag.init(name: "Issuer Public Key Certificate")
  case "9F32":
    return EMVTag.init(name: "Issuer Public Key Exponent")
  case "92":
    return EMVTag.init(name: "Issuer Public Key Remainder")
  case "86":
    return EMVTag.init(name: "Issuer Script Command")
  case "9F18":
    return EMVTag.init(name: "Issuer Script Identifier")
  case "71":
    return EMVTag.init(name: "Issuer Script Template 1")
  case "72":
    return EMVTag.init(name: "Issuer Script Template 2")
  case "5F50":
    return EMVTag.init(name: "Issuer URL")
  case "5F2D":
    return EMVTag.init(name: "Language Preference")
  case "9F13":
    return EMVTag.init(name: "Last Online Application Transaction Counter (ATC) Register")
  case "9F4D":
    return EMVTag.init(name: "Log Entry")
  case "9F4F":
    return EMVTag.init(name: "Log Format")
  case "9F14":
    return EMVTag.init(name: "Lower Consecutive Offline Limit")
  case "9F15":
    return EMVTag.init(name: "Merchant Category Code")
  case "9F16":
    return EMVTag.init(name: "Merchant Identifier")
  case "9F4E":
    return EMVTag.init(name: "Merchant Name and Location")
  case "9F17":
    return EMVTag.init(name: "Personal Identification Number (PIN) Try Counter")
  case "9F39":
    return EMVTag.init(name: "Point-of-Service (POS) Entry Mode")
  case "9F38":
    return EMVTag.init(name: "Processing Options Data Object List (PDOL)")
  case "80":
    return EMVTag.init(name: "Response Message Template Format 1")
  case "77":
    return EMVTag.init(name: "Response Message Template Format 2")
  case "5F30":
    return EMVTag.init(name: "Service Code")
  case "88":
    return EMVTag.init(name: "Short File Identifier (SFI)")
  case "9F4B":
    return EMVTag.init(name: "Signed Dynamic Application Data")
  case "93":
    return EMVTag.init(name: "Signed Static Application Data")
  case "9F4A":
    return EMVTag.init(name: "Static Data Authentication Tag List")
  case "9F33":
    return EMVTag.init(name: "Terminal Capabilities")
  case "9F1A":
    return EMVTag.init(name: "Terminal Country Code")
  case "9F1B":
    return EMVTag.init(name: "Terminal Floor Limit")
  case "9F1C":
    return EMVTag.init(name: "Terminal Identification")
  case "9F1D":
    return EMVTag.init(name: "Terminal Risk Management Data")
  case "9F35":
    return EMVTag.init(name: "Terminal Type")
  case "95":
    return EMVTag.init(name: "Terminal Verification Results")
  case "9F1F":
    return EMVTag.init(name: "Track 1 Discretionary Data")
  case "9F20":
    return EMVTag.init(name: "Track 2 Discretionary Data")
  case "57":
    return EMVTag.init(name: "Track 2 Equivalent Data")
  case "98":
    return EMVTag.init(name: "Transaction Certificate (TC) Hash Value")
  case "97":
    return EMVTag.init(name: "Transaction Certificate Data Object List (TDOL)")
  case "5F2A":
    return EMVTag.init(name: "Transaction Currency Code")
  case "5F36":
    return EMVTag.init(name: "Transaction Currency Exponent")
  case "9A":
    return EMVTag.init(name: "Transaction Date")
  case "99":
    return EMVTag.init(name: "Transaction Personal Identification Number (PIN) Data")
  case "9F3C":
    return EMVTag.init(name: "Transaction Reference Currency Code")
  case "9F3D":
    return EMVTag.init(name: "Transaction Reference Currency Exponent")
  case "9F41":
    return EMVTag.init(name: "Transaction Sequence Counter")
  case "9B":
    return EMVTag.init(name: "Transaction Status Information")
  case "9F21":
    return EMVTag.init(name: "Transaction Time")
  case "9C":
    return EMVTag.init(name: "Transaction Type")
  case "9F37":
    return EMVTag.init(name: "Unpredictable Number")
  case "9F23":
    return EMVTag.init(name: "Upper Consecutive Offline Limit")
  default:
    return EMVTag.init(name: "Unknown tag")
  }
  
}
